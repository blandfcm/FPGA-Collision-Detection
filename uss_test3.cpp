#include <ode/ode.h>
#include <drawstuff/drawstuff.h>
// dynamics and collision objects
static dWorldID world;
static dSpaceID space;

static dBodyID sphere0;	
static dGeomID sphere0_geom;	

static dBodyID sphere1;	
static dGeomID sphere1_geom;	

static dBodyID sphere2;	
static dGeomID sphere2_geom;	

static dBodyID sphere3;	
static dGeomID sphere3_geom;	

static dBodyID sphere4;	
static dGeomID sphere4_geom;	

static dBodyID sphere5;	
static dGeomID sphere5_geom;	

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
// Top Down View
    static float xyz[3] = {0.0f,-8.0f,1.0f};
    static float hpr[3] = {90.0f,0.0f,0.0f};
    dBodyAddForce(sphere0,-200,0,0);
    dBodyAddForce(sphere1,200,0,0);
    dBodyAddForce(sphere2,0,-200,0); 
    dBodyAddForce(sphere3,0,200,0);
    dBodyAddForce(sphere4,0,0,-200);
    dBodyAddForce(sphere5,0,0,200);
    dsSetViewpoint (xyz,hpr);
}

// simulation loop
static void simLoop (int pause)
{
    const dReal *pos;
    const dReal *R;
    // force for the spheres
  
    // find collisions and add contact joints
    dSpaceCollide (space,0,&nearCallback);
    // step the simulation
    dWorldQuickStep (world,0.01);  
    // remove all contact joints
    dJointGroupEmpty (contactgroup);
    // redraw sphere at new location
    pos = dGeomGetPosition (sphere0_geom);
    R = dGeomGetRotation (sphere0_geom);
    dsDrawSphere (pos,R,dGeomSphereGetRadius (sphere0_geom));
     
    pos = dGeomGetPosition (sphere1_geom);
    R = dGeomGetRotation (sphere1_geom);
    dsDrawSphere (pos,R,dGeomSphereGetRadius (sphere1_geom));

    pos = dGeomGetPosition (sphere2_geom);
    R = dGeomGetRotation (sphere2_geom);
    dsDrawSphere (pos,R,dGeomSphereGetRadius (sphere2_geom));

    pos = dGeomGetPosition (sphere3_geom);
    R = dGeomGetRotation (sphere3_geom);
    dsDrawSphere (pos,R,dGeomSphereGetRadius (sphere3_geom));
    
    pos = dGeomGetPosition (sphere4_geom);
    R = dGeomGetRotation (sphere4_geom);
    dsDrawSphere (pos,R,dGeomSphereGetRadius (sphere4_geom));
    
    pos = dGeomGetPosition (sphere5_geom);
    R = dGeomGetRotation (sphere5_geom);
    dsDrawSphere (pos,R,dGeomSphereGetRadius (sphere5_geom));

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
    sphere0 = dBodyCreate (world);
    sphere0_geom = dCreateSphere (space,0.5);
    dMassSetSphere (&m,1,0.5);
    dBodySetMass (sphere0,&m);
    dGeomSetBody (sphere0_geom,sphere0);
 
    sphere1 = dBodyCreate (world);
    sphere1_geom = dCreateSphere (space,0.5);
    dMassSetSphere (&m,1,0.5);
    dBodySetMass (sphere1,&m);
    dGeomSetBody (sphere1_geom,sphere1);
 
    sphere2 = dBodyCreate (world);
    sphere2_geom = dCreateSphere (space,0.5);
    dMassSetSphere (&m,1,0.5);
    dBodySetMass (sphere2,&m);
    dGeomSetBody (sphere2_geom,sphere2);
  
    sphere3 = dBodyCreate (world);
    sphere3_geom = dCreateSphere (space,0.5);
    dMassSetSphere (&m,1,0.5);
    dBodySetMass (sphere3,&m);
    dGeomSetBody (sphere3_geom,sphere3);
   
    sphere4 = dBodyCreate (world);
    sphere4_geom = dCreateSphere (space,0.5);
    dMassSetSphere (&m,1,0.5);
    dBodySetMass (sphere4,&m);
    dGeomSetBody (sphere4_geom,sphere4);
    
    sphere5 = dBodyCreate (world);
    sphere5_geom = dCreateSphere (space,0.5);
    dMassSetSphere (&m,1,0.5);
    dBodySetMass (sphere5,&m);
    dGeomSetBody (sphere5_geom,sphere5);
    
    // set initial position
    dBodySetPosition (sphere0,2,0,4);
    dBodySetPosition (sphere1,-2,0,4);
    dBodySetPosition (sphere2,0,2,4);
    dBodySetPosition (sphere3,0,-2,4);
    dBodySetPosition (sphere4,0,0,6);
    dBodySetPosition (sphere5,0,0,2);   

// run simulation
    dsSimulationLoop (argc,argv,352,288,&fn);
    // clean up
    dJointGroupDestroy (contactgroup);
    dSpaceDestroy (space);
    dWorldDestroy (world);
    dCloseODE();
    return 0;
}
