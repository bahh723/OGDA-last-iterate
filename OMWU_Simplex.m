function [xp,yp,g,d] = OMWU_Simplex(opt,A,T,xs,ys)
    M = size(A,1);
    N = size(A,2);
    x = ones(M,1)/M;
    y = ones(N,1)/N;
    xp = ones(M,1)/M;
    yp = ones(N,1)/N;
    d = zeros(T,1);
    g = zeros(T,1);
    for t = 1:T
        eta = 0.125;
        if opt == 0
            xp = x;
            yp = y;
        end
        xx = SimplexProj2 ( xp .* exp(-eta*A*y) );
        yy = SimplexProj2 ( yp .* exp(eta*A'*x) );
        x = xx;
        y = yy;
        if nargin == 5
            d(t) = (sum((xs-xp).^2)+sum((ys-yp).^2))^0.5;
        end
        g(t) = max(A'*xp)-min(A*yp);
        xp = SimplexProj2( xp .* exp(-eta*A*y) );
        yp = SimplexProj2( yp .* exp(eta*A'*x) );
    end
end
