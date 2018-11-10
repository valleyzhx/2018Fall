
%==================== test ==============



%% ==================== Question 1.1 ====================%%
N=200;
x_train(:,1) = (0:N-1)/(N-1);
sin_x = sin(2*pi*x_train);


y_train = sin_x + normrnd(0,0.1,[N,1]);
%plot(x_train,sin_x,'g');

%plot(x_train,y_train,'bo');

%% ==================== Question 1.2 ====================%%
train_size = [10, 50, 100, 150, 200];
orders = [0,1,2,3,9];
lambdas = [0,1,4,9,16];

MSES = [];
OMGS = cell(5,5,5);

for s = 1:5
        size = train_size(s);
        fprintf(' train size: %d\n',size);
        nums=sort(randperm(N,size));
        
        X_temp = x_train(nums);
        Y = y_train(nums);
        for lamb = 1:5
            lambda = lambdas(lamb);
            fprintf('  lambda: %d\n',lambda);
            for o = 1:5
                order = orders(o);
                
                X = Polynomial(X_temp,order);           
                W = NormalEquation(X,Y,lambda);
                
                OMGS(o,s,lamb) = {W};
                
                fprintf('    order:%d   omega: ',order);
                fprintf('%f ',W);
                fprintf('\n');
                
                mse = sum((X*W-Y).^2)/size;
                MSES(o,s,lamb)=mse;
                %figure;
                %plot(X_temp',(X*W)','g',X_temp',Y','r');
                
                fprintf('     => mse=%f\n',mse);
            end
        end          
end


%
%{
for i=1:5
    figure;
    plot(train_size,MSES(1,:,i),'g',train_size,MSES(2,:,i),'r',train_size,MSES(3,:,i),'b',train_size,MSES(4,:,i),'c',train_size,MSES(5,:,i),'m');
%plot(train_size,MSES(:,:,1));
title(['\lambda = ',num2str(i)]);
legend({'oder 0','order 1','order 2','order 3','order 9'},'Location','northwest')
end
%}



%% ==================== Question 1.3 ====================%%
N_test = 199;

x_test = x_train(1:N_test)+1/(2*N_test);
y_test = y_train(1:N_test);

% order - size - lambda

Y = repmat(y_test,1,5);

for i=1:5
    mses2 = [];
    lamCell = OMGS(:,:,i);
    for o = 1:5
        order = orders(o);
        W = cell2mat(lamCell(o,:));
        X = Polynomial(x_test,order);
        
        mse = sum((X*W-Y).^2)/N_test;
        mses2(o,:)=mse;
    end
    
    figure;
    
    plot(train_size,mses2(1,:),train_size,mses2(2,:),train_size,mses2(3,:),train_size,mses2(4,:),train_size,mses2(5,:));

    title(['\lambda = ',num2str(lambdas(i))]);
    legend({'oder 0','order 1','order 2','order 3','order 9'},'Location','northwest')
end
 


