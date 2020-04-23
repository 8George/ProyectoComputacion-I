This is a short explanation of how to use the functions of the project.

The main scripts are animateTrajectories.m and themperatureGraphs.m. To use them, click in shorStarTraj.mat
to load the stars' trajectory, and also click on the planet trajectory desired (e.g. shortPlanetTraj30.mat).
Once the stars and planet trajectories are loaded, just run the scripts. In animateTrajectories.m the variables
"trail", "axlim" and "skip" can be changed to adjust the animation.

The trajectories for the project have been calculated with the script orbitCalculator.m (each trajectory
takes around 35 min. to be calculated) from a set of 127 initial positions, which are stored in r0Group.mat
and can be visualized with testingOfstartingPositions.m.

The trajectories calculated were compressed using the script trajShortener due to their large size (~350 MB)
