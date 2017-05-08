function main1()

	arch = [2,3,1];
	weights = calculateWeights(arch);
	input = {[1, 2, -1]};
	for layer = 1:length(weights)
		layerWeights = weights{layer};
		input{layer+1} = [evaluateFunction(input{layer}, layerWeights) -1];
	endfor
	input
endfunction
