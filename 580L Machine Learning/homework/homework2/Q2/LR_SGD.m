function [ theta ] = LR_SGD( X,Y,initial_theta,iterations,alpha )
 [m,features] = size(X);

    theta = initial_theta;
     
    for j = 1:iterations      
        k = floor(rand*m)+1;     
        err = sigmoid(X(k,:)*theta) - Y(k);
        theta = theta - alpha/m*(err*X(k)');  
                     
    end

end

