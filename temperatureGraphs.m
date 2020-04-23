%Made by Álvaro Díaz and Jorge García
%Plots temperature as a function of time, power absorbed as a function of
%time and distance from stars as a function of time.

%Inputs
m1=6e30;              %Mass of star 1
m2=2e30;              %Mass of star 2
mp=6e24;              %Mass of planet
dt=3600;              %Time between frames in the trajectory matrix (in s)
trajs=[starTraj,planetTraj];                %3*3*nt matrix with trajectories of stars and planet
[T,Pabs,D]=temperatureMatrix(m1,m2,mp,trajs);

nt=numel(T);        %Length of vectors to be plotted
t=(0:nt-1)*dt;      %Time vector
t=t/(3600*24*365);  %Converts time vector from s to years.
T=T-273.15;         %Converts temperature vector from Kelvin to Celsius
Tmed=mean(T);       %Mean temperature
D=D/149597870700;   %Converts distance from m to AU
Pabs=Pabs/(1.74e17);%Converts power from watts to solar power units (average power 
                    % received by the surface of Earth from the sun). This
                    % unit, while made up, is much more intuitive than
                    % watts for our purposes. 1 spu=1.74e17 W.



figure(1) %Plots power received by planet and its temperature

    subplot(2,1,1)
 
        plot(t,Pabs)
        title('Power received')
        xlabel('Time(yrs)')
        ylabel('Power(spu=1.74e17 W)')
        set(gca, 'YScale', 'log')

    subplot(2,1,2)
        
        plot(t,T)
        title('Planet temperature')
        xlabel('Time(yrs)')
        ylabel('Temperature(ºC)')
        legend(strcat(num2str(round(Tmed)),"ºC on average") ,'Location','southeast')


figure(2) %Plots distance from planet to each star

    plot(t,D(1,:))
    hold on
    plot(t,D(2,:))
    hold off
    title('Distance to stars 1 & 2')
    xlabel('Time(yrs)')
    ylabel('Distance(AU)')
    legend('Distance to star 1','Distance to star 2')



