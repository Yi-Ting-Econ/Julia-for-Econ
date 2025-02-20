##########################################################
# Finding the fixed point of a contraction #
##########################################################

# Define a mutable struct to store the result
mutable struct Results
    y::Float64 # Stores the current approximation of the fixed point
end

# Define a contraction mapping function
function contraction(x::Float64)
    y = 0.5 * x + 2
    return y
end

# Function to find the fixed point of the contraction mapping
#=
    This function iteratively applies the contraction mapping to approximate
    the fixed point. The process stops when the function value changes very little 
    (below `tol`) or when the maximum number of iterations (`max_iter`) is reached.

    Arguments:
    - res: A mutable struct storing the current approximation of the fixed point.
    - mapping: A function that represents the contraction mapping.
    - tol: The tolerance level for convergence (default: 1e-10).
    - max_iter: Maximum number of iterations allowed (default: 20,000).

    Returns:
    - The updated `Results` object with the estimated fixed point.
=#

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
res = Results(10.0) # Initialize the result struct with an arbitrary starting value
fixed_point_finder(res, contraction)
println("Fixed point: ", res.y)

# Try a different initial guess
res = Results(18.0)
fixed_point_finder(res, contraction)
println("Fixed point: ", res.y)
