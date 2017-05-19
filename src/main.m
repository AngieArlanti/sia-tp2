function epochs = main(configurationFilePath, outputFilePath)
 disp(''),
 disp('==============================================='),
 disp(''),
 disp('ARCHIVO DE CONFIGURACION: '),
 disp(configurationFilePath),
 disp('');

  #Close all plots before starting.
  close all;
  clf;

  configuration = parseConfigurationFile(configurationFilePath);
  acceptedError = configuration.minCuadraticError;
  cuadraticError = 1;
  cuadraticTestingError = 1;
  maxEpochs = configuration.maxEpochs;
  
  learningPatterns = configuration.learningDataInputs;
  expectedLearningOutputs = configuration.learningDataExpectedOutputs;
  testingPatterns = configuration.testingDataInputs;
  expectedTestingOutputs = configuration.testingDataExpectedOutputs;
  architecture = configuration.architecture;
  beta = configuration.beta;
  weights = calculateWeights(architecture); #Le pasamos la arquitectura.
  
  #The epoch corresponds with index.
  learningErrors = [];
  testingErrors = [];
  etha = configuration.etha;
  initSeconds = time();

  f1 = figure(); hold on
  f2 = figure(); hold on
  f3 = figure(); hold on
  
  initialWeights = weights;

  epoch=0;
  while(!learned(cuadraticError,acceptedError) && length(learningErrors)<maxEpochs)
    #Training
    updatedWeights = trainNetwork(learningPatterns, weights, expectedLearningOutputs, configuration);
    [cuadraticError, obtainedOutputs] = calculateCuadraticError(learningPatterns, updatedWeights, expectedLearningOutputs, configuration);
    learningErrors = [learningErrors cuadraticError];
    
    #Testing
    [cuadraticTestingError, obtainedTestingOutputs] = calculateCuadraticError(testingPatterns, updatedWeights, expectedTestingOutputs, configuration);
    testingErrors = [testingErrors cuadraticTestingError];
    

    set(0,'CurrentFigure',f1)
    plot(learningErrors,'r');
    refresh;
    if(mod(epoch,20) == 0)
      hold on;
      plot(testingErrors,'b');
      refresh;
    endif

    epoch++;
    weights = updatedWeights;
  end

  finalWeights = updatedWeights;
  
  finalSeconds = time() - initSeconds;
  epochs = length(learningErrors);
  
  displayOutputs(outputFilePath,finalSeconds, testingErrors, configuration);
  saveOutputs(outputFilePath, finalSeconds, testingErrors, obtainedOutputs,acceptedError,maxEpochs,architecture,etha,beta, initialWeights, finalWeights);

  #plot(learningErrors);
  draw(learningPatterns, expectedLearningOutputs, obtainedOutputs, f2);
  draw(testingPatterns, expectedTestingOutputs, obtainedTestingOutputs, f3);
endfunction
