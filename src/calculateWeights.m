function weights = calculateWeights(layerDimensions,seeds)
	weights = {};
	for i = 1:length(layerDimensions)-1
		rows = layerDimensions(i)+1;
		cols = layerDimensions(i+1);
    	m = cols**-(1/2);
    	rand("seed",seeds(i));
		layer = 2*m*rand(rows, cols) - m;
		weights(i) = layer;
	endfor
endfunction
