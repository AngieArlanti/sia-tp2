function main()

  #One epoch is one train.

  configuration = parseConfigurationFile();
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

  while(!learned(cuadraticError,acceptedError)) #&& length(learningErrors)<maxEpochs)
    #Training
    updatedWeights = train(learningPatterns, weights, expectedLearningOutputs, configuration);
    [cuadraticError, obtainedOutputs] = calculateCuadraticError(learningPatterns, updatedWeights, expectedLearningOutputs, configuration);
    learningErrors = [learningErrors cuadraticError];

    #Testing
    [cuadraticTestingError, obtainedTestingOutputs] = calculateCuadraticError(testingPatterns, updatedWeights, expectedTestingOutputs, configuration);
    testingErrors = [testingErrors cuadraticTestingError];
    #TODO check overfitting (Sobreentrenamiento).
    #Overfitting calculation
    #if(cuadraticError < cuadraticTestingError)
    #  overfitting++;
    #endif
    #cla;
    #draw(learningPatterns, expectedLearningOutputs, obtainedOutputs);
    weights = updatedWeights;

    set(0,'CurrentFigure',f1)
    plot(learningErrors,'r');
    hold on;
    plot(testingErrors,'b');

  end

  finalSeconds = time() - initSeconds;

  displayOutputs(finalSeconds, learningErrors, configuration);
  saveOutputs(finalSeconds, learningErrors, obtainedOutputs,acceptedError,maxEpochs,architecture,etha,beta);

  #plot(learningErrors);
  draw(learningPatterns, expectedLearningOutputs, obtainedOutputs, f2);

endfunction
