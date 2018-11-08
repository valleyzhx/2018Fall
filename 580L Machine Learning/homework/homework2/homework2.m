
%==================== test ==============
A = [1,2;3,4];
B = A*A;
C = A.*A;


%% ==================== Question 1.1 ====================%%
N=200;
x_train(:,1) = (0:N-1)/(N-1);
sin_x = sin(2*pi*x_train);


y_train = sin_x + normrnd(0,0.1,[N,1]);
plot(x_train,sin_x,'g');
hold on;
plot(x_train,y_train,'bo');

%% ==================== Question 1.2 ====================%%
train_size = [10, 50, 100, 150, 200];
orders = [0,1,2,3,9];

for s = 1:5
        size = train_size(s);
        fprintf(' train size: %d\n',size);
        nums=randperm(N,size);
        
        X_temp = x_train(nums);
        Y = y_train(nums);
        for lambda = 0:5
        fprintf('  lambda: %d\n',lambda);
            for o = 1:5
                order = orders(o);
                
                X = Polynomial(X_temp,order);           
                W = NormalEquation(X,Y,lambda);    
                mse = 1/N*sum((X*W-Y).^2)+lambda/N*sum(W.^2);
            fprintf('   order:%d => mse=%f\n',order,mse);
            end
        end        
        
end



%% ==================== Question 1.3 ====================%%
N_test = 199;

%X_test = X(1:N_train-1,1)+1/(2*N_train-1);







