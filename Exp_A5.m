load('a5.mat')
T = 10^4;
[xs,ys,~,~]=StocGame_OGDA(1,l,p,T*10);
[~,~,g_gda,d_gda] = StocGame_OGDA(0,l,p,T,xs,ys);
[~,~,g_ogda,d_ogda]=StocGame_OGDA(1,l,p,T,xs,ys);
[~,~,g_mwu,d_mwu] = StocGame_OMWU(0,l,p,T,xs,ys);
[~,~,g_omwu,d_omwu]=StocGame_OMWU(1,l,p,T,xs,ys);

figure;
hold on;
set(gca,'FontSize',16);
plot(1:T,log(sum(d_mwu,2)));
plot(1:T,log(sum(d_omwu,2)));
plot(1:T,log(sum(d_gda,2)));
plot(1:T,log(sum(d_ogda,2)));

xlabel('$t$','Interpreter','latex');
ylabel('$\ln(\sum_{s}\|\hat{z}_t^s-z_\star^s\|)$','Interpreter','latex');
legend('MWU','OMWU','GDA','OGDA');


figure;
hold on;
set(gca,'FontSize',16);
plot(1:T,log(g_mwu(:,1)));
plot(1:T,log(g_omwu(:,1)));
plot(1:T,log(g_gda(:,1)));
plot(1:T,log(g_ogda(:,1)));

xlabel('$t$','Interpreter','latex');
ylabel('$\ln(\alpha(\hat{z}_t))$','Interpreter','latex');
legend('MWU','OMWU','GDA','OGDA');

