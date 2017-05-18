function obtainedOutput =  evaluateNetwork(inputWithBiases, weights,configuration)

  intermediateValues = feedforward(inputWithBiases, weights,configuration);
  obtainedOutput = intermediateValues{end};

endfunction
