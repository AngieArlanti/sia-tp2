function initDisplay(configurationFilePath)

	disp(''),
	disp('==============================================='),
	disp(''),
	disp(ctime(time())),
	disp('PRUEBA CON: '),
	disp(configurationFilePath),
	disp('');

	#Close all plots before starting.
	close all;
  	clf;

endfunction