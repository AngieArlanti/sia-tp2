function updatedWeights = trainNetwork(patterns, weights, expectedOutputs,configuration)
	
	patternsWithBiases = addBiasesToInputs(patterns);
	deltaStructure = {};
	indexShuffle = randperm(length(patterns));
	updatedWeights = weights;

	for patternIndex = 1 : length(patterns)
		layers = feedforward(patternsWithBiases{indexShuffle(patternIndex)},updatedWeights,configuration);		
		error = expectedOutputs{indexShuffle(patternIndex)} - layers{end};

		deltaStructure{length(layers)} = (configuration.activationFunctionDerivative(layers{end},configuration.beta) + configuration.pointOneOptimization)* error;
		#Calculo los deltas
		for hiddenLayerIndex = length(layers)-1:-1:2
			currentLayer = layers{hiddenLayerIndex};
			currentNeurons = currentLayer(2:length(currentLayer));
			gDerivativeVector = configuration.activationFunctionDerivative(currentNeurons,configuration.beta);
			weightsWithoutBiases = updatedWeights{hiddenLayerIndex}(2:rows(updatedWeights{hiddenLayerIndex}),:);
			deltaStructure{hiddenLayerIndex} = gDerivativeVector .* (deltaStructure{hiddenLayerIndex+1} * weightsWithoutBiases');
		endfor

		#Actualizo los pesos
		for weightIndex = 1 : length(updatedWeights)
			deltaW = configuration.etha * configuration.momentum * layers{weightIndex}' * deltaStructure{weightIndex + 1};
			updatedWeights{weightIndex} = updatedWeights{weightIndex} + deltaW;
		endfor

	endfor	
endfunction