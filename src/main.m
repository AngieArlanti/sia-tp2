function main()

  #One epoch is one train.

  acceptedError = 10^-1;
  cuadraticError = 1;
  cuadraticTestingError = 1;
  learningPatterns = {[-1.8438,-0.9657],[  0,-1.6551]},[-2.3054,1.6704], [-0.5935,0]};
  learningPatterns
  expectedLearningOutputs={[0.0113],[0.2423]},[0.1211],[0.3320]};
  testingPatterns = {[-1.8438,1.6704],[-1.6423,1.2835],[3.1648,2.0107], [-0.2894,1.3745]};
  expectedTestingOutputs={[0.3054],[0.6634],[0.0000],[0.5346]};
  weights = calculateWeights([2,2,1]); #Le pasamos la arquitectura.
  #The epoch corresponds with index.
  learningErrors = [];
  testingErrors = [];
  etha = 0.5;

  while(!learned(cuadraticError,acceptedError))
    #Training
    [updatedWeights, obtainedOutputs] = train(learningPatterns, weights, expectedLearningOutputs, etha);
    cuadraticError = calculateCuadraticError(learningPatterns, updatedWeights, expectedLearningOutputs);
    learningErrors = [learningErrors,cuadraticError];
    #Testing
    cuadraticTestingError = calculateCuadraticError(testingPatterns, updatedWeights, expectedTestingOutputs);
    testingErrors = [testingErrors,cuadraticTestingError];

    #TODO check overfitting (Sobreentrenamiento).
    #Overfitting calculation
    #if(cuadraticError < cuadraticTestingError)
    #  overfitting++;
    #endif

    weights = updatedWeights;
  end

  #plot(1:1:length(learningErrors), learningErrors,1:1:length(learningErrors),testingErrors);
  draw(learningPatterns, expectedLearningOutputs, obtainedOutputs);

endfunction
