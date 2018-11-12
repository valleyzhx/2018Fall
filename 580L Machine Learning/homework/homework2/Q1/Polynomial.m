function [X] = Polynomial(x, order)
    [n_samples,n_features] = size(x);
    
    X = ones(n_samples,1);
    k = 1;
    while k<=order
        X = [X x.^k];
        k = k+1;
    end

end