using SpecialMatrices, DiffEqBase
A = -full(Strang(11))
A[end,1] = 1
A[1,end] = 1
g(t,u) = 2-u
u0 = zeros(11);u0[6]=1
nsteps = 1000;
tmax = 10.0;
h = tmax/nsteps;
u = u0;
t = 0


#################SOLUTION########################
nsteps = 1000
tmax = tmax
h = tmax/nsteps
u = u0
t = 0
for k in 1:nsteps
	u = expm(h*A)*u + h*((expm(h*A)-1)\(h*A))*g(t,u)
	t = k*h
end

sol = SolveSplitODE(A,g,u0,10.0)
println("The final value of U is 1: ",sol)
u = u0;
t = 0

for k in 1:nsteps
  u = u + h*(A*u) + h*g(t,u)
  t = k*h
end
println("The final value of U is sol : ",u)
