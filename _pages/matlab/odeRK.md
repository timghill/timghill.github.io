---
permalink: /matlab/odeRK
title: "Runge-Kutta solver"
---

The function [`odeRK.m`](https://github.com/uwglacier/uwglacier.github.io/blob/main/code/matlab/odeRK.m) is an ODE integrator that uses an explicit fourth-order Runge-Kutta method. This is very similar to the built-in `ode45` function but without the adaptive timestep. This function is useful for prototyping models since it takes predictable timesteps. The syntax is described in the function header, and is nearly identical to the built-in Matlab integrators, except that you also have to provide the timestep.

The function is copied below, but download the most recent version from the Github page if you want to use it:

```matlab
function [T,Y] = odeRK(odefun,tspan,dt,v0)
% Runga-Kutta time stepping
%
%   [T, Y] = odeRK(odefun, tspan, dt, v0)
%
% This is a simple RK4 timestepping scheme built to use similar syntax as the
% built-in matlab ode integrators (e.g. ode45), but with an additional
% argument for the timestep (dt). The outputs are identical to those
% from the built-in time steppers. Automatically times the integration.
%
% INPUTS
% * odefun: Function with signature vprime = odefun(t, y)
% * tspan: Array [t0, t1] specifying initial and final time, or Nx1 array of
%   times to save the solution at.
% * dt: Timestep for RK method
% * v0: Initial value for state vector.

% Check if we need to fill out the tspan array
if length(tspan)==2
    tspan = tspan(1):dt:tspan(2);
end

tic;  % Timer

% Initialize solution array and time array
Y=zeros(length(tspan),length(v0));
T=tspan';

% Put the ICs as the first entry in the solution array
Y(1,:)=v0';

% Take first step
t=tspan(1);
vprime0 = odefun(t, v0);
v=v0 + dt*vprime0;
t=t+dt;

jj=2; % Index for stepping through tspan array
while t < tspan(end)
    % Determine next time step
    if t+dt >= tspan(jj)
        dt_ii=tspan(jj)-t;
        save_state=true;
    else
        dt_ii=dt;
        save_state=false;
    end

    % Advance the state vector
    k1 = odefun(t, v);
    k2 = odefun(t + dt_ii/2, v + dt_ii*k1/2);
    k3 = odefun(t + dt_ii/2, v + dt_ii*k2/2);
    k4 = odefun(t + dt_ii, v + dt_ii*k3);

    vprime = (k1 + 2*k2 + 2*k3 + k4)/6;
    v = v + dt_ii*vprime;
    t=t+dt_ii;

    if save_state
        Y(jj,:) = v';
        T(jj)=t;
        jj=jj+1;
    end

end
```

The script [`odeRK_tests.m`](https://github.com/uwglacier/uwglacier.github.io/blob/main/code/matlab/odeRK_tests.m) tests the integrator while providing examples of the two usage patterns.

```matlab
% Script odeRK_tests.m tests and shows the usage of odeRK.m

%% Test 1: Simple harmonic motion
omega = 2*pi; % Angular frequency
odefun = @(t, y) [y(2); -omega^2*y(1)];

% Solve with RK time stepping
tspan = [0; 4];
dt = 1/25;
v0 = [0.2; 0];  % Small displacement ICs since this is linear oscillator
% Solve using both RK and built-in adaptive method
[tt_RK, Y1_RK] = odeRK(odefun, tspan, dt, v0);
[tt_45, Y1_45] = ode45(odefun, tspan, v0);

figure
hold on
plot(tt_RK, Y1_RK(:,1))
plot(tt_45, Y1_45(:, 1))
plot(tt_RK, 0.2*cos(tt_RK*2*pi), 'linestyle', '--') % Exact solution
legend({'RK', '45', 'Exact'})
title('Simple Harmonic Motion')

%% Test 2: Lotka-Volterra predator/prey model
% Non-dimensionalized model
alpha = 0.75;
odefun = @(t, y) [y(1) - alpha.*y(1).*y(2); y(1).*y(2) - y(2)];

y0 = [1; 1];

% This is useful if storing your outputs is expensive/your timestep needs
% to be really small
tspan = linspace(0, 30, 101);

dt = 0.01;
[tt_RK, Y_RK] = odeRK(odefun, tspan, dt, y0);
[tt_45, Y_45] = ode45(odefun, tspan, y0);

figure
subplot(1, 2, 1)
hold on
plot(tt_RK, Y_RK(:, 1))
plot(tt_45, Y_45(:, 1))
xlabel('Time')
ylabel('Prey population')
legend({'RK', '45'})

% NOTE phase-space plots for this sytem need more than 100 points to look
% periodic. Try changing tspan to [0, 30] to see the smooth solution
subplot(1, 2, 2)
hold on
plot(Y_RK(:, 1), Y_RK(:, 2))
xlabel('Prey population')
ylabel('Predator population')
```
