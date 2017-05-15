function obtainedOutput =  evaluateNetwork(input, weights,configuration)

  intermediateValues = feedforward(input, weights,configuration);
  obtainedOutput = intermediateValues{end};

endfunction
