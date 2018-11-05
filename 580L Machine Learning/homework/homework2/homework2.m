
%==================== test ==============
A = [1,2;3,4];
B = A*A;
C = A.*A;


%% ==================== Question 1.1 ====================%%
N=200;
X(:,1) = (0:N-1)/(N-1);
sin_x = sin(2*pi*X);
Wn = 0 + 0.1*randn(N,1);

D = X+Wn;
% figure;
% plot(X,sin_x,X,D);
% fprintf('\nProgram paused. Press enter to continue.\n');
% pause;
%% ==================== Question 1.2 ====================%%
train_size = [10, 50, 100, 150, 200];

degeree = 3;
%pause;

for degree = 1:degeree
    fprintf('====== Degree %d Start ======\n',degree);
    for s = 1:5
        N_train = train_size(s);
        fprintf(' N_train: %d\n',N_train);

        nums=randperm(N,N_train);
        train = X(nums);
        if N == N_train
            train = X;
        end
        
        Y = D(nums);
        X_1 = [ones(N_train,1),train]; 

        for d=1:degeree
            if d==1
                X_1 = [ones(N_train,1),train];
            else
                X_1 = [X_1,train.^d];
            end  
        end

        W = (X_1.')*X_1\(X_1.')*Y;
        fprintf(' omega: ');
        fprintf('%f , ',W);
        fprintf('\n');

        for lambda = 0:5
            mse = 1/N*sum((X_1*W-Y).^2)+lambda/N*sum(W.^2);
            fprintf('  lambda:%d => mse=%f\n',lambda,mse);
        end
    end
    fprintf('====== Degree %d End ======\n',degree);
end

%% ==================== Question 1.3 ====================%%
N_test = 199;

X_test = X(1:N_train-1,1)+1/(2*N_train-1);







