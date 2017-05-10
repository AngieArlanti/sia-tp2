function response = learned(cuadraticError, acceptedError)
  if(cuadraticError > acceptedError)
    response = 0;
  else
    response = 1;
  endif
endfunction
