function result = calculate(inputs, weights = [])
  result = [];
  inputsWithBiases = addBiasesToInputs(inputs);
  if (length(weights) == 0)
    arch = [2,8,4,1];
    weights = calculateWeights(arch);
  else
    arch = calculateArch(weights)
  endif
  for inputNumber = 1:rows(inputs)
    input = inputsWithBiases{inputNumber};
    outputs = feedforward(input, weights);
    result = [result; outputs{length(arch)}(1)];
  endfor
endfunction

# ---- Helper functions ---- #

function arch = calculateArch(weights)
  arch = []
  for i = 1:columns(weights)
    arch = [arch nnz(weights(:,i))]
  endfor
endfunction