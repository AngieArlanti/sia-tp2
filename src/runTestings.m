function runTestings()

	epochs = [];

	for i=1:2

		outputFileName = ['output' num2str(i)];
		configurationFileName = ['configuration' num2str(i)];
		architecture='2,35,10,1';
		configurationPath = generateConfigurationFile(outputFileName, configurationFileName, architecture);

		epochs = [epochs main(configurationPath, outputFileName)];

	endfor

endfunction