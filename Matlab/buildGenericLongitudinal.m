function Vehicle = buildGenericLongitudinal()

% Returns the generic longitudinal linear vehicle model.

% States: x = [u; w; q; \theta; h]
% u = forward velocity perturbation (m/s)
% w = vertical velocity perturbation (m/s)
% q = pitch rate (rad/s)
% \theta = pitch angle (rad)
% h = altitude (m)

% Input: elevator deflection de (in radians)

% Output: [theta, q, h]

% Longitudinal model representation of a small UAV/light aircraft class,
% containing short-period + phugoid-like behavior and an altitude
% integration

Vehicle = struct(); % init Vehicle
Vehicle.name = 'Generic Longitudinal Vehicle (5-State)';
Vehicle.trim_speed_mps = 30;

% State Matrix A

Vehicle.A = [...
    -0.04,   0.02,   0.00,  -9.81,   0.00;   % u_dot
    -0.12,  -0.55,  45.00,   0.00,   0.00;   % w_dot
    0.00,  -0.85,  -1.10,   0.00,   0.00;   % q_dot
    0.00,   0.00,   1.00,   0.00,   0.00;   % theta_dot
    0.00,   1.00,   0.00,  30.00,   0.00  % h_dot
];

% Input Matrix B

Vehicle.B = [...
    0 % u influence
    -6 % w influence
    -25 % q influence
    0
    0
];

% Output Matrix C, D
Vehicle.C = [...
    0 0 0 1 0;   % theta
    0 0 1 0 0;   % q
    0 0 0 0 1;  % h
];

Vehicle.D = zeros(3,1);

Vehicle.states = {'u', 'w', 'q', 'theta', 'h'};
Vehicle.outputs = {'theta', 'q', 'h'};
Vehicle.inputs = {'de'};

% State-space object
Vehicle.sys = ss(Vehicle.A, Vehicle.B, Vehicle.C, Vehicle.D);

end
