
function [ theta ] = LR_GDRU( X,Y,initial_theta,iterations,alpha,lambda )
    [m,features] = size(X);

    theta = initial_theta;

    for j = 1:iterations   
         err = sigmoid(X*theta)-Y;
         lam_the = lambda*theta;
         lam_the(1) = 0;
         theta = theta -alpha/m*(X'*err + lam_the);  
    end
    
end

