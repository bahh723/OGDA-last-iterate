# OGDA Linear Last-iterate Convergence

This repository contains source codes for the paper titled _Linear Last-iterate Convergence for Matrix Games and Stochastic Games_ authored by
[Chung-Wei Lee](https://chungwei.net/),
[Haipeng Luo](https://haipeng-luo.net/),
[Chen-Yu Wei](https://sites.google.com/site/bobcywei/)
and Mengxiao Zhang. 
The paper can be found at https://arxiv.org/abs/2006.09517.  

This paper is the first to show that in a two-player zero-sum bilinear game where each player's action is constrained in a polytope, the _Optimistic Gradient Ascent Descent_ algorithm achieves last-iterate convergence with linear convergence rate.  This holds under constant step sizes, any initial points, and _without_ the assumption that the equilibrium is unique (which is required in previous works).  The paper also extends this result to finite-horizon Markov games. 

### Test environment
MATLAB.2018b or above.
### Instruction
Run **Exp_Ai.m**, where i = 1,..,5 is for Experiment in Appendix A i respectively.

### Files
**a1.mat** is the game matrix in considered Appendix A.1

**a5.mat** is the set of game matrices considered in Appendix A.5

**CurveProj.m**: The function used to project a point to the feasible set defined in Appendix A.2

**OGDA_nonlinear.m**: OGDA algorithm on non-linear utility function f(x,y), used in Appendix A.3 and A.4.

**OMWU_nonlinear.m**: OMWU algorithm on non-linear utility function f(x,y). used in Appendix A.3 and A.4.

**OGDA_Simplex.m**: OGDA algorithm with feasible set a simplex.

**OMWU_Simplex.m**: OMWU algorithm with feasible set a simplex.

**OGDA_nonsimplex.m**: OGDA algorithm on function f(x,y) with non-simplex feasible set.

**SimplexProj.m**: projection function for OGDA 

**SimplexProj2.m**: projection function for OMWU 

**StocGame_OGDA.m**, **StocGame_OMWU.m**: OGDA and OMWU algorithm used in Appendix A.5
