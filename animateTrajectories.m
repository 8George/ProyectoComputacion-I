%Made by Álvaro Díaz and Jorge García
%Animates the trajectories of 2 stars and planet.

%Inputs
axlim=5e11;        %Axis size 
dt=3600;           %Time differential used for calculations
skip=24*8;        %A skip of n means that only one of every n frames is shown. This
                   %helps speed up the animation
trail=24*365*1;   %A trail of n means the planet will leave as trail the nth last
                   %calculated frames (this trail will be of dt*n seconds).

trajectories=[starTraj,planetTraj];      %3*3*nt matrix with trajectories of stars 1 and 2 and planet.
                                                       
nt=numel(trajectories(1,1,:)); %Length of the trajectory matrix in the time direction.


figure(1)
for i=1:nt/skip 
    

    x1=trajectories(1,1,i*skip); %index 1 refers to inner star, 2 to outer star
    x2=trajectories(1,2,i*skip); %This are the vectors which are to be animated. 
    y1=trajectories(2,1,i*skip); %We multiply times skip to go through every nth frame
    y2=trajectories(2,2,i*skip);
    z1=trajectories(3,1,i*skip);
    z2=trajectories(3,2,i*skip);
    
    trailframes=round(trail/skip); %frames for which the trail is shown
    if i<=trailframes  %the trail doesnt start deleting itself until its reached the specified length
            
        xp=squeeze(trajectories(1,3,1:i*skip));  %Planet vector to be animated
        yp=squeeze(trajectories(2,3,1:i*skip));
        zp=squeeze(trajectories(3,3,1:i*skip));
        
    else  
       
        xp=squeeze(trajectories(1,3,(i-trailframes)*skip:i*skip)); %Planet vector to be animated
        yp=squeeze(trajectories(2,3,(i-trailframes)*skip:i*skip));
        zp=squeeze(trajectories(3,3,(i-trailframes)*skip:i*skip));
    end
              
    plot3(x1,y1,z1,'o',x2,y2,z2,'o',xp,yp,zp,'.',0,0,0,'x')%plots the stars and marks the origin with an x for ease of visualization
    
    grid on
    title([num2str(round((i-1)*dt*skip/(3600*24),1)) ' days']) %indicates how many days have passed
    axis([-axlim,axlim,-axlim,axlim,-axlim,axlim])  
   
    
    pause(0.1)
    
end
