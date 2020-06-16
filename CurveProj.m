function [y] = CurveProj(x,n)
    v = zeros(1,2*n);
    v(1) = n;
    v(2*n) = -x(1);
    v(n+1) = v(n+1)-n*x(2);
    v(2*n-1) = v(2*n-1)+1;
    r = roots(v);
    %r = roots([1,0,0.5-x(2),-0.5*x(1)]);
    r = r(r==real(r));
    y = [r;r^n];
end

