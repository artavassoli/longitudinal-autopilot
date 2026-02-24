function metrics = metricStep(t, y, yCmd, name)

% Step-like response metrics: settling time (2%), overshoot, steady state
% error

% init metrics
metrics = struct();
metrics.name = string(name);
deg = pi / 180;

y = y(:);
yCmd = yCmd(:);
t = t(:);
e = y - yCmd;

% RMS over full duration
metrics.rms = sqrt(mean(e.^2));

% Overshoot (%), assuming a step from initial to final command
y0 = yCmd(1);
yf = yCmd(end);
dy = yf - y0;

if abs(dy) < 1e-9
    metrics.overshootPCT = NaN;
else
    if dy > 0
        metrics.overshootPCT = max(0, (max(y) - yf) / dy * 100);
    end
end

% Settling Time: last time outside that 2% band of final value
% band = 0.02 * max(1e-6, abs(dy));
% --- Settling Time (dwell-based, measured from step start) ---

kStep = find(abs(yCmd - yCmd(1)) > 1e-6, 1, 'first');
if isempty(kStep), kStep = 1; end

band = 0.5 * deg;          % settling band (rad)
dwellSec = 0.5;            % must stay in-band for 0.5 s
dt = median(diff(t));
nDwell = max(1, round(dwellSec/dt));

idx = kStep:numel(t);
inBand = abs(y(idx) - yf) <= band;

metrics.settlingTimeS = t(end) - t(kStep);  % default = "didn't settle"

for k = 1:(numel(inBand) - nDwell + 1)
    if all(inBand(k:k+nDwell-1))
        metrics.settlingTimeS = t(idx(k)) - t(kStep);
        break;
    end
end

% Steady-state error (mean over last 10% of run)
n = numel(t);
k0 = max(1, floor(0.9*n));
metrics.steadyStateErrMean = mean(e(k0:end));
metrics.steadyStateErrMax = max(abs(e(k0:end)));

end