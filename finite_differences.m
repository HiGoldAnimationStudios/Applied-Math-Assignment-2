function dvdtheta = finite_differences(vertex_coords, leg_params, theta)
    vertex_coords_root= @(theta)compute_coords(vertex_coords, leg_params, theta);
    tip_coords=vertex_coords_root(13,14);
    disp(tip_coords)
    
end