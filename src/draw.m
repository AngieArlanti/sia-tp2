function draw(learningPatterns, expectedLearningOutputs, obtainedOutputs, f2)

for i = 1: length(learningPatterns)
  x(i) = learningPatterns{i}(:,1);
endfor

for i = 1: length(expectedLearningOutputs)
  y(i) = expectedLearningOutputs{i}(:,1);
endfor

for i = 1: length(expectedLearningOutputs)
  expectedZ(i) = expectedLearningOutputs{i}(:,1);
endfor

for i = 1: length(obtainedOutputs)
  obtainedZ(i) = obtainedOutputs{i}(:,1);
endfor

figure(f2);
plot3(x,y,expectedZ,'ro');
hold on;
plot3(x,y,obtainedZ,'b*');
endfunction
