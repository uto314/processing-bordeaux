import processing.opengl.*;
import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.*;
import wblut.hemesh.*;
import wblut.geom.*;

HE_Mesh mesh;
WB_Render render;

void setup()
{
    size( 600, 600, OPENGL );
    
    // create the cube geometry
    HEC_Cube cube = new HEC_Cube();
    cube.setEdge( 200 );
    cube.setDepthSegments( 1 );
    cube.setHeightSegments( 2 );
    cube.setWidthSegments( 4 );
    
    // create a mesh from the geometry
    mesh = new HE_Mesh( cube );    
    
    // subdivide the mesh
    HES_CatmullClark cc = new HES_CatmullClark();
    mesh.subdivide( cc, 3 );
    
    // create the renderer
    render = new WB_Render( this );
}

void draw()
{
    background( 0 );
    lights();

    translate( width/2, height/2 );
    rotateY( radians( frameCount ) );
    rotateX( radians( frameCount ) );
    
    // draw the faces of the mesh
    noStroke();
    fill( 255 );
    render.drawFaces( mesh );
    
    // draw the edges of the mesh
    stroke( 0 );
    noFill();
    render.drawEdges( mesh );    
}
