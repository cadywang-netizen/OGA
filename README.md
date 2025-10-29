Orthogonal Greedy Algorithm (OGA) for Solving PDEs

**Language:** MATLAB  
**Keywords:** orthogonal greedy algorithm, partial differential equations, sparse approximation, numerical analysis, neural network approximation, finite element methods  

Hey there!
This project is my implementation of the Orthogonal Greedy Algorithm (OGA), which is a mathematical framework that blends ideas from numerical analysis and machine learning to solve differential equations more efficiently. This started as a question I kept coming back to: Can a neural-network-like approach be used to solve physical equations directly? Instead of learning from data, could a network learn from the equation itself? That’s what the OGA does. It builds up a solution to a partial differential equation one “neuron” at a time.

Think of it as teaching a tiny neural network to approximate solutions to physics problems. But instead of training it on data, we’re training it on equations themselves.
Each neuron (a ReLU function) represents a piece of the PDE’s solution, and the algorithm “greedily” picks the most useful ones to build up the full answer.

It’s a fun intersection of functional analysis, optimization, and scientific computing with some surprisingly beautiful math behind it.

## Overview
This project implements and analyzes the **Orthogonal Greedy Algorithm (OGA)** for solving one-dimensional second-order partial differential equations of the form:
(-Δ)u + u = f, x ∈ (-1,1)
du/dn = 0 (zero Neumann-type boundary condition)

The algorithm uses a **shallow neural network dictionary**:
{ ReLU^k(wx + b) | |w| = 1, b ∈ [-2, 2] }

to approximate the PDE solution iteratively. Theoretical convergence rates (from Hao et al., 2021) are achieved and verified experimentally:
- O(N⁻⁴) in L² norm  
- O(N⁻³) in H¹ norm when k = 3  

## Core Components
- **`gradientdescent.m`** — Computes loss and gradient with respect to neuron parameters (w, b) using ReLU activation and its derivatives.  
- **`initialguess.m`** — Performs a coarse parameter search to generate a good initialization by evaluating the loss surface across a parameter mesh.  
- **Main OGA Loop** — Iteratively selects neurons, computes orthogonal projections, updates coefficients, and evaluates convergence in both L² and H¹ norms.  
- **Quadrature Utilities** — Implements high-order Gaussian quadrature for accurate numerical integration in 1D–3D.  
- **Activation Modules** — Includes ReLU, sigmoid, and their derivatives used in PDE and symmetric function contexts.  

## Usage
1. Open MATLAB and set this folder as the working directory.  
2. Run the main OGA script (top-level section of the provided file).  
3. Adjust parameters such as:
   ```matlab
   nNeuron = 2^6;        % number of neurons
   degree  = 3;          % power of ReLU
   option  = 2;          % training method (1 = GD, 2 = Newton)

The program outputs:

Approximation plots (u_N vs. exact u)
Convergence tables in L² and H¹ norms
Theoretical vs. observed convergence orders

