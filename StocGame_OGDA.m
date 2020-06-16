function [xp,yp,g,d] = StocGame_OGDA(opt,l,p,T,xs,ys)
    H = size(l,1);
    S = size(l,2);
    M = size(l,3);
    N = size(l,4);
    x = ones(H,S,M)/M;
    y = ones(H,S,N)/N;
    xp = zeros(H,S,M);
    yp = zeros(H,S,N);
    d = zeros(T,H);
    g = zeros(T,H);
    eta = 0.125;
    rs = @(x)(reshape(x,numel(x),1));
    for t = 1:T
        Q = zeros(H,S,M,N);
        V = zeros(H,S);
        for h = H:-1:1
            for s = 1:S
                Q(h,s,:,:) = l(h,s,:,:);
                if h ~= H
                    for ss = 1:S
                        Q(h,s,:,:) = squeeze(Q(h,s,:,:)) + squeeze(p(h,s,ss,:,:)) * V(h+1,ss);
                    end   
                end
                if opt == 0
                    xp = x;
                    yp = y;
                end
                f = @(v)(squeeze(v(h,s,:)));
                J = squeeze(Q(h,s,:,:));
                V(h,s) = f(x)' * J * f(y);
                xx = SimplexProj ( f(xp) - eta*J*f(y) );
                yy = SimplexProj ( f(yp) + eta*J'*f(x) );
                x(h,s,:) = xx;
                y(h,s,:) = yy;
                
                g(t,h) = g(t,h) + (max(J'*f(x))-min(J*f(y)))/S;
                
                xp(h,s,:) = SimplexProj ( f(xp) - eta*J*f(y) );
                yp(h,s,:) = SimplexProj ( f(yp) + eta*J'*f(x) );
            end
            if nargin == 6
                d(t,h) = (norm(rs(xp(h,:,:))-rs(xs(h,:,:)))^2 + norm(rs(yp(h,:,:))-rs(ys(h,:,:)))^2 )^0.5;
            end
        end
    end
end