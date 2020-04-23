function rStars=starTrajectory(m1,m2,d1,dt,nt)
%Created by Álvaro Díaz and Jorge García
%Gives the position matrix of both stars at each dt, at an nt=t/dt number of
%dts.

%Inputs:
%m1,m2: mass of inner and outer star in kg
%d1: scalar, distance from inner star to center of rotation in m
%dt: size of step in s
%nt: given by length of planetTrajectory in time direction

%Outputs:
%rStars: nd*2*nt vector with position of each star in each nt in m

G=6.67408e-11;
d2=d1*m1/m2; %calculates orbital radius for the outer star for a stable configuration.
d=d1+d2; %distance between stars.

w=sqrt(G*m1/(d2*d^2));  %angular orbital velocity of both stars

r1=[-d1;0;0]; %intial position of first (inner) star
r2=[d2;0;0]; %initial position of second (outer) star
rStars=[r1,r2]; %initial positions of the stars

t=0; %initial time

for i=2:nt
    
    t=t+dt;  
    rStars(:,:,i)=rotMat3d(rStars(:,:,1),w*t);  %rotates r1 and r2 by w*t
    
end
    



