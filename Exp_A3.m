T = 10^2;
xs = [0;1];
ys = [0;1];
gx = @(x,y)([2*x(1)+2*y(1);0]);
gy = @(x,y)([2*x(1)-2*y(1);0]);

[d_ogda]= OGDA_nonlinear(1,T,xs,ys,gx,gy);
[d_gda] = OGDA_nonlinear(0,T,xs,ys,gx,gy);
[d_omwu]= OMWU_nonlinear(1,T,xs,ys,gx,gy);
[d_mwu] = OMWU_nonlinear(0,T,xs,ys,gx,gy);

figure;
hold on;
set(gca,'FontSize',16);
plot(log(1:T),log(d_omwu));
plot(log(1:T),log(d_mwu));
plot(log(1:T),log(d_ogda));
plot(log(1:T),log(d_gda));


xlabel('$t$','Interpreter','latex');
ylabel('$\ln(\|\hat{z}_t-z^\star\|)$','Interpreter','latex');
legend('OMWU','MWU','OGDA','GDA');