function displayOutputs(outputFilePath, finalSeconds, testingErrors, configuration)

disp('-----------------------------------------------'),
disp(''),
disp('APRENDIÓ CON LAS SIGUIENTES MÉTRICAS:'),
disp('');
disp('Tiempo (min):'),
disp(finalSeconds/60);
disp('Epocas:'),
disp(length(testingErrors));
disp('Error Cuadrático Medio (Testeo):'),
disp(testingErrors(end));
disp('');
disp('VER RESULTADOS EN: '),
disp(outputFilePath),
disp(''),
disp('===============================================');
endfunction
