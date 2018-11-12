function [ y ] = LR_test( testX, theta )
%LR_TEST Summary of this function goes here
%   Detailed explanation goes here

    [length,~] = size(testX);
    y = zeros([length,1]);
    for m = 1:length
        temp = sigmoid(testX(m,:)*theta);
        if temp >= 0.5
            y(m) = 1;
        else
            y(m) = 0;
        end
    end
end

