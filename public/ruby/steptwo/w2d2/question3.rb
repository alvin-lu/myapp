# Transpose
# You are given a n * n 2D matrix
# Example:
# Matrix = [[1, 2],
#           [3, 4]]
# Write a method that will transpose a matrix. The transpose of a matrix is
# obtained by turning all of the columns of a matrix into the rows and vice
# versa. So an element at index ij would be at index ji once tranposed.
# For example:
# transpose(Matrix) = [[1, 3],
#                      [2, 4]]
#
# You may assume a square matrix as input. Do not use `.transpose`
def transpose(matrix)
  #
  # your code goes here
  #
  i = 0
  while i < matrix.length
    j = i
    while j < matrix.length
      if i != j
        temp_value = matrix[i][j]
        matrix[i][j] = matrix[j][i]
        matrix[j][i] = temp_value
      end
      j += 1
    end
    i += 1
  end
  matrix
end

# [ 1  2  3  4] [ 1  5  9 13] [ 1  5  9 13] [ 1  5  9 13]
# [ 5  6  7  8] [ 2  6  7  8] [ 2  6 10 14] [ 2  6 10 14]
# [ 9 10 11 12] [ 3 10 11 12] [ 3  7 11 12] [ 3  7 11 15]
# [13 14 15 16] [ 4 14 15 16] [ 4  8 15 16] [ 4  8 12 16]

puts '-------Transpose-------'
matrix_one = [[1, 2],
              [3, 4]]

matrix_two = [[1, 4, 7],
              [2, 5, 8],
              [3, 6, 9]]

matrix_three = [[1,  2,  3,  4],
                [5,  6,  7,  8],
                [9, 10, 11, 12],
                [13, 14, 15, 16]]

puts transpose(matrix_one) == [[1, 3],
                               [2, 4]]

puts transpose(matrix_two) == [[1, 2, 3],
                               [4, 5, 6],
                               [7, 8, 9]]

puts transpose(matrix_three) == [[1, 5, 9, 13],
                                 [2, 6, 10, 14],
                                 [3, 7, 11, 15],
                                 [4, 8, 12, 16]]
