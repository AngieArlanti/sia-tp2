function [conf,upw] = adaptEtha(configuration,learningErrors,previousWeights, updatedWeights)
# Si b es distinto de 0, entonces esta prendido eta adaptativo
	conf = configuration;
	upw = updatedWeights;
		if (configuration.b != 0)
			deltaError = learningErrors(end) - learningErrors(end - 1);
			deltaEtha = 0;
			if deltaError > 0
				learningErrors = learningErrors(1:end - 1);
				deltaEtha = - configuration.eta * configuration.b;
				upw = previousWeights;
				conf.stepsGrowing = 0;
			else deltaError < 0
				conf.stepsGrowing++;
				if conf.stepsGrowing > configuration.k
					deltaEtha = configuration.a;
				endif				
			endif
			conf.eta += deltaEtha;
		endif

endfunction