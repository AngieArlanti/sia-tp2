function mainWithParams()
 
  
  
  configuration = parseConfigurationFile('configuration.txt');
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
  weights = calculateWeights(architecture, calculateSeeds(architecture)); #Le pasamos la arquitectura.
  
  #The epoch corresponds with index.
  learningErrors = [];
  testingErrors = [];
  etha = configuration.etha;
  initSeconds = time();
  #fpath = ['../tests/' outputFileName '/'];

  initialWeights = weights;

  f1 = figure(); hold on
  f2 = figure(); hold on
  f3 = figure(); hold on

  while(!learned(cuadraticError,acceptedError))# && length(learningErrors)<maxEpochs)
    #Training
    updatedWeights = trainNetwork(learningPatterns, weights, expectedLearningOutputs, configuration);
    [cuadraticError, obtainedOutputs] = calculateCuadraticError(learningPatterns, updatedWeights, expectedLearningOutputs, configuration);
    learningErrors = [learningErrors cuadraticError];
    
    #Testing
    [cuadraticTestingError, obtainedTestingOutputs] = calculateCuadraticError(testingPatterns, updatedWeights, expectedTestingOutputs, configuration);
    testingErrors = [testingErrors cuadraticTestingError];
    
    weights = updatedWeights;

    set(0,'CurrentFigure',f1)
    plot(learningErrors,'r');
    refresh;
    #if(mod(epoch,20) == 0)
      hold on;
      plot(testingErrors,'b');
      refresh;
    #endif
    xlabel ("Epocas");
    ylabel ("Error");
    title ("Error de Entrenamiento vs Error de Testeo");
  end
  
  

  set(0,'CurrentFigure',f1)
    plot(learningErrors,'r');
    refresh;
    #if(mod(epoch,20) == 0)
      hold on;
      plot(testingErrors,'b');
      refresh;
    #endif
    xlabel ("Epocas");
    ylabel ("Error");
    title ("Error de Entrenamiento vs Error de Testeo");
    #saveas(f1, fullfile(fpath, ['Errores - ' outputFileName]), 'png');
    #close all;
    #clf;

  finalWeights = updatedWeights;
  
  finalSeconds = time() - initSeconds;
  epochs = length(learningErrors);
  
  #filePath = saveOutputs(outputFileName, finalSeconds, testingErrors, obtainedOutputs,acceptedError,maxEpochs,architecture,etha,beta, initialWeights, finalWeights);
  ##TODO:::: APAGAR DESDE CONFIG EL DISPLAY por si se quiere mostrar únicamente las estadísticas de prueba.
  #displayOutputs(filePath,finalSeconds, testingErrors, configuration);

  draw(learningPatterns, expectedLearningOutputs, obtainedOutputs, f2, "Conjunto de Entrenamiento vs Esperados");

  #saveas(f2, fullfile(fpath, ['Entrenamiento - ' outputFileName]), 'png');
  draw(testingPatterns, expectedTestingOutputs, obtainedTestingOutputs, f3, "Conjunto de Testeo vs Esperados");
  #saveas(f3, fullfile(fpath, ['Generalizacion Testeo - ' outputFileName]), 'png');

  #close all;
   # clf;

endfunction