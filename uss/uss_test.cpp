#include <ode/ode.h>
#include <drawstuff/drawstuff.h>
// dynamics and collision objects
static dWorldID world;
static dSpaceID space;

static dBodyID lsphere;	
static dGeomID lsphere_geom;	

static dBodyID rsphere;	
static dGeomID rsphere_geom;	

static dMass m;
static dJointGroupID contactgroup;

// this is called by dSpaceCollide when two objects in space are
// potentially colliding.
static void nearCallback (void *data, dGeomID o1, dGeomID o2)
{
    dBodyID b1 = dGeomGetBody(o1);
    dBodyID b2 = dGeomGetBody(o2);
    dContact contact;  
    contact.surface.mode = dContactBounce | dContactSoftCFM;
    // friction parameter
    contact.surface.mu = dInfinity;
    // bounce is the amount of "bouncyness".
    contact.surface.bounce = 1.0; 
    // bounce_vel is the minimum incoming velocity to cause a bounce
    contact.surface.bounce_vel = 0.1; //0.1
    // constraint force mixing parameter
    contact.surface.soft_cfm = 0.001;  
    if (int numc = dCollide (o1,o2,1,&contact.geom,sizeof(dContact))) {
        dJointID c = dJointCreateContact (world,contactgroup,&contact);
        dJointAttach (c,b1,b2);
    }
}

// start simulation - set viewpoint (camera)
static void start()
{
// Original View
//  static float xyz[3] = {2.0f,-2.0f,1.7600f};
//  static float hpr[3] = {136.000f,-17.0000f,0.0000f};
    
// force for the spheres
    dBodyAddForce(lsphere,200,0,0);
    dBodyAddForce(rsphere,-200,0,0);
// Top Down View
    static float xyz[3] = {-1.0f,1.0f,8.0f};
    static float hpr[3] = {0.0f,-90.0f,0.0f};
    dsSetViewpoint (xyz,hpr);
}

// simulation loop
static void simLoop (int pause)
{
    const dReal *pos;
    const dReal *R;

    // find collisions and add contact joints
    dSpaceCollide (space,0,&nearCallback);
    // step the simulation
    dWorldQuickStep (world,0.01);  
    // remove all contact joints
    dJointGroupEmpty (contactgroup);
    // redraw sphere at new location
    pos = dGeomGetPosition (lsphere_geom);
    R = dGeomGetRotation (lsphere_geom);
    dsDrawSphere (pos,R,dGeomSphereGetRadius (lsphere_geom));
    
    pos = dGeomGetPosition (rsphere_geom);
    R = dGeomGetRotation (rsphere_geom);
    dsDrawSphere (pos,R,dGeomSphereGetRadius (lsphere_geom));
}

int main (int argc, char **argv)
{
    // setup pointers to drawstuff callback functions
    dsFunctions fn;
    fn.version = DS_VERSION;
    fn.start = &start;
    fn.step = &simLoop;
    fn.stop = 0;
    fn.command = 0;
    fn.path_to_textures = "../../drawstuff/textures";
 
    dInitODE ();
    // create world
    world = dWorldCreate ();
    space = dHashSpaceCreate (0);
    dWorldSetGravity (world,0,0,0); //Original Gravity = -0.2
    dWorldSetCFM (world,1e-5);
    dCreatePlane (space,0,0,1,0);
    contactgroup = dJointGroupCreate (0);
    // create object
    lsphere = dBodyCreate (world);
    lsphere_geom = dCreateSphere (space,0.5);
    dMassSetSphere (&m,1,0.5);
    dBodySetMass (lsphere,&m);
    dGeomSetBody (lsphere_geom,lsphere);
    
    rsphere = dBodyCreate (world);
    rsphere_geom = dCreateSphere (space,0.5);
    dMassSetSphere (&m,1,0.5);
    dBodySetMass (rsphere,&m);
    dGeomSetBody (rsphere_geom,rsphere);
    // set initial position
    dBodySetPosition (lsphere,-5,0,1.5); // 0,0,3
    dBodySetPosition (rsphere,5,0,1.5); // 0,0,3
    // run simulation
    dsSimulationLoop (argc,argv,352,288,&fn);
    // clean up
    dJointGroupDestroy (contactgroup);
    dSpaceDestroy (space);
    dWorldDestroy (world);
    dCloseODE();
    return 0;
}
