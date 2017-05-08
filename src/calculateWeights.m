function weights = calculateWeights(layersFromArchive)

	weights = {};

	for i = 1:length(layersFromArchive)-1
		rows = layersFromArchive(i)+1;
		cols = layersFromArchive(i+1);
		#layer = rand(rows, cols);
		layer = ones(rows, cols);
		weights(i) = layer;
	endfor

endfunction
