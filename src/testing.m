function testing()

configuration = parseConfigurationFile();
updatedWeights = { [2.6750,2.5986;-2.9917,2.9301;2.9917,-2.9301], [-3.9736;4.5744;4.5806]};
testingPatterns = {[-1,-1],[-1,1],[1,-1],[1,1]};
expectedTestingOutputs={[-1],[1],[1],[-1]};

[cuadraticTestingError, obtainedTestingOutputs] = calculateCuadraticError(testingPatterns, updatedWeights, expectedTestingOutputs, configuration);
obtainedTestingOutputs
cuadraticTestingError
endfunction