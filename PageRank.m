function [R1 R2] = PageRank(nume, d, eps)
f = fopen(nume)
n = fscanf(f,'%f',1)
nothing = fgetl(f) %endl -ul de pe linia lui n
for c = 1:n
  b = fgetl(f) %citirea informatiilor pt matrice, irelevante in aceasta functie
end
val1 = fgetl(f)
val1 = str2num(val1) %transformarea din string in numar
val2 = fgetl(f)
val2 = str2num(val2)
a = 1/(val2-val1) %formula lui a pt a fi functia continua
b = val1/(val1-val2)
name2 = strcat(nume, '.out')
file = fopen(name2, 'w')
fprintf(file,'%d\n', n)
R1 = Iterative(nume, d ,eps);
fprintf(file,'%.6f\n', R1)
R2 = Algebraic(nume, d, eps);
fprintf(file, '\n')
fprintf(file, '%.6f\n', R2)
fprintf(file, '\n')
PR1 = R2
%sortarea lui R2 descrescator prin metoda bulelor
for i=1:n
    for j=i:n
        if PR1(i)<PR1(j)
            temp=PR1(i);
            PR1(i)=PR1(j);
            PR1(j)=temp;
        end
    end
end
for i = 1:n 
  fprintf(file, '%d ' , i)
  number = PR1(i) %tine minte valoarea elementului
  j = 1
  while( R2(j) != number)
    j++ %cauta pozitia in vectorul nesortat
  endwhile
  fprintf(file, '%d ' , j)
  if (number < val1) %ramurile functiei u(x)
    fprintf(file, '%.6f\n', 0) 
  elseif (number > val2)
    fprintf(file, '%.6f\n', 1)
  else 
    fprintf(file, '%.6f\n', a*number+b)
  endif
endfor
fclose(file)
endfunction