function trajs=trajectoryMatrix(m1,m2,mp,d1,r0,v0,dt,tmax)

%Created by Jorge García and Álvaro Díaz
%Gives matrix with trajectories of stars and planets

%Inputs:
%m1,m2,mp: mass in kg of inner, outer stars, planet.
%d1: distance in m from inner star to orbital center.
%r0: initial position of planet in m.
%v0: initial velocity in m/s
%dt: size of step with which trajectories are to be calculated in s.
%a small dt is necessary (15 min or fewer)

%Output: 3x3xnt matrix with positions of star 1 in first column,
%star 2 in second column, planet in third column.

pTraj=planetTrajectory(m1,m2,mp,d1,r0,v0,dt,tmax); %calls planetTrajectory to get the planet's trajectory matrix
nt=numel(pTraj(1,1,:)); %length of pTraj in the time direction
sTraj=starTrajectory(m1,m2,d1,dt,nt); %calls starTrajectory to get the stars' trajectory matrix

trajs=[sTraj,pTraj];