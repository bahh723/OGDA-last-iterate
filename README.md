# OGDA-last-iterate

### Test environment
MATLAB.2018b or above.
### Instruction
Run Exp_Ai.m, where i = 1,..,5 is for Experiment in Appendix A i respectively.

### Files
a1.mat is the game matrix in considered Appendix A.1
a5.mat is the set of game matrices considered in Appendix A.5

CurveProj.m: The function used to project a point to the feasible set defined in Appendix A.2

OGDA_nonlinear.m: OGDA algorithm on non-linear utility function f(x,y), used in Appendix A.3 and A.4.
OMWU_nonlinear.m: OMWU algorithm on non-linear utility function f(x,y). used in Appendix A.3 and A.4.
OGDA_Simplex.m: OGDA algorithm with feasible set a simplex.
OMWU_Simplex.m: OMWU algorithm with feasible set a simplex.
OGDA_nonsimplex.m: OGDA algorithm on function f(x,y) with non-simplex feasible set.

SimplexProj.m: projection function for OGDA 
SimplexProj2.m: projection function for OMWU 

StocGame_OGDA.m, StocGame_OMWU.m: OGDA and OMWU algorithm used in Appendix A.5
