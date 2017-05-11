function main()

for i = 1:10
  weights = train({[1, 1, -1], [1, 0, -1], [0, 1, -1], [0, 0, -1]}, calculateWeights([2,3,1]), {[1], [0], [0], [0]}, 0.03);
endfor

  calculate({[1, 1, -1], [1, 0, -1], [0, 1, -1], [0, 0, -1]}, weights);
