function [params, Vehicle, K] = initialize()

% Adds paths, params, etc
addpath('Matlab');

params = parameters();
Vehicle = buildGenericLongitudinal();
K = designControllers(params, Vehicle);

% push to base workspace for Simulink
assignin('base', 'P', params);
assignin('base', 'Vehicle', Vehicle);
assignin('base', 'K', K)

end