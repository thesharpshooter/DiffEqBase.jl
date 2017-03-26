
using SpecialMatrices, DiffEqBase, Plots
A = Strang(11)
function g(t,u)
  for i in eachindex(u)
    2 - u[i]
  end
  return u
end
u0 = zeros(11); u0[6] = 10
#println(A)
#println("This is g",g(1,u0))

#prob = SplitODEProblem((A,g),u0,(0.0,10.0))
#sol = solve(prob)

#################SOLUTION########################
nsteps = 120;
tmax = 10.0;
h = tmax/nsteps;
u = u0;
t = 0
for k in 1:nsteps
	u = expm(-h*A)*u + h*(expm(-h*A)-1)*((-h*A)^(-1))*g(t,u)
	t = k*h
	println("This is step",k)
	println("U is : ",u)
	#plot(u[0], t, color="red", linewidth=2.0, linestyle="--")
end
println("The final value of U is : ",u)
