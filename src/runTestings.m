function runTestings()

	epochs = [];

	runLimit = 20;
	architectureComparisons = {};

	outputFileName = 'output1';
	configurationFileName = 'configuration1';
	architecture='2,35,10,1';
	seeds = calculateSeeds(architecture);
	
	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture);
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

	outputFileName = 'output2';
	configurationFileName = 'configuration2';
	architecture='2,10,35,1';

	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture);
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

	outputFileName = 'output3';
	configurationFileName = 'configuration3';
	architecture='2,20,5,1';

	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture);
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

	outputFileName = 'output4';
	configurationFileName = 'configuration4';
	architecture='2,4,4,1';

	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture);
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

	outputFileName = 'output5';
	configurationFileName = 'configuration5';
	architecture='2,8,3,1';

	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture);
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

	outputFileName = 'output6';
	configurationFileName = 'configuration6';
	architecture='2,10,10,10,1';
	seeds = calculateSeeds(architecture);
	
	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture);
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

	outputFileName = 'output7';
	configurationFileName = 'configuration7';
	architecture='2,30,30,30,1';
	seeds = calculateSeeds(architecture);
	
	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture);
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

	outputFileName = 'output8';
	configurationFileName = 'configuration8';
	architecture='2,10,30,30,1';
	
	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture);
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

	outputFileName = 'output9';
	configurationFileName = 'configuration9';
	architecture='2,30,10,30,1';
	
	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture);
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

	outputFileName = 'output10';
	configurationFileName = 'configuration10';
	architecture='2,30,30,10,1';
	
	configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture);
	epochs = [epochs main(configurationPath, outputFileName, seeds)];

endfunction