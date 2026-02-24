# Requirements

### Mission Context:
Longitudinal autopilot for a small Unmanned Aerial Vehicle/General Air Vehicle to hold pitch and altitude during gusts and sensor noise.

### Requirement List:
Rq.1 - Pitch step response: For a +5 deg command, settling time less than or equal to 2.0 s, overshoot less than or equal to 10%

Rq.2 Pitch tracking: In steady conditions, |θ error| less than nor equal to 0.5 deg (after settling)

Rq.3 Altitude hold: For h_cmd step of +50 m, settling time less than or equal to 15 s, overshoot less than or equal to 10%

Rq.4 Actuator constraints: Elevator deflection |δe| less than or rqual to 25 deg, rate |dδe/dt| less than equa to 60 deg/s

Rq.5 Robustness: Stable and meeting R1/R2 under ~20% uncertainty on key aero derivatives

Rq.6 Disturbance rejection: Under gust disturbance, pitch error RMS less than or equal to 1.0 deg over a 30 s window