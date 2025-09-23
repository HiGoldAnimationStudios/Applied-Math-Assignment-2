function part5()

    x_guess=[1;2;3];
    [f_out,dfdx]=test_function02(x_guess);
    solver_params=struct();
    solver_params.ftol=1e-10;
    solver_params.dxmax=1e8;
    solver_params.max_iter=1000;
    solver_params.numerical_diff=1;
    [root,~]=multi_newton_solver_generalized(f_out,dfdx,solver_params);
    froot=test_function01(root);
    disp(froot)
end