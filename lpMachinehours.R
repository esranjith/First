library(lpSolveAPI)
f.obj = c(1,1)
f.constraints = matrix(c(50,24,30,33,1,0,0,1),ncol = 2, byrow = T)
f.dir = c("<=","<=",">=",">=")
f.rhs = c(2400,2100,45,5)
(cbind(f.constraints,f.dir,f.rhs))
lp("max",f.obj,f.constraints,f.dir,f.rhs)
lp("max",f.obj,f.constraints,f.dir,f.rhs)$solution


##Another Way
library(lpSolveAPI)

#First we create an empty model x.
?make.lp
#max: x + y - 50
lprec <- make.lp(0, 2)
lprec
set.objfn(lprec, c(1, 1))
lprec
#maximise it
lp.control(lprec, sense="max")
lprec

#set.type(lprec, c(1,2), type = c("integer"))
lprec
#50x + 24y <= 2400
add.constraint(lprec, c(50,24), "<=", 2400)
lprec
#30x + 33y <= 2100
add.constraint(lprec, c(30,33), "<=", 2100)
lprec
#x >= 45
#add.constraint(lprec, c(1,0), ">=", 45)
#lprec
#y >= 5
#add.constraint(lprec, c(0,1), ">=", 5)
#lprec
#50 >= x + y
add.constraint(lprec, c(1,1), ">=", 50)
lprec

set.bounds(lprec, lower = c(45, 5), columns = c(1, 2))
lprec

#set.bounds(lprec, upper = 48.98, columns = 4)
#RowNames <- c("MachineA", "MachineB","InitalA", "InitalB","TotalInitial")
RowNames <- c("MachineA", "MachineB","TotalInitial")
ColNames <- c("ProductX", "ProductY")
dimnames(lprec) <- list(RowNames, ColNames)
lprec
solve(lprec)   #[1] 0  ok
#get.dual.solution(lprec)
get.objective(lprec)
get.variables(lprec)
get.constraints(lprec)
plot(lprec)
print(lprec)
