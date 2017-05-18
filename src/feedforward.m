function intermediateValues = feedforward(patternsWithBiases, weights, configuration)
  intermediateValues = {};
  intermediateValues{1} = patternsWithBiases;
  for layer=1:length(weights)
    h = intermediateValues{layer}*weights{layer};
    v = configuration.activationFunction(h,configuration.beta);
    if(layer != length(weights))
      intermediateValues{layer+1} = [-1 v];
    else
      intermediateValues{layer+1} = v;
    endif
  endfor
endfunction
