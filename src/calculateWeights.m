function weights = calculateWeights(layersFromArchive)

	weights = {};

	for i = 1:length(layersFromArchive)-1
		rows = layersFromArchive(i)+1;
		cols = layersFromArchive(i+1);
    m = cols**-(1/2)
		layer = 2*m*rand(rows, cols) - m;
		weights(i) = layer;
	endfor

endfunction
