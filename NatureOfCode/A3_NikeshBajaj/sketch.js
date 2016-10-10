// Nikesh Bajaj
// Idea taken from Jacob_Joaquin_Centipede_Walls submission
// Thanks 


var nSnakes = 3; // Number of centipedes to generate
var S = []; // Container to store centipede objects

// See Centipede.js for more settings
var xt=0,yt=0, Eaten =false;
function setup() {
    createCanvas(640, 480);

    // Objects: The code creates an object with the constructor function(not using prototype method).
    colorMode(HSB);
    for (var i = 0; i < nSnakes; i++) {
        
        S.push(new Snake(random(width), random(height), color(i/nSnakes * 360, 200, 100)));
    }
    xt=width/2,yt=height/2
}

function draw() {
    background(0);
    if(Eaten){
        
    }
    fill(255,0, random(255))
    ellipse(xt,yt,20,20)



    for (var i = 0; i < S.length; i++) {
        S[i].update(xt,yt);
    }
    
    for (var i = 0; i < S.length; i++) {
        S[i].display();
    }

    for (var i = 0; i < S.length; i++) {
        if(S[i].isEaten(xt,yt)){
            xt = random(100, width)
            yt = random(100, height)
        }
    }

}


function Snake(x, y, c) {
    // Set steering variables
    this.separateCoef = 0.5; // How separate?
    this.steeringCoef = 0.2; // How long to transition from current velocity to desired target

    // Vectors: The object stores its position, velocity, and acceleration as vectors.
    this.acceleration = p5.Vector.fromAngle(random(TAU));
    this.velocity = createVector(0, 0);
    this.position = createVector(x, y);

    this.nSegments = 4; // Number of segments
    this.size = 4; // Size
    this.maxVelocity = 1; // Max velocity
    this.maxForce = 5;
    this.color = c;

    // Create segments (which are position vectors)
    this.segments = [];
    for (var i = 0; i < this.nSegments; i++) {
        this.segments.push(this.position.copy());
    }

    // Reynold's Arrive
    this.arrive = function(target) {
        var desired = p5.Vector.sub(target, this.position);

        // The arrive behavior!
        var d = desired.mag();

        if (d < 100) {
            // Map the desired magnitude according to distance
            var m = map(d, 0, 200, 0, this.maxVelocity);
            desired.setMag(m);
        } else {
            desired.setMag(this.maxVelocity);
        }

        desired.setMag(this.maxVelocity);
        // Apply steering
        this.steer(desired);
    }

    this.separate = function(vehicles) {
        var sum = createVector();
        var count = 0;

        // Loop throught every centipde
        for (var i = 0; i < vehicles.length; i++) {
            var vehicle = vehicles[i];

            // Loop through each segment
            for (var j = 0; j < vehicle.segments.length; j++) {
                var segment = vehicle.segments[j];
                var desiredseparation = (this.size * 2 + vehicle.size * 2) * this.separateCoef;
                var d = p5.Vector.dist(this.position, segment);

                // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
                if ((d > 0) && (d < desiredseparation)) {
                    // Calculate vector pointing away from neighbor
                    var diff = p5.Vector.sub(this.position, segment);
                    diff.normalize();
                    diff.div(d); // Weight by distance
                    sum.add(diff);
                    count++; // Keep track of how many
                }
            }
        }

        // Average -- divide by how many
        if (count > 0) {
            sum.div(count);
            // Our desired vector is the average scaled to maximum speed
            sum.normalize();
            sum.mult(this.maxVelocity);
            // Implement Reynolds: Steering = Desired - Velocity
            var steer = p5.Vector.sub(sum, this.velocity);
            steer.limit(this.maxForce);
            this.applyForce(steer);
        }
    }

    // formula: steering = desired - velocity
    this.steer = function(desired) {
        var steering = p5.Vector.sub(desired, this.velocity).mult(this.steeringCoef);;
        steering.limit(this.maxforce);
        this.applyForce(steering);
    }

    
    this.applyForce = function(force) {
        this.velocity.add(force);
        this.velocity.limit(this.maxVelocity); // Limit velocity
        this.position.add(this.velocity);
    };

    this.isEaten =function(xt,yt){
        if(dist(this.segments[0].x,this.segments[0].y,xt,yt)<this.size + 10){
            this.segments.push(this.position.copy())
            return true;
        }
        return false;
    }

    
    this.update = function(targetX,targetY) {
    
        var desired = createVector(targetX,targetY);
    
        this.applyForce(this.arrive(desired));
        this.separate(S);
    
        this.segments[0] = this.position;
        for (var i = 1; i < this.segments.length; i++) {
            var s0 = this.segments[i - 1]; // Previous segment
            var s1 = this.segments[i]; // Current segment
    
            if (dist(s0.x, s0.y, s1.x, s1.y) > this.size) {
                var v2 = p5.Vector.sub(s1, s0).setMag(this.size);
                this.segments[i] = s0.copy().add(v2);
            }
        }


    }

    
    this.display = function() {
        push();
        fill(this.color);
        noStroke();
    
        for (var i = this.segments.length - 1; i >= 0; i--) {
            var seg = this.segments[i];
            if(i==0){
                ellipse(seg.x, seg.y, 2*this.size, 2*this.size);
                fill(0)
                ellipse(seg.x, seg.y, this.size, this.size);
            }else{
                ellipse(seg.x, seg.y, this.size, this.size);
            }
        }
        pop();
    }
}