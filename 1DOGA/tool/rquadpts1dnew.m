function [xqdpts,weight] = rquadpts1dnew(interval,numPts)
%% RQUADPTS1D quadrature points and weights for every element

%%% mesh decomposition
h = interval(2)-interval(1);

%%% from 1d reference element
[pt,wei] = quadpts1d(numPts);
xp = (pt*h+interval(1)+interval(2))/2;

%%% quadrature points
xqdpts = xp(:)';

%%% weights
weight = repmat(wei,1,size(xp,2));
weight = weight(:)';
end