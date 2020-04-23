function L=luminosity(m)
%Made by Álvaro Díaz and Jorge García
%Gives luminosity of a star (i.e. electromagnetic energy emitted per
%second) as a function of its mass using the mass-luminosity relation
%for stars between 0.43 and 2 solar masses.

%Inputs:
    %m: mass of the star in kg
%Outputs:
    %L: luminosity of the star in watts

Lsun=3.828e26;
Msun=1.9884e30; %mass and luminosity of the sun, in kg and W.

L=Lsun*(m/Msun)^4; %mass-luminosity relation formula
end