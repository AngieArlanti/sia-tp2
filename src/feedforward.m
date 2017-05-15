function intermediateValues = feedforward(input, weights, configuration)
  intermediateValues = {input};
  for layer = 1:length(weights)
    layerWeights = weights{layer};
    h = evaluateFunction(intermediateValues{layer}, layerWeights);
    if(layer == length(weights))
      #exponential case, we need to normalize output between 0 and 1.
      layerOutputs = configuration.activationFunction(h,configuration.beta,1);
    else
      layerOutputs = configuration.activationFunction(h,configuration.beta);
    endif
    if layer != length(weights)
      intermediateValues{layer+1} = [layerOutputs -1];
    else
      intermediateValues{layer+1} = layerOutputs;
    endif
  endfor
endfunction
