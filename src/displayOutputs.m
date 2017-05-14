function displayOutputs(finalSeconds, learningErrors, configuration)

disp('Tiempo:'),
disp(finalSeconds);
disp('Epocas:'),
disp(length(learningErrors));
disp('Error Cuadrático Medio:'),
disp(learningErrors(end));

endfunction
