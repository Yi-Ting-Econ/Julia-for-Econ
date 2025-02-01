## Part1: Creating Arrays in Julia ##

# 1. Array Literals
# Maunually input each element of the array

    # One-dimensional array (vector)
    a = [1, 2, 3, 4]

    # Two-dimensional array (matrix)
    A = [1 2 3; 4 5 6; 7 8 9]

    # An empty array
    null = []


# 2. Predefined Functions for Arrays in Julia

    # zeros(n) creates an array of length n filled with zeros
    z = zeros(5)
    println(z)

    # ones(n) creates an array of length n filled with ones
    o = ones(3)
    println(o)

    # fill(value, n, m) creates an n x m array filled with the designated value
    
    # 2x2 matrix filled with 7's
    B = fill(7, 2, 2)
    # 3x2 matrix filled with 4's
    C = fill(4, 3, 2)
    # one-element vector filled with 6's (i.e. 6)
    D = fill(6, 1)
    # vector of length 7 filled with 5's 
    E = fill(5, 7)

    # Check: zeros(5) and fill(0, 5) are equivalent
    eval(:(zeros(5) == fill(0, 5)))

# 3. Range

    # Array from 1 to 10
    r = 1:10
    println(r)
    println(length(r)) # r is a vector of length 10

    # LinRange: Specify the number of points
        # e.g. Array of 5 evenly spaced numbers between 1 and 10
        # 1.0, 3.25, 5.5, 7.75, 10.0
        l = LinRange(1, 10, 5)
        println(l)

    # collect: Specify the step size
        # It's useful in creating grid points
        k_grid = collect(range(0.01, length = 1000, stop= 90.0))
        # Check the format of k_grid
        k_grid

# 4. Type-Specific Arrays

    # Array of floating-point numbers
    float_array = Float64[1.0, 2.0, 3.0]

    # Array of strings
    str_array = String["apple", "banana", "orange"]

#################################################################

## Part2: Indexing ##

# 1. Extracting the nth element in a vector
    # Recall the vector a we have defined in Part 1
    println(a)

    # Extract the 3rd element
    println(a[3])

    # Construct another vector
    t = LinRange(1, 100, 5)
    # Check how it looks 
    # [1.0, 25.75, 50.5, 75.25, 100.0]
    t
    # Extract the 4th element
    println(t[4])

# 2. Extracting columns, rows, or entries in a matrix

    # Recall the matrix A we have defined in Part 1
    println(A)

    # Extract the first column
    first_column = A[:, 1]
    println(first_column)

    # Extract the first row
    first_row = A[1, :]
    println(first_row)

    # Extract the element located in the 2nd row and 3rd column of the matrix
    pick = A[2, 3]
    println(pick)

    # Replace the first row of A with [11, 11, 11]
    A[1, :] = [11, 11, 11]
    println(A)

    # Extract the 2nd to 5th element of the vector
    X = [1, 3, 5, 7, 9, 11, 13]
    x = X[2:5]
    println(x)

