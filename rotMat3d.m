function newMat=rotMat3d(mat,theta)
%Created by ÁLvaro Díaz and Jorge García
%Rotates input vectors by theta radians in the x-y plane

%Inputs:
%mat: 3*n matrix containing column position vectors we wish to rotate. In
%this particular project, n=2 (two stars).
%theta: radians by which we mean to rotate the vectors.

newMat=[cos(theta),sin(-1*theta),0;sin(theta),cos(theta),0;0,0,1]*mat; %Rotation matrix times mat input
