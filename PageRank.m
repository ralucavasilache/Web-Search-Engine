function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
  
  # construirea nume fisier de out
  outfile = strcat(nume, ".out");
  # deschidere fisiere de in si out
  fin= fopen(nume,"rt");
  fout = fopen(outfile,'wt');
  # PR1 = vector obtinut prin metoda Iterative
  PR1 = Iterative(nume, d, eps);
  n = length(PR1);
  # PR2 = vector obtinut prin metoda Algebraic
  [PR2 val1 val2] = Algebraic(nume, d);
  #printare date
  fprintf(fout, '%d\n', n);
  fprintf(fout,"\n");
  fprintf(fout,"%f\n", PR1.');
  fprintf(fout,"\n");
  fprintf(fout,"%f\n", PR2.');
  fprintf(fout,"\n");
  # sortare vector
  PR = sort(PR2, 'descend');
  # clasamentul paginilor importante
  for i=1:n
    # numarul paginii de pe locul i
    j = find(PR2 == PR(i));
    # gradul de apartenenta
    F = Apartenenta(PR(i), val1,val2);
    fprintf(fout,"%d %d %f\n", i, j, F);
  endfor
  # inchidere fisiere
  fclose(fout);
  fclose(fin);
  
endfunction
  