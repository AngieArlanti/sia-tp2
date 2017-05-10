function inputsWithBiases = addBiasesToInputs(inputs)
  inputsWithBiases = {};
  for i = 1:rows(inputs)
    inputsWithBiases{i} = [inputs{i}(i,:) -1];
  endfor
endfunction
