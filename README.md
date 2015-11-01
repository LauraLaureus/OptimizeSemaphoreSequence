# OptimizeSemaphoreSequence
Optimization of Semaphore seqience in a simulator using genetic algoritms. 

#Goal
The simulator has 4 roads, 2 vertical and 2 horizontal, which cross in 4 positions. Every intercection has 2 semaphores (one for vertical and another for horizontal) when a horizontal semaphore is open, the vertical for the same intersection is closed. The goal is to maximize the number of cars which exit the simulator using genetic algoritms. 

#Operators
Operators used for this problem: 
Fitness: output from simulator.
Selection: probabilistic tourneau. 
Crossover: third parent crossover (for two children).
Mutation: probabilistic mutation.

#Probabilistic tourneau.
From the pool of chromosomas, two of them are selected and sortered by the fitness. A chromosoma can be chose more than one time.A random number is given, if that random number is bigger than probability parameter then the chromosoma with biggest fitness is chosen otherwise the chromosoma with lowest fitness is chosen. 
This operation is done until we have the same number of chosen chromosomas than size of pool of chromosomas.
Random number and fitness values are from 0 to 1.
  The aim of chosing this operator is to give a chance to those worse solutions who may be nearest to better solutions.

#Third parent crossover.
  For a random pair of chromosomas there is another chromosoma related. Tuple: (father, mother) + father2
For each tuple there will be two sons, created with a  chromosoma-mask and its first inverse.
Mask is generated with random integer numbers from 1 to n, when n is the number of parents. For every position the number indicates from whom the data is taken (first, second or thrid parent).
The inverse is created by applying the next function for every position in the chromosoma: current_mask_position + 1 module number of parents.
  The aim of chossing this operator is to slow down the convergence by checking more diver solutions.

#Probabilistic mutation
  For every genetic algorithm iteration there will be a probability of mutation given by the formula 1/number_iterations. By doing this, first iterations will have more chance to mutate and in the last iteration hardly ever mutate.So we can navigate more different solutions in the domain. 
  
#Langauges chosen:
Java: for developing the simulator.
MatLab: for genetic algoritm development.

This is a practise for the subject Intelligent Systems I - Computer Science Degree - Las Palmas de Gran Canaria University (ULPGC)
