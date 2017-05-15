# Prevent Octave from thinking that this
# is a function file:
#1;
#Return a config object with all the data from the configuration file
function config = parseConfigurationFile()
	fid = fopen ('configuration.txt', 'r');
	config.alpha = 0;
	while (!feof (fid))
  	line = fgetl (fid);
    disp(line);
    if length(line) == 0 || line(1) == '%'
      continue;
    endif

  	split = strsplit(line, '=');
  	key = split{1};
  	value = split{2};
  	switch key
  		case 'eta'
  			config.etha = str2double(value);
  		case 'beta'
        config.beta = str2double(value);
			case 'learningPatternsPercentage'
	      config.learningPatternsPercentage = str2double(value);
  		case 'maxEpochs'
  			config.maxEpochs = str2double(value);
  		case 'minCuadraticError'
  			config.minCuadraticError = str2double(value);
  		case 'architecture'
  			config.architecture = networkToArray(strsplit(value, ','));
  		case 'activationFunction'
        [config.activationFunction, config.activationFunctionDerivative]  = parseActivationFunction(value);
      case 'alpha'
        config.momentum = 1/(1-str2double(value));
      case 'dataSource'
        [config.learningDataInputs,config.learningDataExpectedOutputs,config.testingDataInputs,config.testingDataExpectedOutputs] = readFromFile(value,config.learningPatternsPercentage);
  	endswitch
	endwhile
  fclose (fid);
  printf('\n');
endfunction


#Return derivative and activation function in a vector from a string in configuration file
function [activationFunction, activationFunctionDerivative] = parseActivationFunction(string)
  switch string
    case 'tanh'
      activationFunction = @tanActivationFunction;
      activationFunctionDerivative = @tanDerivativeActivationFunction;
    case 'exp'
      activationFunction = @expActivationFunction;
      activationFunctionDerivative = @expDerivativeActivationFunction;
  endswitch
endfunction

#Return network architecture in an array format
function array = networkToArray(networkString)
	for i = networkString
		array(end + 1)  = str2double(i{1});
	endfor
endfunction

#Return a matrix of inputs and expectedOutputs
function [learningInputs, learningExpectedOutputs, testingInputs, testingExpectedOutputs] = readFromFile(dataPath,learningPercentage)
  data = csvread('../resources/terrain.csv');
	indexShuffle = randperm(length(data));
	learningElementsAmount = ceil(length(data)*learningPercentage);
	testingElementsAmount = length(data)-learningElementsAmount;
  learningInputs = {};
  learningExpectedOutputs = {};
	testingInputs = {};
  testingExpectedOutputs = {};

  for index = 1:learningElementsAmount
		learningInputs{length(learningInputs)+1} = data(indexShuffle(index), 1:2);
		learningExpectedOutputs{length(learningExpectedOutputs)+1} = data(indexShuffle(index), 3);
	endfor

	for index = learningElementsAmount:length(data)
		testingInputs{length(testingInputs)+1} = data(indexShuffle(index), 1:2);
		testingExpectedOutputs{length(testingExpectedOutputs)+1} = data(indexShuffle(index), 3);
	endfor
endfunction

#Activation functions and derivatives
#Derivative activation functions
function response = tanDerivativeActivationFunction(input,beta, outputLayer=0)
  response = 1-input.^2;
endfunction

function response = expDerivativeActivationFunction(input,beta,outputLayer=0)
	if(outputLayer)
		#Normalized with linear function between 0 and 1.
		response = (input^2) * ((input^(-1))-1);
	else
		response = input;
	endif
endfunction

#Activation functions
function response = tanActivationFunction(input,beta,outputLayer=0)
  response = tanh(beta*input);
endfunction
function response = expActivationFunction(input,beta,outputLayer=0)
	if(outputLayer)
		x = beta*input;
		#Normalized with linear function between 0 and 1.
		response = (1+exp((-1)*x))^(-1);
	else
		response = exp(beta*input);
	endif
endfunction
