%Script used to calculate the orbits used in the project.

m1=2e30;                       %Mass of star 1
m2=2e30;                       %Mass of star 2
mp=6e24;                       %Mass of planet
d1=1.5e11;                     %Distance star 1 to center of mass           
dt=30;                    %dt used for integration
tmax=3600*24*365*30;           %For how long to integrate
load('r0Group.mat');           %3*np matrix containing all the starting positions.
n1=21;                         %Position of r0Group where the script starts
n2=28;                         %Position of r0Group where the script ends
r0toEvaluate=r0Group(:,n1:n2); %Where n1 is the first position to be
                               %evaluated and n2 the last.
                               
for i=1:numel(r0toEvaluate(1,:)) %For each starting position given...
    
    r0=r0toEvaluate(:,i);
    v0=initialVelocity(r0,m1,m2);   %Pick the starting position and calculate starting velocity.
    
    planetTraj=planetTrajectory(m1,m2,mp,d1,r0,v0,dt,tmax); %Calculate trajectory of the planet
    
    save(strcat('planetTraj',num2str(i+n1-1),'.mat'),'planetTraj')
    
    clear PlanetTraj %Clear the trajectory to free memory
end

clear all
