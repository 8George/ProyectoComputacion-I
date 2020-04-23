function rPlanet=planetTrajectory(m1,m2,mp,d1,r0,v0,dt,tmax)
%Created by Álvaro Díaz and Jorge García
%Gives the trajectory matrix for the planet for an intial position r0 from t=0
%to t=tmax.

%Inputs:
%m1,m2,mp: masses in kg of inner, outer stars, planet
%d1:distance from inner star to center of rotation in m
%r0: initial position vector of planet in m
%v0: initial velocity
%dt: size of integration step

%Output: 3*1*nt matrix with position vector of planet through time

myForce=@(r,v,t)forceOnPlanet(m1,m2,mp,d1,r,t,v); %Calls the forceOnPlanet function to integrate it 
... with rungeKutta


rPlanet = rungeKutta( myForce, mp, r0, v0, dt, tmax );  %calculates trajectory matrix of planet 
%through Runge Kutta solving. rungeKutta function created by J.M.Soler,
%Jan.2011.




