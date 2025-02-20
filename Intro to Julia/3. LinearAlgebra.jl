## Eigenvalues and Eigenvectors ##

# Remember to use the "LinearAlgebra" package before using eigvals, eigvecs, det and I(identity matrix)
using LinearAlgebra

# Construct a Matrix
    # A is a 2×2 matrix
    A = [1 3; 3 9]

# Compute the Eigenvalues
    # "eigenvalues" is a 2-element Vector
    eigenvalues = eigvals(A)
    println(eigenvalues)

# Check "det(A − λI) = 0"
    println(det(A - eigenvalues[1] * I))
    println(det(A - eigenvalues[2] * I))
    
# Compute the Eigenvectors
    # "eigenvectors" is a 2×2 Matrix that contains two eigenvectors
    #  any nonzero scalar multiples of these 2 vectors are also eigenvectors
    eigenvectors = eigvecs(A)
    println(eigenvectors)
