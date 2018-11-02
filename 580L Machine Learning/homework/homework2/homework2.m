
%% ==================== Question 1.1 ====================%%
N=200;
X = (0:N-1)/(N-1);

Wn = 0 + 0.1*randn(1,N);

f_x = sin(2*pi*X);
D = f_x+Wn;
 figure;
 plot(X,f_x,X,D);
 %plot(X,D);
 
% fprintf('\nProgram paused. Press enter to continue.\n');
% pause;
%% ==================== Question 1.2 ====================%%





