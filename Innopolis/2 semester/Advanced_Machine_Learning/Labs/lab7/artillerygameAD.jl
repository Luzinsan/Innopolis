#Moving object
STEPS = 100

struct shot
    x
    y
    ddx
    ddy
end

#Static object
struct fort
    x
    y
end


#Update a shot
function update(s::shot)
    x = s.x + 0.1*s.ddx
    y = s.y + 0.1*s.ddy
    ddy = s.ddy - 0.1*0.981
    ddx = s.ddx
    return shot(x,y, ddx, ddy)
end

#Update fort
function update(s::fort)
    return fort(s.x,s.y)
end

#Calculate punishment as minimum square distance
function reward(scene,reward)
    if -sum(([scene[1].x scene[1].y] .- [scene[2].x scene[2].y]).^2) > reward
        reward = -sum(([scene[1].x scene[1].y] .- [scene[2].x scene[2].y]).^2)
    end
    return reward
end

#Scene vector contains all objects in the world
scene = []

#Simulate world and return reward
function simulatereward(scene, time)
    r = -9999999
    for tstep = 1:time
        scene = update.(scene)
        r = reward(scene,r)
    end
    return r 
end

#Simulate the world and return positions per time step for ploting
function simulateandsave(scene,time)  
    xmat = zeros(length(scene),time)
    ymat = zeros(length(scene),time)
    for tstep = 1:time
        for i in 1:length(scene)
            xmat[i,tstep] = scene[i].x
            ymat[i,tstep] = scene[i].y
        end
        scene = update.(scene)
    end
    return xmat,ymat
end

#Example 1
#Initialize world from vertical velocity and return reward
function interception(ddy0)
    scene = []
    fort1 = fort(50.0,0.0)
    dx = 10
    dy = ddy0
    shot1 = shot(0.0,0.0,dx,dy)
    scene = [fort1 shot1]
    r = simulatereward(scene,100)
    return r
end

#Makie.jl would look nicer than Plots...
using Plots
function plotscene(scene)
    xpos, ypos = simulateandsave(scene, STEPS)
    anim = Animation()
    for i = 1:STEPS
        plot(xpos[1:2, 1:i]', ypos[1:2, 1:i]', xlims=(0, 50), ylims=(0, 50), title="Time = $i", linewidth=3)
        frame(anim)
    end
    gif(anim, "scene3.gif", fps=10)
end

ddy0 = 2.5

scene = []
fort1 = fort(50.0, 0.0)
dx = 10
dy = ddy0
shot2 = shot(0.0, 0.0, dx, dy)
scene = [fort1 shot2]
plotscene(scene)

#Our AD libray - does not handle Mutation. Enzymer does, but bad documentation so far
using Zygote

#Full training loop using GD
lr = 0.0001
ddy0 = 0.1 #Initial guess
for i=1:1000
    ddy0 =  ddy0 + lr * interception'(ddy0)
end

#Values and plot
ddy0
interception(ddy0)
interception'(ddy0)

#Set up scene as in interception again and plot
scene = []
fort1 = fort(50.0,0.0)
dx = 10
dy = ddy0
shot2 = shot(0.0,0.0,dx,dy)
scene = [fort1 shot2]
plotscene(scene)



#Example 2
#Create scene instead based on angle with fixed velocity
function interception2(angle)
    scene = []
    fort1 = fort(50.0,0.0)
    p = 15.0
    ddx = p*cos(angle)
    ddy = p*sin(angle)
    shot1 = shot(0.0,0.0,ddx,ddy)
    scene = [fort1 shot1]
    r = simulatereward(scene,100)
    return r
end


angle = 0.1 #Initial guess in radians

#Training loop
lr = 0.000001
for i=1:1000
    angle = angle + lr * interception2'(angle)
end
angle
interception2(angle)
interception2'(angle)

#Set up scene as in interception2
scene = []
fort1 = fort(50.0,0.0)
p = 15.0
dx = p*cos(angle)
dy = p*sin(angle)
shot2 = shot(0.0,0.0,dx,dy)
scene = [fort1 shot2]
plotscene(scene)

#Todo: 1) Create a scene with two shots and find the angle from shot 1 that hits shot 2
#2) Randomize the position and velocity of the other shot
#3) Make a function (linear or simple neuron etc) that depends on some parameters w, inputs the other shot position and velocity and outputs an angle that results in an intercept.

#You can modify reward function. Flux library is nice if you want a ANN.