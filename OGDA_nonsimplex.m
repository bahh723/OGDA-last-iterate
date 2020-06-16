function [d] = OGDA_nonsimplex(T,n)
    x = ones(2,1)/2;
    y = ones(2,1)/2;
    xp = ones(2,1);
    yp = ones(2,1);
    d = zeros(T,1);
    eta = 0.125;
    gx = @(x,y)([-y(2);y(1)]);
    gy = @(x,y)([x(2);-x(1)]);
    for t = 1:T
        xx = CurveProj ( xp - eta*gx(x,y), n );
        yy = CurveProj ( yp + eta*gy(x,y), n );
        x = xx;
        y = yy;
        d(t) = (sum(xp.^2)+sum(yp.^2))^0.5;
        xp= CurveProj ( xp - eta*gx(x,y), n );
        yp= CurveProj ( yp + eta*gy(x,y), n );
    end
end