function metrics = metricsRmsWindow(t, e, t_start, t_end, name)

% RMS of an error signal e(t) over a time period from [t_start, t_end]
% For gusting

% init struct
metrics = struct();
metrics.name = string(name);

t = t(:);
e = e(:);

mask = (t >= t_start) & (t <= t_end);
if ~any(mask)
    metrics.rms = NaN;
    metrics.note = 'No Samples in specified window';
    return;
end

metrics.rms = sqrt(mean(e(mask).^2));
metrics.t_start = t_start;
metrics.t_end = t_end;

end