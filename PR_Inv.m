function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se va inlocui aceasta linie cu descrierea algoritmului de inversare 
  n = length(A);
  I = eye(n);
  [Q R] = Gram_Schmidt(A);
  b = Q'*I;
  # se rezolva n sisteme superior triunghiulare
  for i = 1:n
    B(:,i) = SST(R,b(:,i));
  endfor
endfunction 