# Prevent Octave from thinking that this
# is a function file:

1;
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
  			config.eta = str2double(value);
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
      case 'learningDataPath'
        config.learningDataPath = readFromFile(value);
      case 'testingDataPath'
        config.testingDataPath = readFromFile(value);
  	endswitch
	endwhile
  fclose (fid);
  printf('\n');
endfunction
source('derivativeActivationFunction.m');
source('activationFunction.m');

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
function [inputs, expectedOutputs] = readFromFile(dataPath)
  data = csvread(dataPath);
  inputs = {};
  expected_outputs = {};
  for index = 1:rows(data)
    inputs{index} = data(index, 1:2);
    expectedOutputs{index} = data(index, 3);
  endfor
endfunction
