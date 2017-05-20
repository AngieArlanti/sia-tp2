function seeds = calculateSeeds(layerDimensions)
	seeds = [];
	for i = 1:length(layerDimensions)-1
		s = rand("seed");
    	rand();
		seeds = [seeds s];
	endfor
endfunction
