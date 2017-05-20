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


endfunction