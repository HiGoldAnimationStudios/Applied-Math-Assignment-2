%computes a quadratic function on input X
function f_val = jacobian_test_function(X,A,B,C)
    output_length = length(C);
    f_val = B*X+C;
    for n = 1:output_length
        show1=(X'*A(:,:,n)*X)
        show2=f_val(n)
        f_val(n)=f_val(n)+(X'*A(:,:,n)*X);
    end
end