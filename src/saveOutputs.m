function saveOutputs(finalSeconds, learningErrors, obtainedOutputs,acceptedError,maxEpochs,architecture,etha,beta)

  epochs = length(learningErrors);
  cuadraticError = learningErrors(end);

  rmdir('../outputs', "s");
  mkdir ('../', 'outputs');
  save ../outputs/obtainedOutputs.csv obtainedOutputs -append;
  save ../outputs/outputs.csv acceptedError -append;
  save ../outputs/outputs.csv maxEpochs -append;
  save ../outputs/outputs.csv architecture -append;
  save ../outputs/outputs.csv etha -append;
  save ../outputs/outputs.csv beta -append;
  save ../outputs/outputs.csv finalSeconds -append;
  save ../outputs/outputs.csv epochs -append;
  save ../outputs/outputs.csv cuadraticError -append;

end
