using ModelingToolkit, Test
@parameters α β δ
expr = (((1 / β - 1) + δ) / α) ^ (1 / (α - 1))
ref = [β, δ, α]
sol = ModelingToolkit.get_variables(expr)
@test all([sol[i].op.name == ref[i].op.name for i in 1:3])

@parameters γ
s = α => γ
new = (((1 / β - 1) + δ) / γ) ^ (1 / (γ - 1))
ModelingToolkit.substitute_expr!(expr, s)
@test isequal(expr, new)
