function params = parameters();
% Central parameters for Longitudinal Autopilot

deg = pi/180;

% Timing
params.ctrlSampleTime = 0.01; % Controller Sample Time in seconds
params.sensSampleTime = 0.01; % Sensor Sample Time in seconds

% Commands (for Simulink cmd gen)
params.pitchStep = 5*deg; % Pitch Step in Radians
params.altStep = 50; % Altitude Step in Meters

% Sim Duration
params.endPitchTime = 60; % in seconds
params.endAltTime = 200; % in seconds

% Actuator (Elevator) limits
params.actuator.maxDE = 25*deg; % maximum \delta_e in radians
params.actuator.maxdDE = 60*deg; % maximum derivative of \delta_e wrt Time in radians/s
params.actuator.tau = 0.025; % First Order lag, in seconds

% Sensors (std of noise to tune)
params.sensors.thetaStd = 0.1*deg; % radians
params.sensors.qStd = 0.01; % rad/s
params.sensors.hStd = 0.5; % meters

% Disturbance model knobs (simplified)
params.disturbance.enable = true;
params.disturbance.wStd = 0.5; % m/s equivalent disturbance into the w channel
params.disturbance.tau = 1; % low-pass time constant in seconds

% Requirements (pass/fail table)
params.requirements.settleSMax = 2; % seconds
params.requirements.overshootMax = 10; % percent
params.requirements.errDegMax = 0.5; % degrees (steady-state band)

end
