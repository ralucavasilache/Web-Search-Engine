function [R val1 val2] = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
	
  # citesc datele din fisier intr-o matrice
  data = dlmread(nume,' ',0,0);
  # numarul de resurse
  N = data(1,1);
  adj_matrix = zeros(N,N);
  # completarea matricei de adiacenta
  for i = 2:N+1
    nr = data(i,2);  
    for j = 3:2+nr
      if(data(i,j) != (i-1))
        adj_matrix(i-1, data(i,j)) = 1;
      endif
    endfor
  endfor 
  # citesc val1 si val2
  val1 = data(N+2, 1);
  val2 = data(N+3, 1);
  # completarea matricei M
  M = zeros(N,N);
  for i = 1:N
    for j = 1:N
      if(adj_matrix(j,i) != 0)
        M(i,j) = double(1/length(find(adj_matrix(j,:) == 1)));
      endif
    endfor
  endfor
 one = ones(N,1);
 #calcularea lui R
 R = PR_Inv(eye(N)-d*M)*((1-d)/N)*one;
endfunction