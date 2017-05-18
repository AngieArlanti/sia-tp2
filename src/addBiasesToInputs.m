function inputsWithBiases = addBiasesToInputs(inputs)
  inputsWithBiases = {};
  for i = 1:length(inputs)
    inputsWithBiases{i} = [-1 inputs{i}(1,:)];
  endfor
endfunction
