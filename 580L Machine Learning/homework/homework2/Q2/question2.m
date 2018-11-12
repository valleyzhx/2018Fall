clear ; close all; clc
%load data
load ionosphere.mat;


N=301;%301
END = 351;%351
trainX = X(1:N,:);
trainc = Y(1:N,:);
train = char(trainc);
trainY = zeros(N,1);
%data preprocessing
for j = 1:size(train)
    if(isequal(train(j),'b'))
        trainY(j) = 0;
    else
        trainY(j) = 1;
    end
end
testX = X(N+1:END,:);
testc = Y(N+1:END,:);
test = char(testc);
testY = zeros(size(test));
for j = 1:size(test)
    if(isequal(test(j),'b'))
        testY(j) = 0;
    else
        testY(j) = 1;
    end
end

trainX = [ones(N, 1) trainX];
testX = [ones(END-N, 1) testX];



alpha = [0.0001,0.001,0.01,0.1];


%traing
[nsample,nfeature] = size(trainX);
init_theta = ones(nfeature,1);
trainerrors = zeros(1,length(alpha));
    errors = zeros(1,length(alpha));
   
weights = [1, 10, 100];
for fun = 1:5
    for i = 1:length(alpha)
   
        if fun ==1 
            theta = LR_GD(trainX,trainY,init_theta,2000,alpha(i));
        elseif fun == 2
           theta = LR_SGD(trainX,trainY,init_theta,2000,alpha(i));
        else
            theta = LR_GDRU(trainX,trainY,init_theta,2000,alpha(i),weights(fun-2));
        end
        
        trainres = LR_test(trainX,theta);
        trainerror = abs(trainres - trainY);    
        trainerrors(i) = sum(trainerror);
        %testing
        res = LR_test(testX,theta);
        error = abs(res-testY);
        errors(i) = sum(error);
        
        
    end
   figure;
   plot(alpha,trainerrors, '-ob', alpha,errors,'-or');
   ylabel('Errors');
   xlabel('Alpha');
   legend('training error','test error');
   if fun ==1 
       title('LR GD');
   elseif fun == 2
           title('LR SGD');
   else
       title(['LR GDRU \lambda = ' num2str(weights(fun-2))]);
   end

end
 
    
    




