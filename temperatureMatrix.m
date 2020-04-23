function [T,Pabs,D]=temperatureMatrix(m1,m2,mp,trajs)
%Made by Álvaro Díaz and Jorge García
%Calculates the temperature of the planet throughout its trajectory. To
%perform this calculation a series of assumptions have been had to be made.
%For an explanation of these assumptions please read the heatingThePlanet.txt
%file.

%Inputs:
%   m1,m2:Mass of inner and outer star respectively (in kg)
%   mp:Planet mass (in kg)
%   trajs: Matrix with the trajectories of the stars and planet obtained
%   with trajectoryMatrix.m
%
%
%Outputs:
%   T:Horizontal vector of length nt containing the temperature of the
%     planet (in K) at each dt
%   Pabs:Horizontal vector of length nt containing the power absorbed 
%        by the planet at each dt (in J)
%   D:nt*2 matrix. Each column is the distance from one star to
%     the planet at each dt (in m)

D=distance(trajs);                             %Calculates de distance of the planet to stars 1 and 2 at each dt
d1=D(1,:);                                     %Distance to star 1    
d2=D(2,:);                                     %Distance to star 2


sig=5.670373e-8;               %Steffan-Boltzmann constant in S.I. units
L1=luminosity(m1);
L2=luminosity(m2);             %Luminosity of each star
pR=(mp*3/(4*pi*5513.3))^(1/3); %Planet radius. It uses its mass to calculate a planet size
                               %so that its density is the same as Earth's (5513.3 kg/m^3)


P1=(L1*pi*pR^2)./(4*pi*(d1+0.01).^2);  
P2=(L2*pi*pR^2)./(4*pi*(d2+0.01).^2);  %Power from stars 1 and 2 received by the planet
Pabs=P1+P2;                     %Vector containing the power received at each dt


T=((L1./d1.^2+L2./d2.^2)/(16*pi*sig)).^0.25; %Equilibrium temperature of 
                                             %the planet at each dt (assuming a black body)
