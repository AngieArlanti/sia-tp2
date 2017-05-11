function [inputs, expected_outputs] = readFile()
  data = csvread('../resources/terrain.csv');
  inputs = {};
  expected_outputs = {};
  for index = 1:rows(data)
    inputs{index} = data(index, 1:2);
    expected_outputs{index} = data(index, 3);
  endfor
endfunction