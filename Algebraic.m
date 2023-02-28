function R = Algebraic(nume, d, eps)
f = fopen(nume)
n = fscanf(f,'%f',1)
M = zeros(n)
nothing = fgetl(f)%endl -ul de pe linia lui n
for c = 1:n
  b = fgetl(f)%aceeasi constructie a matricei cu cea de la iterative
  trueb = str2num(b)
  count = trueb(2)
    for e = 1:count
     if trueb(2+e) != c 
        M(c,trueb(2+e))=1;
      endif
    endfor
  end

aux = sum(M,2) %suma pe linii
for c = 1:n %se formeaza matricea l, unde linia trebuia impartita la nr de
  M(c,:) = M(c,:) / aux(c) %legaturi exterioare ale nodului, adica
 endfor                     %suma pe linii
DV = eye(n) -d * M 
DV = DV'
V = (linspace((1-d)/n, (1-d)/n, n))'
R = zeros(n)
Q = zeros(n)
% este necesara inversa lui DV, care se calculeaa cu algoritmul Gram-
% Schimmdt modificat
for i =1:n  
  R(i,i) = norm(DV(:,i))
  Q(:,i) = DV(:,i) ./ R(i,i)
  for j = i+1 :n
   R(i,j) = Q(:,i)'*DV(:,j)
   DV(:,j) = DV(:,j)-Q(:,i) * R(i,j)
  end
 end
 Q = Q' %inversa lui Q e Q'
  %calcularea lui R^-1, R fiind o matrice superior triunghiulara
  R=R' %se va folosi un algoritm pt calcularea inversei unei matrice inferior
 % triunghiulare, asa ca se va transpune R de 2 ori 
  L = zeros(n); %matricea in care se calculeaza inversa
    for i=1:n
       L(i,i) = 1/R(i,i);
           for j=i+1:n
             L(j,i)=-R(j, i:j-1)*L(i:j-1,i)/R(j,j);
                end
           end
        
L =L' %revenirea la matrice superior triunghiulara
R = L*Q*V %algebric, aceasta este formula lui R, unde L si Q sunt
          %componentele inversate alea lui DV
fclose(f) 
 endfunction