function [particles,trajectories] = rectangularaperture(particles,trajectories,param,length,width)
%% function definition
%This is a rectangular aperture that operates the exact same as the
%circular aperture but instead of removing particles within a radius it
%removes particles outside of the x,y range defined by the rectangular
%aperture dimensions and origin.

%It operaterates generally the exact same, but calls the
%removetrajecrectangle.m function instead of the removetrajec.m function to
%remove the trajectories.

%it calls removetrajecrectangle with the block argument set to 0, as it is
%not blocking
for i = 1:numel(particles)
    [particles(i).velocity,particles(i).position] = frametransform(particles(i).velocity,particles(i).position,param);
end
particles = propagate(particles);
[particles, trajectories] = removetrajecrectangle(particles,trajectories,length,width,0);
trajectories = addtotrajectories(particles,trajectories,param);
for i = 1:numel(particles)
    [particles(i).velocity,particles(i).position] = labtransform(particles(i).velocity,particles(i).position,param);
end
end