//ode/src/collision_space.cpp:421:void dxHashSpace::collide (void *data, dNearCallBack *callback)

void dxHashSpace::collide (void *data, dNearCallback *callback)
{
    dAASSERT(this && callback);
    dxGeom *geom;
    int i,maxlevel;

    // 0 or 1 geoms can't collide with anything
    if (count < 2) return;

    lock_count++;
    cleanGeoms();

    // create a list of auxiliary information for all geom axis aligned bounding
    // boxes. set the level for all AABBs. put AABBs larger than the space's
    // global_maxlevel in the big_boxes list, check everything else against
    // that list at the end. for AABBs that are not too big, record the maximum
    // level that we need.

    typedef std::vector<dxAABB> AABBlist;
    AABBlist hash_boxes; // list of AABBs in hash table
    AABBlist big_boxes; // list of AABBs too big for hash table
    maxlevel = global_minlevel - 1;
    for (geom = first; geom; geom=geom->next) {
        if (!GEOM_ENABLED(geom)){
            continue;
        }
        dxAABB aabb;
        aabb.geom = geom;
        // compute level, but prevent cells from getting too small
        int level = findLevel (geom->aabb);
        if (level < global_minlevel) level = global_minlevel;
        if (level <= global_maxlevel) {
            aabb.level = level;
            if (level > maxlevel) maxlevel = level;
            // cellsize = 2^level
            dReal cellsize = (dReal) ldexp (1.0,level);
            // discretize AABB position to cell size
            for (i=0; i < 6; i++)
                aabb.dbounds[i] = (int) floor (geom->aabb[i]/cellsize);
            // set AABB index
            aabb.index = hash_boxes.size();
            // aabb goes in main list
            hash_boxes.push_back(aabb);
        }
        else {
            // aabb is too big, put it in the big_boxes list. we don't care about
            // setting level, dbounds, index, or the maxlevel
            big_boxes.push_back(aabb);
        }
    }
    int n = hash_boxes.size(); // number of AABBs in main list
    // for `n' objects, an n*n array of bits is used to record if those objects
    // have been intersection-tested against each other yet. this array can
    // grow large with high n, but oh well...
    int tested_rowsize = (n+7) >> 3;    // number of bytes needed for n bits
    std::vector<unsigned char> tested(n * tested_rowsize);

    // create a hash table to store all AABBs. each AABB may take up to 8 cells.
    // we use chaining to resolve collisions, but we use a relatively large table
    // to reduce the chance of collisions.

    // compute hash table size sz to be a prime > 8*n
    for (i=0; i<NUM_PRIMES; i++) {
        if (prime[i] >= (8*n)) break;
    }
    if (i >= NUM_PRIMES)
        i = NUM_PRIMES-1;       // probably pointless
    int sz = prime[i];

    // allocate and initialize hash table node pointers
    std::vector<Node*> table(sz);
    // add each AABB to the hash table (may need to add it to up to 8 cells)
    for (AABBlist::iterator aabb=hash_boxes.begin(); aabb!=hash_boxes.end(); ++aabb) {
        const int *dbounds = aabb->dbounds;
        for (int xi = dbounds[0]; xi <= dbounds[1]; xi++) {
            for (int yi = dbounds[2]; yi <= dbounds[3]; yi++) {
                for (int zi = dbounds[4]; zi <= dbounds[5]; zi++) {
                    // get the hash index
                    unsigned long hi = getVirtualAddress (aabb->level,xi,yi,zi) % sz;
                    // add a new node to the hash table
                    Node *node = new Node;
                    node->x = xi;
                    node->y = yi;
                    node->z = zi;
                    node->aabb = &*aabb;
                    node->next = table[hi];
                    table[hi] = node;

                    cout << "Start" << endl;
                    cout << dbounds[0] << ", " << dbounds[1] << endl;
                    cout << dbounds[2] << ", " << dbounds[3] << endl;
                    cout << dbounds[4] << ", " << dbounds[5] << endl;

                }
            }
        }
    }
    // now that all AABBs are loaded into the hash table, we do the actual
    // collision detection. for all AABBs, check for other AABBs in the
    // same cells for collisions, and then check for other AABBs in all
    // intersecting higher level cells.

    int db[6];                  // discrete bounds at current level
    for (AABBlist::iterator aabb=hash_boxes.begin(); aabb!=hash_boxes.end(); ++aabb) {
        // we are searching for collisions with aabb
        for (i=0; i<6; i++) db[i] = aabb->dbounds[i];
        for (int level = aabb->level; level <= maxlevel; level++) {
            for (int xi = db[0]; xi <= db[1]; xi++) {
                for (int yi = db[2]; yi <= db[3]; yi++) {
                    for (int zi = db[4]; zi <= db[5]; zi++) {
                        // get the hash index
                        unsigned long hi = getVirtualAddress (level,xi,yi,zi) % sz;
                        // search all nodes at this index
                        for (Node* node = table[hi]; node; node=node->next) {
                            // node points to an AABB that may intersect aabb
                            if (node->aabb == &*aabb)
                                continue;
                            if (node->aabb->level == level &&
                                node->x == xi && node->y == yi && node->z == zi) {
                                    // see if aabb and node->aabb have already been tested
                                    // against each other
                                    unsigned char mask;
                                    if (aabb->index <= node->aabb->index) {
                                        i = (aabb->index * tested_rowsize)+(node->aabb->index >> 3);
                                        mask = 1 << (node->aabb->index & 7);
                                    }
                                    else {
                                        i = (node->aabb->index * tested_rowsize)+(aabb->index >> 3);
                                        mask = 1 << (aabb->index & 7);
                                    }
                                    dIASSERT (i >= 0 && i < (tested_rowsize*n));
                                    if ((tested[i] & mask)==0) {
                                        collideAABBs (aabb->geom,node->aabb->geom,data,callback);
                                    }
                                    tested[i] |= mask;
                            }
                        }
                    }
                }
            }
            // get the discrete bounds for the next level up
            for (i=0; i<6; i++)
                db[i] >>= 1;
        }
   }
       // every AABB in the normal list must now be intersected against every
    // AABB in the big_boxes list. so let's hope there are not too many objects
    // in the big_boxes list.
    for (AABBlist::iterator aabb=hash_boxes.begin(); aabb!=hash_boxes.end(); ++aabb) {
        for (AABBlist::iterator aabb2=big_boxes.begin(); aabb2!=big_boxes.end(); ++aabb2) {
            collideAABBs (aabb->geom,aabb2->geom,data,callback);
        }
    }

    // intersected all AABBs in the big_boxes list together
    for (AABBlist::iterator aabb=big_boxes.begin(); aabb!=big_boxes.end(); ++aabb) {
        for (AABBlist::iterator aabb2=big_boxes.begin(); aabb2!=big_boxes.end(); ++aabb2) {
            collideAABBs (aabb->geom,aabb2->geom,data,callback);
        }
    }

    // deallocate table
    for (size_t i=0; i<table.size(); ++i)
        for (Node* node = table[i]; node;) {
            Node* next = node->next;
            delete node;
            node = next;
        }

    lock_count--;
}


