function [cuadraticError, obtainedOutputs] = calculateCuadraticError(patterns, updatedWeights, expectedOutputs, configuration)

inputsWithBiases=addBiasesToInputs(patterns);
  error = 0;
  for u = 1:length(inputsWithBiases)
    obtainedOutput =  evaluateNetwork(inputsWithBiases{u}, updatedWeights, configuration);
    error += (expectedOutputs{u} - obtainedOutput)^2;
    obtainedOutputs{u} = obtainedOutput;
  endfor

  cuadraticError = error/(2*length(inputsWithBiases));
endfunction
