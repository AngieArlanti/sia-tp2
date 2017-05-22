function runTestings()

	epochs = [];

	outputFileName = 'sinOptimizaciones1-1oculta';
	configurationFileName = 'configuration1';
	architecture='2,50,1';
	
	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture, eta='0.05',learningPatternsPercentage='0.80',activationFunction='exp', maxEpochs='8000', minCuadraticError='0.001', beta='0.5', alpha='0',dataSource='../resources/terrain.csv',pointOneOptimization='0');
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

	outputFileName = 'sinOptimizaciones2-1oculta';
	configurationFileName = 'configuration2';
	architecture='2,10,1';

	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture, eta='0.05',learningPatternsPercentage='0.80',activationFunction='exp', maxEpochs='8000', minCuadraticError='0.001', beta='0.5', alpha='0',dataSource='../resources/terrain.csv',pointOneOptimization='0');
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

	outputFileName = 'sinOptimizaciones3-1oculta';
	configurationFileName = 'configuration3';
	architecture='2,5,1';

	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture, eta='0.05',learningPatternsPercentage='0.80',activationFunction='exp', maxEpochs='8000', minCuadraticError='0.001', beta='0.5', alpha='0',dataSource='../resources/terrain.csv',pointOneOptimization='0');
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

endfunction