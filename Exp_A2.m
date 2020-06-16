T = 10^5;
xs = [0;1];
ys = [0;1];
figure;
hold on;
set(gca,'FontSize',16);
for n = 8:-2:2
    gx = @(x,y)([2*n*x(1)^(2*n-1)-y(1);0]);
    gy = @(x,y)([-2*n*y(1)^(2*n-1)-x(1);0]);
    [d]= OGDA_nonsimplex(T,n);
    plot(log(1:T),log(d));
end


xlabel('$\ln(t)$','Interpreter','latex');
ylabel('$\ln(\|\hat{z}_t-z^\star\|)$','Interpreter','latex');
legend('$n=8$','$n=6$','$n=4$','$n=2$','Interpreter','latex');
