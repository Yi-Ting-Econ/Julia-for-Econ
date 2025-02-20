# Contraction Mapping #

mutable struct Results
    y::Float64
end

function contraction(x::Float64)
    y = 0.5 * x + 2
    return y
end

function fixed_point_finder(res::Results, mapping; tol=1e-10, max_iter=20_000)
    iter = 0
    old_y = res.y
    new_y = mapping(old_y)
    error = abs(new_y - old_y)

    while error > tol && iter < max_iter
        old_y = res.y
        new_y = mapping(old_y)
        error = abs(new_y - old_y)

        # Update the result stored in the mutable struct
        res.y = new_y

        # Update the iteration count
        iter += 1

        # Check for convergence
        if error < tol
            println("Converged after $iter iterations")
            break
        elseif iter == max_iter
            println("Maximum iterations reached")
        end
    end

    return res
end

# Example usage
res = Results(10.0)
fixed_point_finder(res, contraction)
println("Fixed point: ", res.y)

# The initial guess should not matter
res = Results(18.0)
fixed_point_finder(res, contraction)
println("Fixed point: ", res.y)


