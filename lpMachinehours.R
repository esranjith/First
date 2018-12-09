library(lpSolveAPI)
f.obj = c(1,1)
f.constraints = matrix(c(50,24,30,33,1,0,0,1),ncol = 2, byrow = T)
f.dir = c("<=","<=",">=",">=")
f.rhs = c(2400,2100,45,5)
(cbind(f.constraints,f.dir,f.rhs))
lp("max",f.obj,f.constraints,f.dir,f.rhs)
lp("max",f.obj,f.constraints,f.dir,f.rhs)$solution
