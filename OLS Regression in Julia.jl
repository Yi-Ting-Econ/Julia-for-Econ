#######################
# OLS Regression in Julia #
#######################

using CSV
using DataFrames
using LinearAlgebra

# Step 1: Define the function to compute OLS regression coefficients
function ols_regression(y, x)
    x = hcat(ones(size(x, 1)), x)  # Add a column of ones to x for the intercept
    beta = inv(x' * x) * x' * y    # Calculate the OLS coefficient vector
    return beta
end

# Step 2: Load the dataset
file_path = "C:\\Users\\Desktop\\github\\auto.csv" #input the file path here
auto_data = CSV.read(file_path, DataFrame)

# Step 3: Define the dependent variable (y)
price = auto_data[:, :price]  # Assuming the column name for price is `price`

# Alternatively, define `price` by specifying the column number.
# If your dataset does not have properly named columns, you can use column indices to reference variables directly.
# price = auto_data[:, 2]  # Use the 2nd column of `auto_data` for `price`

# Step 4: Define the regressors (x)
regressors = hcat(auto_data[:, :mpg], auto_data[:, :trunk], auto_data[:, Symbol("gear_ratio")])

# Alternatively, define `regressors` by specifying column numbers
# regressors = hcat(auto_data[:, 3], auto_data[:, 6], auto_data[:, 11])

# Step 5: Run OLS regression
coefficients = ols_regression(price, regressors)

# Step 6: Display results
println("Coefficient for intercept: ", coefficients[1])
println("Coefficient for mpg: ", coefficients[2])
println("Coefficient for trunk: ", coefficients[3])
println("Coefficient for gear ratio: ", coefficients[4])
