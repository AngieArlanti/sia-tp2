function cuadraticError = calculateCuadraticError(patterns, updatedWeights, expectedOutputs)
  patterns
  inputsWithBiases = addBiasesToInputs(patterns);
  error = 0;
  for u = 1:length(inputsWithBiases)
    obtainedOutput =  evaluateNetwork(inputsWithBiases{u}, updatedWeights);
    error += sqrt(expectedOutputs{u} - obtainedOutput{1});
  endfor

  cuadraticError = error/2*length(patterns);

endfunction
