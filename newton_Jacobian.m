function root = newton_Jacobian(fun, J, X_0)
    max_iter = 1000;
    x_thresh = 1e-14;
    y_thresh = 1e-14;

    i = 0;
    guesses = [x0];
    x_n = X_0;
    
    while (i < max_iter)
        fun(x_n)
        x_n1 = x_n - J/fun;
        guesses(end + 1) = x_n;
        root = x_n;
        if (abs(x_n - x0) > x_thresh || abs(fun(x0)) > y_thresh)
            i = i + 1;
        else 
            i = max_iter + 1;
        end
        x0 = x_n;
    end
    guesses(end + 1) = root;

    root=x_n;

    
end