function weights = calculateWeights(layersFromArchive)
	
	weights = ones(1,length(layersFromArchive)-1);

	for i = 1:length(weights)
		rows = layersFromArchive(i)+1;
		cols = layersFromArchive(i+1);
		layer = ones(rows, cols);
		weights(i) = layer;
	endfor
	
endfunction