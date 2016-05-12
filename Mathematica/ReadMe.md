# Intro
This folder contains the mathematica files used to analyze the E field result from BEMsolver or FEMreader. 

The result file forms in this format:
X Y Z Magnitude

# Functions
The notebooks cover the following functions
- Analytical simulation of RF field based on House's Method (Arctangent approximation) 
  This method can be further extended to include the gap between electrodes.
- Numerical simulation of RF field
- Numerical simulation of DC field
- RF barrier analysis
- Inhomogeneity analysis
- DC null searching (not robust - this search algorithm can fail sometime)

# Tips on debugging
-Please try using different search algorithm (FindRoot -> FindMaxiumum).
-Please pay attention to the upper and lower limits of the FindMax/FindMin functions.

