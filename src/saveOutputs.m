function saveOutputs(outputFilePath, finalSeconds, testingErrors, obtainedOutputs,acceptedError,maxEpochs,architecture,etha,beta, initialWeights, finalWeights);


  epochs = length(testingErrors);
  cuadraticError = testingErrors(end);

  mkdir ('../', 'outputs');

  fid = fopen (outputFilePath, "w");
  fdisp (fid, ctime(time()));
  fdisp (fid, "");
  fdisp (fid, "===============================================");
  fdisp (fid, "CONFIGURATION ");
  fdisp (fid, "");
  fdisp (fid, "Accepted Error ");
  fdisp (fid, acceptedError);
  fdisp (fid, "");
  fdisp (fid, "Max Epocs: ");
  fdisp (fid, maxEpochs);
  fdisp (fid, "");
  fdisp (fid, "Architecture: ");
  fdisp (fid, architecture);
  fdisp (fid, "");
  fdisp (fid, "Etha: ");
  fdisp (fid, etha);
  fdisp (fid, "");
  fdisp (fid, "Beta: ");
  fdisp (fid, beta);
  fdisp (fid, "");
  fdisp (fid, "===============================================");
  fdisp (fid, "OUTPUTS");
  fdisp (fid, "");
  fdisp (fid, "Time (min): ");
  fdisp (fid, finalSeconds/60);
  fdisp (fid, "");
  fdisp (fid, "Epochs: ");
  fdisp (fid, epochs);
  fdisp (fid, "");
  fdisp (fid, "Cuadratic Testing Error: ");
  fdisp (fid, cuadraticError);
  fdisp (fid, "");
  fdisp (fid, "Initial Weights: ");
  fdisp (fid, initialWeights);
  fdisp (fid, "");
  fdisp (fid, "Final Weights: ");
  fdisp (fid, finalWeights);
  
  fclose (fid);

end
