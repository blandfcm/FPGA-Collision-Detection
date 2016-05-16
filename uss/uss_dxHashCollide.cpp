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
