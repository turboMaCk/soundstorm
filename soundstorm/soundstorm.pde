import ddf.minim.*;

Minim minim;
AudioInput in;
ParticleSystem ps;
PVector origin;

void setup()
{
  frameRate(30);
  size(512, 512, P3D);

  minim = new Minim(this);
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn(1);

  // particles
  origin = new PVector(width/2, height/2);
  ps = new ParticleSystem(origin);
}

void draw()
{
  background(in.left.get(0)*400, in.left.get(0)*400, in.left.get(0)*400);

  // draw the waveforms so we can see what we are monitoring
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    line( i, height/2-1 + in.left.get(i)*height/10, i+1, height/2+1 + in.left.get(i+1)*height/10 );
    if (in.left.get(i) > 0.2) {
      origin = new PVector(i,0);
      ps.emit(origin);
    }
  }
  ps.run();

  println(frameRate);
}

void keyPressed()
{
  if ( key == 'm' || key == 'M' )
  {
    if ( in.isMonitoring() )
    {
      in.disableMonitoring();
    }
    else
    {
      in.enableMonitoring();
    }
  }
}
