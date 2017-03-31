
using SpecialMatrices, DiffEqBase
A = -full(Strang(11))
A[end,1] = 1
A[1,end] = 1
g(t,u) = 2-u
u0 = zeros(11); u0[6] = 1
nsteps = 30;
tmax = 10.0;
h = tmax/nsteps;
u = u0;
t = 0

phi = expm(-h*A)
#################SOLUTION########################
for k in 1:nsteps
	phi = (phi-1)\(-A)
	u = expm(-h*A)*u + phi*g(t,u)
	t = k*h
	println("U is : ",u)
	println("step: ",k)
end
println("The final value of U is : ",u)

