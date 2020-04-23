function v0=initialVelocity(r0,m1,m2)
%Made by Álvaro Díaz and Jorge García
%Returns an initial velocity vector perpendicular to r0. Its modulus is the
%orbital velocity at r0 if the mass of our star system were concentrated 
%at the center of mass.

%Inputs:
%   r0:Initial position column vector
%   m1,m2:Mass of the stars
%Outputs:
%   v0:Initial velocity vector.

G=6.67408e-11; %Gravitational constant
M=m1+m2;       

d=norm(r0);                   %Distance to the center of mass
u=[0,-1,0;1,0,0;0,0,1]*r0/d;  %Unitary vector perpendicular to r0.
v0=u*sqrt(G*M/d);             %Output
