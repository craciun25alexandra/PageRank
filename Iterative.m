function R = Iterative(nume, d, eps)
f = fopen(nume)
n = fscanf(f,'%f',1)
A = zeros(n)
nothing = fgetl(f) %endl -ul de pe linia lui n
for c = 1:n
  b = fgetl(f)%citeste prima linie
  trueb = str2num(b)%transforma din string in integer(array)
  count = trueb(2) %ia numarul de noduri cu care se invecineaza
    for e = 1:count
     if trueb(2+e) != c %daca nu e legatura de la un link la el insusi 
        A(c,trueb(2+e))=1; %se pune in matricea de adiacenta
      endif
    endfor
  end
R1_start = linspace(1/n, 1/n, n) %creeaza un vector linie de n elemente 
%si elemente de la 1/n la 1/n, adica un vector de n elemente cu val 1/n 
R1_start = transpose(R1_start) %se creeaza vector coloana
aux = sum(A, 2) %vector cu suma pe linii a matricei de adiacenta
K = diag(1 ./ aux) %matrice diagonala cu elemente 1/aux, deoarece se voia
%inversa lui K(cu elemente aux pe diag), iar 1/aux creeaza inversa  
M = (K*A)' %formulele din pagina de referinta
R1_last = d*M*R1_start + (1-d)/n*ones(n)
while (norm(R1_last(:,1) - R1_start(:,1))>eps)
 R1_start = R1_last
 R1_last = d*M*R1_start + (1-d)/n*ones(n)
endwhile  
R = R1_start(:,1) %se retine prima val 
fclose(f)
 endfunction