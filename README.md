# N Puzzle Solutions
#### Abstract
The following project revolves around the study of the sliding tile problem of various sizes (8, 15 and 24) and solving it for the minimum required steps. The goal is to use various heuristics and find out their efficiencies with respect to a given problem.

#### Multi-Heuristic A* Algorithm
Heuristic A* is a search algorithm that is used extensively in path finding and graph traversal problems to find efficient paths through nodes. It enjoys a high use due to its efficiency and accuracy. A* achieves better performance by using heuristics to guide its search. 
> **Cost function** = Expenditure + Heuristic cost estimation

> **f(n) = g(n) + h(n)**

#### Sliding Tile Puzzle
```
    1  3        1     3        1  2  3        1  2  3        1  2  3
 4  2  5   =>   4  2  5   =>   4     5   =>   4  5      =>   4  5  6
 7  8  6        7  8  6        7  8  6        7  8  6        7  8 

 initial                                                      goal
 ```
The sliding tile puzzle is a combination puzzle in which the goal is to rearrange the tiles by sliding them into the vacant space available in order to put the puzzle into its original undisturbed form. In order to solve this puzzle using the A* algorithm, we define a node as a particular state of the puzzle. If one state can be reached from another with just one move then those two nodes are connected by an edge. Initially the puzzle is in one of the random states. In order to reach the final state an A* algorithm is used to traverse the nodes and edges to find the optimal solution or the shortest path to the goal. The A* algorithms traditionally used for solving this puzzle uses heuristic functions like Manhattan distance, Linear Conflict, Misplaced Tiles, N-Maxswap, Tiles out of row and column, etc. While useful all these functions have their own strengths and weaknesses depending on the complexity of the puzzle and the number of tiles in it. This experiment was designed in order to have a quantitative analysis of the difference in efficiency of using a single heuristic function versus using multiple heuristic functions. In this case the efficiency is determined by the number of unique nodes that are being explored in order to find the correct solution. The experiment was conducted with 3x3, 4x4, and 5x5 puzzles. The complexity of the puzzle was defined by the least number of steps that are necessary to reach the goal. The heuristic functions used in this experiment are:
1. __Manhattan Distance__: It is the distance between two points measured along axes at
right angles.
2. __Linear Conflict__: Two tiles p and q are in a linear conflict if p and q are in the same
line, the goal positions of p and q are both in that line, p is to the right of q and goal
position of p is to the left of the goal position of q.
3. __Misplaced Tiles__: This refers the number of tiles that are not in their final position.
4. __Tiles out of row and column__: This refers to the number of tiles that are not in the
same row or column as their final position.
Many of these heuristic functions seem almost redundant in first due to the fact that they
are similar whether it be tiles just out of their position or if they are out of the correct row
or column. But only the result can judge their effectiveness and independence from each
other.