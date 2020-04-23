%Made by Álvaro Díaz and Jorge García.
%Takes all trajectories of the planet and compresses them by a factor of
%120 (since the dt used to calculate them is of 30 seconds, after being 
%compressed the trajectory matrix will contain one position vector for each 
%hour passed in the simulation, since 30s*120=1 h). This allow us to animate
%them and analyse their periodicity more smoothly, since this process does
%not require much resolution.

n1=21;  
n2=28;    %Numbers of first and last trajectory to be shortened
load(strcat('planetTraj',num2str(n1),'.mat'));    %Loads first one to check trajectories' length
nt=length(planetTraj);                            %nt is length in time direction
v=zeros(1,nt-floor(nt/120)-1);                    %This vector will contain all the indexes
                                                  %to delete (i.e. those that aren't multiples of 120)
j=1;                     
for i=1:nt      %This for loop adds all the indexes to delete to the vector v
    if mod(i-1,120)~=0  %If it's not a multiple of 120..
        v(j)=i;         %add it to the list
        j=j+1;
    end
end

for i=n1:n2 %for each trajectory...
    
    load(strcat('planetTraj',num2str(i),'.mat'))    %load it
    planetTraj(:,:,v)=[];                           %delete the indexes contained in v
    save(strcat('shortPlanetTraj',num2str(i),'.mat'),'planetTraj')  %save the new trajectory
end                                                                 
                                                                    
                                                                    
                                                                    