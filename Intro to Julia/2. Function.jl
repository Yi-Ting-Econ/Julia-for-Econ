#########################################################################################################################
# Part 1: Basic Function Definitions
#########################################################################################################################

#=
    In Julia, functions take inputs (called arguments) and produce outputs (called return values). 
=#
    
# (1) Standard Function Definition

    # A function in Julia can be defined using the `function` keyword followed by the function name and the arguments
    # in parentheses. 

    function add(x::Int64, y::Int64)
        return x + y
    end

    # In this example:
    # - Arguments: `x` and `y`, both specified to be integers (`Int64`).
    # - Return value: The function returns the sum of `x` and `y`.

    # Another example:

    function poly(x)
        return x^2 + 2x + 1
    end

    # Call the function and print the result
    println(poly(3))  # Output: 16

    # You can assign the output of the function to a variable
    result = add(2, 3)
    println(result)  # Output: 5

# (2) Inline Function Definition

    # For shorter functions, you can define them in a more compact, single-line format:
    add_inline(x::Int64, y::Int64) = x + y

    # You can also use an anonymous function (a function without a name) using the `->` syntax:
    f = x -> x^2 + 2x + 1
    println(f(3))  # Output: 16

#########################################################################################################################
# Part 2: Specifying the Types of Arguments
#########################################################################################################################  

#=
    When defining functions, specifying argument types (like `Int64` or `Number`) allows you to control
    the kinds of inputs your function can accept. For example:
=#

    # This function only accepts integer arguments
    function add_int(x::Int64, y::Int64)
        return x + y
    end

    # This will raise an error: add_int(2.1, 3.1)

    # To make the function more flexible and allow other types of numbers (like floating-point values),
    # we can redefine it as follows:

    function add_numbers(x::Number, y::Number)
        return x + y
    end

    # Call the function and print the result
    println(add_numbers(2.1, 3.1))  # Output: 5.2

    # Here:
    # - Arguments: `x` and `y`, of type `Number` (a more general type that includes both integers and floating-point numbers).
    # - Return value: The sum of `x` and `y`, which can now be any numeric type.

    # Function with no arguments
    function greet()
        return "Hello, World!"
    end

    println(greet())

#########################################################################################################################
# Part 3: Exercises
#########################################################################################################################     

# (1) Define a Factorial Function

    # Define the output case by case (n == 0 ; n > 0 ; n < 0)

    function factorial_manual(n::Int64)
        res = 1

        if n == 0
            return 1
        elseif n > 0
            for i = 1:n
                res *= i
            end
            return res
        else 
            return "Undefined"
        end    

    end

    println(factorial_manual(0))
    println(factorial_manual(4))
    println(factorial_manual(5))
    println(factorial_manual(-1))

# (2) Write a function that takes two vectors as arguments and computes their inner product


    function inner_product(v1::Vector{Float64}, v2::Vector{Float64})
        return sum(v1 .* v2)
    end

    vec1 = [1.0, 2.0, 3.0]
    vec2 = [4.0, 5.0, 6.0]
    println(inner_product(vec1, vec2))  # Output: 32.0

#########################################################################################################################
# Part 4: Example in Economics
######################################################################################################################### 

#=
    Define a Cobb-Douglas production function that computes output 
    based on inputs of capital and labor, 
    the capital share (α), and the total factor productivity (TFP).

    Arguments:
    - `capital`: The amount of capital input (K).
    - `labor`: The amount of labor input (L).
    - `k_share`: The share of capital in production (α), usually a value between 0 and 1.
    - `TFP`: Total Factor Productivity (A), representing the technology level or efficiency in production.
=#

# In a complex task, it is better to specify the type of inputs and the meaning of each arguments for a function.

    # Define a production function
    function production_function(capital::Float64, labor::Float64, k_share::Float64, TFP::Float64)
        K = capital
        L = labor
        α = k_share
        A = TFP
        return A * K^α * L^(1 - α)
    end

    output1 = production_function(100.0, 50.0, 0.3, 1.0) 
    println(output1)

    # Simplified version
    function production_function_compact(K, L, α=0.3, A=1) 
        return A * K^α * L^(1 - α)
    end

    output2 = production_function_compact(100, 50.0) 
    println(output2)

