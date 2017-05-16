function  normalized = normalizeOutputs(outputs,configuration)
  if(configuration.activationFunctionName == "tanh")
    minV = -1;
    maxV = 1;
    minScale = -0.8;
    maxScale = 0.8;
  elseif(configuration.activationFunctionName == "exp")
    normalized = normalize(outputs, 0, 1, 0.1, 0.9);
    minV = 0;
    maxV = 1;
    minScale = 0.1;
    maxScale = 0.9;
  endif
  normalized = {};
  for i = 1:length(outputs)
    normalized{i} = normalize(outputs{i}, minV, maxV, minScale, maxScale);
  endfor
endfunction
