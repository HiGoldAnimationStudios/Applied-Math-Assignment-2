%Implementation of finite difference approximation
%for Jacobian of multidimensional function
%INPUTS:
%fun: the mathetmatical function we want to differentiate
%x: the input value of fun that we want to compute the derivative at
%OUTPUTS:
%J: approximation of Jacobian of fun at x
function J = approximate_jacobian(fun,x)

    %set jacobian matrix size 
    J = zeros(length(fun(x)),length(x));

    for i=1:length(x)
        %calculate column of the jacobian which corresponds to the partial
        %derivatives for given each given set of guesses
        dfdx=approximate_derivative(fun,x,i);
        J(:,i)=dfdx;
    end
end