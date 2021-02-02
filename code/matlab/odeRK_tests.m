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