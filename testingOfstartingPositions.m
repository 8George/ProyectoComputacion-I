%Made by Álvaro Díaz and Jorge García
%Plots the 127 starting positions chosen for the planet.

a=startingPositions(4e11,126);

plot(a(1,:),a(2,:),'.')
axis equal
axis([-5e11,5e11,-5e11,5e11])
hold on


plot(1.5e11,0,'ro',-1.5e11,0,'ro')