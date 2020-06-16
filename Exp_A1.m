load('a1.mat');
A = A/norm(A);
T = 10^6;
[xs,ys,~,~] = OGDA_Simplex(1,A,T*10);
[~,~,g_ogda,d_ogda]=OGDA_Simplex(1,A,T,xs,ys);
[~,~,g_gda,d_gda] = OGDA_Simplex(0,A,T,xs,ys);
[~,~,g_omwu,d_omwu]=OMWU_Simplex(1,A,T,xs,ys);
[~,~,g_mwu,d_mwu] = OMWU_Simplex(0,A,T,xs,ys);
figure;
hold on;
set(gca,'FontSize',16);
plot(1:T,log(d_mwu));
plot(1:T,log(d_omwu));
plot(1:T,log(d_gda));
plot(1:T,log(d_ogda));

xlabel('$t$','Interpreter','latex');
ylabel('$\ln(\|\hat{z}_t-z^\star\|)$','Interpreter','latex');
legend('MWU','OMWU','GDA','OGDA');

figure;
hold on;
set(gca,'FontSize',16);
plot(1:T,log(g_mwu));
plot(1:T,log(g_omwu));
plot(1:T,log(g_gda));
plot(1:T,log(g_ogda));

xlabel('$t$','Interpreter','latex');
ylabel('$\ln(\alpha_{f}\left(\widehat{z}_{t}\right))$','Interpreter','latex');
legend('MWU','OMWU','GDA','OGDA');