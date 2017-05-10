function obtainedOutput =  evaluateNetwork(input, weights)

  intermediateValues = feedforward(input, weights);
  obtainedOutput = intermediateValues(end);

endfunction
