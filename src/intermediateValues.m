function intermediateValues = calculateIntermediateValues(input, weights, layerCount)
  intermediateValues = input;
  for layer = 1:(layerCount-1)
    layerWeights = weights{layer};
    layerOutputs = evaluateFunction(intermediateValues{layer}, layerWeights);
    intermediateValues{layer+1} = [layerOutputs -1];
  endfor
endfunction
