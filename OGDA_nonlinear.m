function [d] = OGDA_nonlinear(opt,T,xs,ys,gx,gy)
    x = ones(2,1)/2;
    y = ones(2,1)/2;
    xp = ones(2,1)/2;
    yp = ones(2,1)/2;
    d = zeros(T,1);
    eta = 0.125;
    for t = 1:T
        if opt == 0
            xp = x;
            yp = y;
        end
        xx = SimplexProj ( xp - eta*gx(x,y) );
        yy = SimplexProj ( yp + eta*gy(x,y) );
        x = xx;
        y = yy;
        d(t) = (sum((xs-xp).^2)+sum((ys-yp).^2))^0.5;
        xp = SimplexProj ( xp - eta*gx(x,y) );
        yp = SimplexProj ( yp + eta*gy(x,y) );
    end
end