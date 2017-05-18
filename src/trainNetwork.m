function weights = trainNetwork(patterns, weights, expectedOutputs,configuration)
	
	patternsWithBiases = addBiasesToInputs(patterns);
	deltaStructure = {};
	indexShuffle = randperm(length(patterns));


	for patternIndex = 1 : length(patterns)
		layers = feedforward(patternsWithBiases{indexShuffle(patternIndex)},weights,configuration);		
		error = expectedOutputs{indexShuffle(patternIndex)} - layers{end};

		deltaStructure{length(layers)} = configuration.activationFunctionDerivative(layers{end},configuration.beta) * error;
		#Calculo los deltas
		for hiddenLayerIndex = length(layers)-1 : 2
			currentLayer = layers{hiddenLayerIndex};
			currentNeurons = currentLayer(2:length(currentLayer));
			gDerivativeVector = configuration.activationFunctionDerivative(currentNeurons,configuration.beta);
			weightsWithoutBiases = weights{hiddenLayerIndex}(2:rows(weights{hiddenLayerIndex}),:);
			deltaStructure{hiddenLayerIndex} = gDerivativeVector .* (deltaStructure{hiddenLayerIndex+1} * weightsWithoutBiases');
		endfor

		#Actualizo los pesos
		for weightIndex = 1 : length(weights)
			deltaW = configuration.etha * deltaStructure{weightIndex + 1}'*layers{weightIndex};
			weights{weightIndex} = weights{weightIndex} + deltaW';
		endfor

	endfor	
endfunction