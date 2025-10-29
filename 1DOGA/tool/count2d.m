function [xpt,ypt,weight] = count2d(cube,N)
%% RQUADPTS1D quadrature points and weights for every element

%%% mesh decomposition
h = 1/N;
distx = cube(1,2) - cube(1,1);
disty = cube(2,2) - cube(2,1);
arr = linspace(0, 1, N);
arr2 = linspace(-1, 1, N);
xpt = cube(1,1) + distx*arr;
ypt = cube(2,1) + disty*arr;
% xqdpts = [xpt; ypt];

%%% weights
%weight = repmat(h, 1, N);
weight = ones(1, N);
end