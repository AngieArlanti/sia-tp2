function intermediateValues = feedforward(input, weights)
  intermediateValues = {input};
  for layer = 1:length(weights)
    layerWeights = weights{layer};
    layerOutputs = evaluateFunction(intermediateValues{layer}, layerWeights);
    if layer != length(weights)
      intermediateValues{layer+1} = [layerOutputs -1];
    else
      intermediateValues{layer+1} = layerOutputs;
    endif
  endfor
endfunction
