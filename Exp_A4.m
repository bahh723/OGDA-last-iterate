T = 10^4;
xs = [0;1];
ys = [0;1];
figure;
hold on;
set(gca,'FontSize',16);
for n = 5:-1:2
    gx = @(x,y)([2*n*x(1)^(2*n-1)-y(1);0]);
    gy = @(x,y)([-2*n*y(1)^(2*n-1)-x(1);0]);
    [d]= OGDA_nonlinear(1,T,xs,ys,gx,gy);
    plot(log(1:T),log(d));
end


xlabel('$\ln(t)$','Interpreter','latex');
ylabel('$\ln(\|\hat{z}_t-z^\star\|)$','Interpreter','latex');
legend('$n=5$','$n=4$','$n=3$','$n=2$','Interpreter','latex');
