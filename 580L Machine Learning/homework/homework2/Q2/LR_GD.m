function [ theta ] = LR_GD( X,Y,initial_theta,iterations,alpha )

    [m,features] = size(X);

    theta = initial_theta;


    for j = 1:iterations   
         err = sigmoid(X*theta)-Y;
         theta = theta -alpha/m*X'*err;        
    end
    
end

