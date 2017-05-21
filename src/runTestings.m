function runTestings()

	epochs = [];

	#runLimit = 20;
	#architectures = ['2,35,10,1'; '2,10,35,1' ;'2,20,5,1' ;'2,4,4,1' ;'2,8,3,1'; '2,10,10,10,1' ;'2,30,30,30,1'; '2,10,30,30,1'; '2,30,30,10,1'];

	outputFileName = 'optimizaciones1';
	configurationFileName = 'configuration1';
	architecture='2,50,1';
	seeds = calculateSeeds(architecture);
	
	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture);
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

	outputFileName = 'optimizaciones2';
	configurationFileName = 'configuration2';
	architecture='2,10,1';

	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture);
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

	outputFileName = 'optimizaciones3';
	configurationFileName = 'configuration3';
	architecture='2,5,1';

	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture);
	epochs = [epochs main(configurationPath, outputFileName, seeds)];
	

	outputFileName = 'momentum1';
	configurationFileName = 'configuration1';
	architecture='2,50,1';
	
	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture, eta='0.05',learningPatternsPercentage='0.80',activationFunction='exp', maxEpochs='8000', minCuadraticError='0.001', beta='0.5', alpha='0.1',dataSource='../resources/terrain.csv',pointOneOptimization='0');
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

	outputFileName = 'momentum2';
	configurationFileName = 'configuration2';
	architecture='2,10,1';

	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture, eta='0.05',learningPatternsPercentage='0.80',activationFunction='exp', maxEpochs='8000', minCuadraticError='0.001', beta='0.5', alpha='0.1',dataSource='../resources/terrain.csv',pointOneOptimization='0');
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

	outputFileName = 'momentum3';
	configurationFileName = 'configuration3';
	architecture='2,5,1';

	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture, eta='0.05',learningPatternsPercentage='0.80',activationFunction='exp', maxEpochs='8000', minCuadraticError='0.001', beta='0.5', alpha='0.1',dataSource='../resources/terrain.csv',pointOneOptimization='0');
	epochs = [epochs main(configurationPath, outputFileName, seeds)];
	
	outputFileName = 'delta1';
	configurationFileName = 'configuration1';
	architecture='2,50,1';
	
	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture, eta='0.05',learningPatternsPercentage='0.80',activationFunction='exp', maxEpochs='8000', minCuadraticError='0.001', beta='0.5', alpha='0',dataSource='../resources/terrain.csv',pointOneOptimization='1');
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

	outputFileName = 'delta2';
	configurationFileName = 'configuration2';
	architecture='2,10,1';

	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture, eta='0.05',learningPatternsPercentage='0.80',activationFunction='exp', maxEpochs='8000', minCuadraticError='0.001', beta='0.5', alpha='0',dataSource='../resources/terrain.csv',pointOneOptimization='1');
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

	outputFileName = 'delta3';
	configurationFileName = 'configuration3';
	architecture='2,5,1';

	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture, eta='0.05',learningPatternsPercentage='0.80',activationFunction='exp', maxEpochs='8000', minCuadraticError='0.001', beta='0.5', alpha='0',dataSource='../resources/terrain.csv',pointOneOptimization='1');
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

	outputFileName = 'sinOptimizaciones1';
	configurationFileName = 'configuration1';
	architecture='2,50,1';
	
	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture, eta='0.05',learningPatternsPercentage='0.80',activationFunction='exp', maxEpochs='8000', minCuadraticError='0.001', beta='0.5', alpha='0',dataSource='../resources/terrain.csv',pointOneOptimization='0');
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

	outputFileName = 'sinOptimizaciones2';
	configurationFileName = 'configuration2';
	architecture='2,10,1';

	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture, eta='0.05',learningPatternsPercentage='0.80',activationFunction='exp', maxEpochs='8000', minCuadraticError='0.001', beta='0.5', alpha='0',dataSource='../resources/terrain.csv',pointOneOptimization='0');
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

	outputFileName = 'sinOptimizaciones3';
	configurationFileName = 'configuration3';
	architecture='2,5,1';

	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture, eta='0.05',learningPatternsPercentage='0.80',activationFunction='exp', maxEpochs='8000', minCuadraticError='0.001', beta='0.5', alpha='0',dataSource='../resources/terrain.csv',pointOneOptimization='0');
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

endfunction