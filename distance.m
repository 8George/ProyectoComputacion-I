function D=distance(trajectories)
%Done by Álvaro Díaz and Jorge García
%Gives distance scalar from planet to stars at each dt

%Input:3*3*nt matrix with positions of first star in first column, star two
%in second column, planet in third column. This matrix can be obtained with
%trajectoryMatrix.m

%Output: 2*nt matrix. Each column is the distance from one star to
%the planet at each dt (in m)

nt=numel(trajectories(1,1,:)); %length of trajectories matrix in time direction

for i=1:nt %calculates modulus of distance at each dt
    d1(i)=norm(trajectories(:,1,i)-trajectories(:,3,i)); 
    d2(i)=norm(trajectories(:,2,i)-trajectories(:,3,i));
end

D=[d1;d2];
end