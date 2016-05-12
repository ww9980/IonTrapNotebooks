* Intro
This folder contains the mathematica files used to analyze the E field result from BEMsolver or FEMreader. 
The result file forms in this format:
X Y Z Magnitude

The notebooks cover the following functions
1. Analytical simulation of RF field based on House's Method (Arctangent approximation) 
  This method can be further extended to include the gap between electrodes.
2. Numerical simulation of RF field
3. Numerical simulation of DC field
4. RF barrier analysis
5. Inhomogeneity analysis
6. DC null searching (not robust - this search algorithm can fail sometime)

* Tips on debugging
Please try using different search algorithm (FindRoot -> FindMaxiumum).
Please pay attention to the upper and lower limits of the FindMax/FindMin functions.

