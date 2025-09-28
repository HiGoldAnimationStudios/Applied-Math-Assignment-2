unction orion_in_class()
    X0=randn(3,1)    
    J_numerical=approximate_derivative01()
    [~,J_analytical]=test_function01(X0)

    solver_params=struct();
    solver_params.dxmin=1e-10;
    solver_params.ftol=1e-10;
    solver_params.dxmax=1e8;
    solver_params.max_iter=1000;
    

    Xguesss=randn(3,1);
    

    f_root=test_function01
end