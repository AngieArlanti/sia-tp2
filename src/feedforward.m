function intermediateValues = feedforward(input, weights)
  intermediateValues = input;
  for layer = 1:length(weights)
    layerWeights = weights{layer};
    layerOutputs = evaluateFunction(intermediateValues{layer}, layerWeights);
    intermediateValues{layer+1} = [layerOutputs -1];
  endfor
endfunction
