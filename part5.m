function part5()

    x_guess=[1;2;3];
    [f_out,dfdx]=test_function02(x_guess);
    solver_params=[];
    [root,~]=multi_newton_solver_generalized(f_out,dfdx,solver_params);
    disp(root)
end