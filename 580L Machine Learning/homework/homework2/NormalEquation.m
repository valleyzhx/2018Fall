function [W] = NormalEquation(X,Y,lambda)
    
    [height,length] = size(X);
    A = eye(length);
    A(1,1) = 0;
    
    W = (X'*X+lambda*A)\(X')*Y;
    
end
