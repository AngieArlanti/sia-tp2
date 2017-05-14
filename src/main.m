function main()

  #One epoch is one train.

  configuration = parseConfigurationFile();
  acceptedError = configuration.minCuadraticError;
  cuadraticError = 1;
  cuadraticTestingError = 1;
  maxEpochs = configuration.maxEpochs;
  #learningPatterns = {[-1.8438,-0.9657],[  0,-1.6551]}#,[-2.3054,1.6704], [-0.5935,0]};
  #expectedLearningOutputs={[0.0113],[0.2423]}#,[0.1211],[0.3320]};
  #testingPatterns = {[-1.8438,1.6704],[-1.6423,1.2835],[3.1648,2.0107], [-0.2894,1.3745]};
  #expectedTestingOutputs={[0.3054],[0.6634],[0.0000],[0.5346]};

  learningPatterns = configuration.learningDataInputs;
  expectedLearningOutputs = configuration.learningDataExpectedOutputs;
  testingPatterns = configuration.testingDataInputs;
  expectedTestingOutputs = configuration.testingDataExpectedOutputs;

  weights = calculateWeights(configuration.architecture); #Le pasamos la arquitectura.
  #The epoch corresponds with index.
  learningErrors = [];
  testingErrors = [];
  etha = configuration.etha;
  initSeconds = time();

  while(!learned(cuadraticError,acceptedError) || maxEpochs != length(learningErrors))
    #Training
    [updatedWeights, obtainedOutputs] = train(learningPatterns, weights, expectedLearningOutputs, configuration);
    cuadraticError = calculateCuadraticError(learningPatterns, updatedWeights, expectedLearningOutputs);

    learningErrors = [learningErrors cuadraticError];

    #Testing
    cuadraticTestingError = calculateCuadraticError(testingPatterns, updatedWeights, expectedTestingOutputs);
    testingErrors = [testingErrors cuadraticTestingError];
    #TODO check overfitting (Sobreentrenamiento).
    #Overfitting calculation
    #if(cuadraticError < cuadraticTestingError)
    #  overfitting++;
    #endif
    #cla;
    #draw(learningPatterns, expectedLearningOutputs, obtainedOutputs);
    weights = updatedWeights;
    plot(learningErrors);

  end
  finalSeconds = time() - initSeconds;
  disp('Tiempo:'),
  disp(finalSeconds);
  disp('Epocas:'),
  disp(length(learningErrors))
  disp(learningErrors(end))
  #plot(learningErrors);
  save obtainedOutputs.csv obtainedOutputs;
  save outputs.csv finalSeconds;
  draw(learningPatterns, expectedLearningOutputs, obtainedOutputs);


endfunction
