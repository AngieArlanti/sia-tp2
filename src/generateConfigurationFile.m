function path = generateConfigurationFile(outputFileName, configurationFileName, architecture, eta='0.05',learningPatternsPercentage='0.90',activationFunction='exp', maxEpochs='5', minCuadraticError='0.001', beta='0.5', alpha='0.1',dataSource='../resources/terrain.csv')

	mkdir ('../', 'tests');
	mkdir ('../tests/', outputFileName);

	filePath = ['../tests/' outputFileName '/' configurationFileName '.txt'];

	fid = fopen (filePath, "w");

	fdisp (fid, ["architecture=" architecture]);
	fdisp (fid, ["eta=" eta]);
	fdisp (fid, ["learningPatternsPercentage=" learningPatternsPercentage]);
	fdisp (fid, ["activationFunction=" activationFunction]);
	fdisp (fid, ["maxEpochs=" maxEpochs]);
	fdisp (fid, ["minCuadraticError=" minCuadraticError]);
	fdisp (fid, ["beta=" beta]);
	fdisp (fid, ["alpha=" alpha]);
	fdisp (fid, ["dataSource=" dataSource]);

	fclose (fid);

	path = [configurationFileName '.txt'];

endfunction