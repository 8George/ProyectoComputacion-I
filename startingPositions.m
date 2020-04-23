function R=startingPositions(rMax,np)
%Made by Álvaro Díaz and Jorge García
%Gives np positions approximately equidistant in a disk of radius rMax.
%To do this it calculates a number of concentric circles and their
%separation so that the number of positions in each circle is proportional
%to its diameter and separation between positions in the same circle and 
%between adjacent circles is as similar as possible. Due to this
%disposition it usually cannot give the exact number of points asked for.
%The option to choose between rounding up and down is built into the 
%function (lines 26 and 28)

%Inputs:
%   rMax:Maximum radius
%   np:Number of positions desired
%
%Outputs:
%   R:3*np matrix with all positions.


R=[0;0;0]; %We add a point in the center
np=np-1;   %One point less to add later!

a=6;                                    %Number of points in the first circle
rStep=a*rMax*(1+sqrt(1+8*np/a))/(4*np); %Distance between circles

rMax=rMax+(rStep-mod(rMax,rStep));      %We slightly increase rMax so that 
                                        %it's a multiple of rStep
%rMax=rMax-mod(rMax,rStep);            %We slightly decrease rMax so that
                                        %it's a multiple of rStep
                                        
nc=rMax/rStep; %Number of concentric circles to draw

for i=1:nc %for each circle...
    
    r=rStep*i;          %circle radius        
    angle=2*pi/(i*a);   %angle between points in the circle
    
    for j=0:i*a-1       %for each point...
        
        R(:,numel(R(1,:))+1)=rotMat3d([r;0;0],angle*j); %rotate point j by j*angle 
    end
end




