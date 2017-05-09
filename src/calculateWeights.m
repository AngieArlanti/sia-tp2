function weights = calculateWeights(layersFromFile)
	weights = {};

	for i = 1:length(layersFromFile)-1
		rows = layersFromFile(i)+1;
		cols = layersFromFile(i+1);
    m = cols**-(1/2);
		layer = 2*m*rand(rows, cols) - m;
		weights(i) = layer;
	endfor
endfunction
