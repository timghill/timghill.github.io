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
