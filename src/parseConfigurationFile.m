# Prevent Octave from thinking that this
# is a function file:
#1;
#Return a config object with all the data from the configuration file
function config = parseConfigurationFile()
	fid = fopen ('configuration.txt', 'r');
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
  		case 'maxEpochs'
  			config.maxEpochs = str2double(value);
  		case 'minCuadraticError'
  			config.minCuadraticError = str2double(value);
  		case 'architecture'
  			config.architecture = networkToArray(strsplit(value, ','));
  		case 'activationFunction'
        [config.activationFunction, config.activationFunctionDerivative]  = parseActivationFunction(value);
      case 'momentum'
        config.momentum = str2double(value);
      case 'dataSource'
        [config.learningDataInputs,config.learningDataExpectedOutputs,config.testingDataInputs,config.testingDataExpectedOutputs] = readFromFile(value);
  	endswitch
	endwhile
  fclose (fid);
  printf('\n');
endfunction


#Return derivative and activation function in a vector from a string in configuration file
function [activationFunction, activationFunctionDerivative] = parseActivationFunction(string)
  switch string
    case 'tanh'
      activationFunction = @tanDerivativeActivationFunction;
      activationFunctionDerivative = @tanActivationFunction;
    case 'exp'
      activationFunction = @expDerivativeActivationFunction;
      activationFunctionDerivative = @expActivationFunction;
  endswitch
endfunction

#Return network architecture in an array format
function array = networkToArray(networkString)
	for i = networkString
		array(end + 1)  = str2double(i{1});
	endfor
endfunction

#Return a matrix of inputs and expectedOutputs
function [learningInputs, learningExpectedOutputs, testingInputs, testingExpectedOutputs] = readFromFile(dataPath)
  data = csvread(dataPath);
  learningInputs = {};
  learningExpectedOutputs = {};
	testingInputs = {};
  testingExpectedOutputs = {};
  for index = 1:rows(data)
		if(mod(index,2) == 0)
    	learningInputs{length(learningInputs)+1} = data(index, 1:2);
    	learningExpectedOutputs{length(learningExpectedOutputs)+1} = data(index, 3);
		else
			testingInputs{length(testingInputs)+1} = data(index, 1:2);
    	testingExpectedOutputs{length(testingExpectedOutputs)+1} = data(index, 3);
		endif
  endfor
endfunction

#Activation functions and derivatives
#Derivative activation functions
function response = tanDerivativeActivationFunction(input)
  response = 1-tanh(3*input).^2;
endfunction

function response = expDerivativeActivationFunction(input)
  response = exp(input);
endfunction

#Activation functions
function response = tanActivationFunction(input)
  response = tanh(3*input);
endfunction
function response = expActivationFunction(input)
  response = exp(input);
endfunction
