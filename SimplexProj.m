function [Y] = SimplexProj(X)
    D = size(X,1);
    S = sort(X,'descend');
    rho = max(((S + (1-cumsum(S))./(1:D)')>0 ).*(1:D)');
    lambda = (1-sum(S(1:rho)))/rho;
    Y = max(X+lambda,0);
end

