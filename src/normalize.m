function scaledValues = normalize(x, minValue, maxValue, minScale, maxScale)
    #para tanh: minValue:-1 y maxValue:1... exp 0 y 1
    normValues = (x-minValue)./(maxValue-minValue);
    scaledValues = normValues .* (maxScale - minScale) + minScale;
endfunction
