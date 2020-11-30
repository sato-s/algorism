# You are given a square grid with some cells open (.) and some blocked (X).
# playing piece can move along any row or column until it reaches the edge of the grid or a blocked cell.
# Given a grid, a start and an end position, determine the number of moves it will take to get to the end position.
#
# For example, you are given a grid with sides  described as follows:

# First create a graph from the grid. A graph can be constructed by going up, down,
#   left and right from a point (i,j) in the grid till we get a forbidden cell.
#   For every point (p,q) which can be visited from (i,j)
# we add an edge from  (i,j)to (p, q) 
# . As the number of rows and columns is n, we can give an integer number to a point as follows:
#
# Integer value of point (i,j) = i * n + j
#
# After adding the edges we can perform a simple breadth first search to find
# the shortest path from the given source to the destination. To learn how to find shortest path using BFS visit this link.

