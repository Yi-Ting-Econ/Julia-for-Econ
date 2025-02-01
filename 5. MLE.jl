using Random, Distributions, LinearAlgebra, Optim

# Step 1: Generate synthetic data
Random.seed!(42)
n = 100  # Number of observations
x = randn(n)  # Independent variable
β_true = [2.0, 3.0]  # True intercept and slope (β₀ = 2, β₁ = 3)
σ_true = 1.5  # True standard deviation of errors
ϵ = σ_true * randn(n)  # Normally distributed errors
y = β_true[1] .+ β_true[2] .* x .+ ϵ  # Generate dependent variable

# Step 2: Compute OLS estimates using matrix algebra
X = hcat(ones(n), x)  # Design matrix with intercept term
β_ols = (X'X) \ (X'y)  # OLS formula: β̂ = (X'X)⁻¹ X'Y
σ2_ols = sum((y .- X * β_ols) .^ 2) / n  # MLE estimate for variance

println("OLS Estimates:")
println("β₀: ", β_ols[1], "  β₁: ", β_ols[2], "  σ²: ", σ2_ols)

# Step 3: Compute MLE estimates by maximizing log-likelihood
function log_likelihood(params)
    β₀, β₁, log_σ = params
    σ = exp(log_σ)  # Ensure σ > 0
    residuals = y .- (β₀ .+ β₁ .* x)
    return -sum(logpdf(Normal(0, σ), residuals))  # Negative log-likelihood
end

# Initial guesses for parameters
initial_params = [0.0, 0.0, log(1.0)]
result = optimize(log_likelihood, initial_params, BFGS())

β_mle = result.minimizer[1:2]  # MLE estimates for β₀ and β₁
σ2_mle = exp(2 * result.minimizer[3])  # MLE estimate for σ²

println("\nMLE Estimates:")
println("β₀: ", β_mle[1], "  β₁: ", β_mle[2], "  σ²: ", σ2_mle)
