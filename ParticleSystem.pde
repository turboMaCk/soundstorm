// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  int generationSize;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
    generationSize = 1;
  }

  void emit(PVector location) {
    for (int i = 0; i < generationSize; i++) {
      particles.add(new Particle(location));
    }
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
