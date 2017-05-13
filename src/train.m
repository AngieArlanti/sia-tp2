function [weights, obtainedOutputs] = train(inputs, weights, expectedOutputs,configuration)
  inputsWithBiases = addBiasesToInputs(inputs);  indexShuffle = randperm(length(inputs));  for i = 1:length(inputs)    network = feedforward(inputsWithBiases{indexShuffle(i)}, weights);    #network = feedforward(inputs{indexShuffle(i)}, weights);    obtainedOutputs{indexShuffle(i)} = network{end};    lastLayer = network{end};    layerCount = length(network) - 1;    hiddenLayersCount = layerCount - 1;    lastHiddenLayerIndex = length(network) - 1;    weightVariations = {};    weightVariationsIndex = length(weights);    V = [];    delta = [];    #OutputLayer delta calculation    error = expectedOutputs{indexShuffle(i)} - configuration.activationFunction(lastLayer);    delta =  error * configuration.activationFunctionDerivative(lastLayer);    V = configuration.activationFunction(network{lastHiddenLayerIndex});    weightVariation = V'*delta * configuration.etha;    #weights{hiddenLayersCount} += weightVariation;    #weights{hiddenLayersCount}    weightVariations{weightVariationsIndex} = weightVariation;    deltaHiddenLayer = delta;    #First network's index are inputs.    for j = lastHiddenLayerIndex:-1:3      currentLayer = network{j};      nextLayer = network{j-1};      derivative = configuration.activationFunctionDerivative(currentLayer(1:length(currentLayer)-1));      Wij = weights{weightVariationsIndex};      Wij = Wij(1:rows(Wij)-1, :);      deltaHiddenLayer = (deltaHiddenLayer * Wij') .* derivative;      V = configuration.activationFunction(nextLayer);      weightVariation = V'*deltaHiddenLayer * configuration.etha;      weightVariations{weightVariationsIndex-1} = weightVariation;      weightVariationsIndex --;    endfor    inputLayer = network{1};    firstLayer = network{2};    w = weights{weightVariationsIndex};    w = w(1:rows(w)-1, :);    derivative1 = configuration.activationFunctionDerivative(firstLayer(1:length(firstLayer)-1));    deltaHiddenLayer = (w * deltaHiddenLayer') .* derivative1';    deltaHiddenLayer    weightVariation = inputLayer'*deltaHiddenLayer' * configuration.etha;    #weights{1} += weightVariation;    weightVariations{weightVariationsIndex-1} = weightVariation;  endfor  for i = 1:length(weights)    weights{i} = weights{i} + weightVariations{i};  endforendfunction
