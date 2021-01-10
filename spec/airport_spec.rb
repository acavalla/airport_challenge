require 'airport_challenge'
require 'plane'

describe Airport do
  plane = Plane.new

  it "receives a landing plane" do
    allow(subject).to receive(:stormy?) { false }
    expect(subject.land(plane)[0]).to eq plane
  end

  it "plane takes off and is gone from airport" do
    allow(subject).to receive(:stormy?) { false }
    subject.planes << plane
    subject.takeoff(plane)
    expect(subject.planes).not_to include plane
  end

  it "blocks landing when airport at capacity" do
    allow(subject).to receive(:stormy?) { false }
    subject.capacity.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error("This airport is full.")
  end

  it "prevents takeoff when weather is stormy" do
    allow(subject).to receive(:stormy?) { true }
    expect { subject.takeoff(plane) }.to raise_error("Too stormy.")
  end

  it "prevents landing when weather is stormy" do
    allow(subject).to receive(:stormy?) { true }
    expect { subject.land(plane) }.to raise_error("Too stormy.")
  end

  it "planes can only take off from airports they are in" do
    allow(subject).to receive(:stormy?) { false }
    expect { subject.takeoff(plane) }.to raise_error("Plane not in airport.")
  end

  it "planes in air cannot take off or be in an airport" do
    allow(subject).to receive(:stormy?) { false }
    subject.fly << plane
    expect { subject.takeoff(plane) }.to raise_error("Plane in air.")
  end
end
