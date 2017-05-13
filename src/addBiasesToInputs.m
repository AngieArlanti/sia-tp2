function inputsWithBiases = addBiasesToInputs(inputs)
  inputsWithBiases = {};
  for i = 1:length(inputs)
    inputsWithBiases{i} = [inputs{i}(1,:) -1];
  endfor
endfunction
