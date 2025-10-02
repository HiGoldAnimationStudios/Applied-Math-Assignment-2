function strandbeest()
    %initialize leg_params structure
    leg_params = struct();
    %number of vertices in linkage
    leg_params.num_vertices = 7;
    %number of links in linkage
    leg_params.num_linkages = 10;
    %matrix relating links to vertices
    leg_params.link_to_vertex_list = ...
    [ 1, 3;... %link 1 adjacency
    3, 4;... %link 2 adjacency
    2, 3;... %link 3 adjacency
    2, 4;... %link 4 adjacency
    4, 5;... %link 5 adjacency
    2, 6;... %link 6 adjacency
    1, 6;... %link 7 adjacency
    5, 6;... %link 8 adjacency
    5, 7;... %link 9 adjacency
    6, 7 ... %link 10 adjacency
    ];
    %list of lengths for each link
    %in the leg mechanism
    leg_params.link_lengths = ...
    [ 50.0,... %link 1 length
    55.8,... %link 2 length
    41.5,... %link 3 length
    40.1,... %link 4 length
    39.4,... %link 5 length
    39.3,... %link 6 length
    61.9,... %link 7 length
    36.7,... %link 8 length
    65.7,... %link 9 length
    49.0 ... %link 10 length
    ];
    %length of crank shaft
    leg_params.crank_length = 15.0;
    %fixed position coords of vertex 0
    leg_params.vertex_pos0 = [0;0];
    %fixed position coords of vertex 2
    leg_params.vertex_pos2 = [-38.0;-7.8];
    %column vector of initial guesses
    %for each vertex location.
    %in form: [x1;y1;x2;y2;...;xn;yn]
    vertex_coords_guess = [...
    [ 0; 50];... %vertex 1 guess
    [ -50; 0];... %vertex 2 guess
    [ -50; 50];... %vertex 3 guess
    [-100; 0];... %vertex 4 guess
    [-100; -50];... %vertex 5 guess
    [ -50; -50];... %vertex 6 guess
    [ -50; -100]... %vertex 7 guess
    ];
    %theta=0;
    %vertex_coords_root = compute_coords(vertex_coords_guess, leg_params, theta);

    %mypath1 = 'C:\Users\jvidaurrazaga\Downloads\';
    mypath1 = 'C:\Users\llin\Downloads\';
    
    fname='leg_animation.avi';
    input_fname = [mypath1,fname];
    writerObj = VideoWriter(input_fname);
    open(writerObj);
    fig1 = figure(1);
    %set up the plotting axis
    %hold on; 
    axis equal; axis square
    axis([-120,20,-100,40])
    %initialize the plot of the leg
    
    x7_LA=[];
    y7_LA=[];
    x7_FD=[];
    y7_FD=[];
    x7_pos_list = [];
    y7_pos_list = [];
    theta_list=[];

    hold on
    path_plot = plot(0,0,'k--');
    tangent_plot = plot(0,0,'g');

    leg_drawing=initialize_leg_drawing(leg_params);

    title("Strandbeest Leg Animation")
    xlabel("X position")
    ylabel("Y position")


    for theta=0:0.03:6*pi
        vertex_coords_root = compute_coords(vertex_coords_guess, leg_params, theta);
        
        update_leg_drawing(vertex_coords_root, leg_drawing, leg_params)
        dVdtheta_LA=compute_velocities(vertex_coords_root,leg_params,theta);
        dVdtheta_FD=finite_differences(vertex_coords_root,leg_params,theta);
        if theta<=2*pi
            x7_pos_list(end+1) = vertex_coords_root(13);
            y7_pos_list(end+1) = vertex_coords_root(14);
            theta_list(end+1)=theta;
            
            x7_LA(end+1)=dVdtheta_LA(13);
            y7_LA(end+1)=dVdtheta_LA(14);
            
            x7_FD(end+1)=dVdtheta_FD(13);
            y7_FD(end+1)=dVdtheta_FD(14);
            
            set(path_plot,'xdata',x7_pos_list,'ydata',y7_pos_list)

        end

        x_tangent = vertex_coords_root(13)+[0,dVdtheta_LA(13)];
        y_tangent = vertex_coords_root(14)+[0,dVdtheta_LA(14)];
        set(tangent_plot,'xdata',x_tangent,'ydata',y_tangent)

        

    
        drawnow;
        %capture a frame (what is currently plotted)
        current_frame = getframe(fig1);
        %write the frame to the video
        writeVideo(writerObj,current_frame);
    end
    close(writerObj);

    figure(2)
    hold off
    subplot(2,1,1)
    plot(theta_list,x7_LA, "g")
    hold on
    plot(theta_list,x7_FD, "r--")
    legend("Linear Algebra", "Finite Differences")
    xlabel("Theta")
    ylabel("X Tip Velocity")
    title("X Velocity vs Theta")

    subplot(2,1,2)
    hold off
    plot(theta_list,y7_LA,"g")
    hold on
    plot(theta_list,y7_FD, "r--")
    legend("Linear Algebra", "Finite Differences")
    xlabel("Theta")
    ylabel("Y Tip Velocity")
    title("Y Velocity vs Theta")
    

    
end