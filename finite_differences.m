function dvdtheta = finite_differences(vertex_coords, leg_params, theta)
    vertex_coords_root= @(theta) compute_coords(vertex_coords, leg_params, theta);
    
    dvdtheta=approximate_derivative(vertex_coords_root, theta, 1);
    
end