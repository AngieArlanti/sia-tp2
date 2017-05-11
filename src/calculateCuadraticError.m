function cuadraticError = calculateCuadraticError(patterns, updatedWeights, expectedOutputs)

  error = 0;
  for u = 1:length(patterns)
    obtainedOutput =  evaluateNetwork(patterns{u}, updatedWeights);
    error += sqrt(expectedOutputs{u} - obtainedOutput);
  endfor

  cuadraticError = error/2*length(patterns);

endfunction
