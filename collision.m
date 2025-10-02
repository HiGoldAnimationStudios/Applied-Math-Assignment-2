%This function calculates the difference between the two projectiles and
%allows us to use our Multi Dimensional Newton Solver on it
function V =collision(X)
    theta=X(1);
    time=X(2);
    V_p=projectile_traj(theta,time);
    V_t=target_traj(time);
    V = V_p-V_t;
    % x=V_p(1)-V_t(1);
    % y=V_p(2)-V_t(2);
    % V=[x;y];
end