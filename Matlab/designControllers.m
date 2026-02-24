function K = designControllers(params, Vehicle)

% Simple Cascaded autopilot gains

% init struct
K = struct();

% Inner Loop: q control (P)
K.q.Kp = 0.8;
K.q.Ki = 0;

% Outer Loop: theta control (PI)
K.theta.Kp = 2.5;
K.theta.Ki = 0.2;

% Altitude Hold
K.h.Kp = 0.02;
K.h.Ki = 0.005;

% Safety Limits
K.thetaCommandMax = 15 * pi / 180; % rad

K.notes = 'Cascaded pitch autopilot: theta PI -> q_cmd, q P -> de_cmd';

end