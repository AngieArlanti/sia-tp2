function result = calculate(inputs)
  result = [];
  inputsWithBiases = addBiasesToInputs(inputs);
	arch = [2,3,1];
	weights = calculateWeights(arch);
  for inputNumber = 1:length(inputs)
    input = inputsWithBiases{inputNumber};
    for layer = 1:length(weights)
      layerWeights = weights{layer};
      input{layer+1} = [evaluateFunction(input{layer}, layerWeights) -1];
    endfor
    result = [result; input{length(input)}(1)];
  endfor
endfunction

function inputsWithBiases = addBiasesToInputs(inputs)
  inputsWithBiases = {};
  for i = 1:rows(inputs)
    inputsWithBiases{i}{1} = [inputs(i,:) -1];
  endfor
endfunction