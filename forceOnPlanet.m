function f=forceOnPlanet(m1,m2,mp,d1,rp,t,~)
%Created by Álvaro Díaz and Jorge García.
%Given the position of the planet at a time t, it calculates the force
%vector exerted on it by both stars.

%Inputs:
%m1,m2:mass of inner and outer star in kg
%mP:mass of planet in kg
%rP: Column vector with position of planet with respect to orbital
%center of stars, in metres.
%d1:orbital radius of inner star.
%t:time in s.

%Output: Gravitational force vector on the planet in N

G=6.67408e-11;
e=1e9; %Amortiguation factor. Its approx the radius of the sun

rStars=starPosition(m1,m2,d1,t); %User starPosition function to get the position vectors of both stars at t.

r1=rStars(:,1);
r2=rStars(:,2); %Radii of inner(1) and outer(2) stars at time=t


f1=(r1-rp)*G*m1*mp/(e+(norm(r1-rp))^3); %Forces exerted on the planet by the stars, 
%according to the law of universal gravitation
f2=(r2-rp)*G*m2*mp/(e+(norm(r2-rp))^3);
f=f1+f2; %net force







    



