function result = calculate(inputs, weights, configuration)
  result = [];
  #inputsWithBiases = addBiasesToInputs(inputs);
  #if (length(weights) == 0)
  #  arch = [2,3,1];
  #  weights = calculateWeights(arch);
  #else
  #  arch = calculateArch(weights)
  #endif
  #for inputNumber = 1:rows(inputs)
    #input = inputsWithBiases{inputNumber};
    #outputs = feedforward(input, weights, configuration);
    #result = [result; outputs{length(arch)}(1)];
  #endfor
  indexShuffle = randperm(length(inputs));
  for i = 1:length(inputs)
    outputs = feedforward(inputs{indexShuffle(i)}, weights,configuration);
    result = [result; outputs{length(weights)}(1)];
  endfor
endfunction

# ---- Helper functions ---- #

#function arch = calculateArch(weights)
#  arch = []
#  for i = 1:columns(weights)
#    arch = [arch nnz(weights(:,i))]
#  endfor
#endfunction
