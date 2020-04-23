function rStars=starPosition(m1,m2,d1,t)
%Created by Álvaro Díaz and Jorge García
%Gives the position of both stars at t

%Inputs:
%m1,m2: mass of inner and outer star in kg
%d1: scalar, distance from inner star to center of rotation in m
%t: time at which position is calculated

%Output:
%3*2 vector with the position of each star in each column

G=6.67408e-11; %Gravitational constant
d2=d1*m1/m2; %calculates outer orbital radius
d=d1+d2; %distance between stars

w=sqrt(G*m1/(d2*d^2));  %angular orbital velocity of both stars

r1=[-d1;0;0]; %initial position of first (inner) star
r2=[d2;0;0]; %initial position of second (outer) star
rStars0=[r1,r2]; %initial positions of the stars

rStars=rotMat3d(rStars0,w*t); %rotates the initial positions of the stars by w*t degrees
