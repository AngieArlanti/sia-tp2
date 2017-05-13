function [weights, obtainedOutputs] = train(inputs, weights, expectedOutputs, etha=0.5)
  inputsWithBiases = addBiasesToInputs(inputs);  inputsWithBiases  indexShuffle = randperm(length(inputs));  for i = 1:length(inputs)    network = feedforward(inputsWithBiases{indexShuffle(i)}, weights);    #network = feedforward(inputs{indexShuffle(i)}, weights);    obtainedOutputs{indexShuffle(i)} = network{end};    lastLayer = network{end};    layerCount = length(network) - 1;    hiddenLayersCount = layerCount - 1;    lastHiddenLayerIndex = length(network) - 1;    weightVariations = {};    weightVariationsIndex = length(weights);    V = [];    delta = [];    #OutputLayer delta calculation    error = expectedOutputs{indexShuffle(i)} - activationFunction(lastLayer);    delta =  error * derivativeActivationFunction(lastLayer);    V = activationFunction(network{lastHiddenLayerIndex});    weightVariation = V'*delta * etha;    weightVariation    #weights{hiddenLayersCount} += weightVariation;    #weights{hiddenLayersCount}    weightVariations{weightVariationsIndex} = weightVariation;    deltaHiddenLayer = delta;    #First network's index are inputs.    for j = lastHiddenLayerIndex:-1:3      j      currentLayer = network{j};      nextLayer = network{j-1};      derivative = derivativeActivationFunction(currentLayer(1:length(currentLayer)-1));      Wij = weights{weightVariationsIndex};      Wij = Wij(1:rows(Wij)-1, :);      deltaHiddenLayer = (deltaHiddenLayer * Wij') .* derivative;      V = activationFunction(nextLayer);      derivative      Wij      deltaHiddenLayer      V      weightVariation = V'*deltaHiddenLayer * etha;      weightVariations{weightVariationsIndex-1} = weightVariation;      weightVariationsIndex --;    endfor    inputLayer = network{1};    firstLayer = network{2};    firstLayer    deltaHiddenLayer    w = weights{weightVariationsIndex};    w = w(1:rows(w)-1, :);    w    derivative1 = derivativeActivationFunction(firstLayer(1:length(firstLayer)-1));    derivative1    deltaHiddenLayer = (w * deltaHiddenLayer') .* derivative1';    deltaHiddenLayer    weightVariation = inputLayer'*deltaHiddenLayer' * etha;    #weights{1} += weightVariation;    weightVariations{weightVariationsIndex-1} = weightVariation;  endfor  for i = 1:length(weights)    weightVariations    weights{i} = weights{i} + weightVariations{i};  endforendfunction
