%Implementation of finite difference approximation
%for Jacobian of multidimensional function
%INPUTS:
%fun: the mathetmatical function we want to differentiate
%x: the input value of fun that we want to compute the derivative at
%OUTPUTS:
%J: approximation of Jacobian of fun at x
function J = approximate_jacobian(fun,x)

    J = zeros(length(fun(x)),length(x));

    
    h=1e-6;

    for i=1:length(x)
    
        dfdx=approximate_derivative(fun,x,i);
        J(:,i)=dfdx;
        
    end
    %set the step size to be tiny
    %delta_x = 1e-6;
    %compute the function at different points near x
    %f_left = fun(x-delta_x);
    %f_0 = fun(x);
    %f_right = fun(x+delta_x);
    %approximate the first derivative
    %dfdx = (f_right-f_left)/(2*delta_x);

end