ITERATIVE:
  Se deschide fisierul dat ca parametru, se citeste n- nr de noduri ca integer,
randul nou de pe linia cu acesta, iar apoi, cele n linii. Se transforma liniile
din stringuri in vectori, iar apoi se retine al doilea numar, cel ce indica nr
de vecini. Se construieste matricea de adiacenta, tinand cont de legatura de la
nod la el insusi, ramanand 0 in matrice in acest caz. Parcurgerea vecinilor se
face cu un for.
  Dupa construirea matricei, se creeaza vectorul cu legaturi initial, unde
toate elementele au valoarea 1/n. In formula data aveam nevoie de inversa lui
K- matrice diagonala cu suma liniilor din matricea de adiacenta. Fiind o
matrice diagonala, elementele din inversa erau 1/elemente (se poate demonstra
matematic). Apoi se construieste R_last(R la momentul t+1) dupa formula data,
iar iteratiile se fac cat timp norma dintre cei 2 este mai mica decat eps,
rezultatul final fiind ultimul R-start (R la momentul t). Se inchide fisierul.

ALGEBRAIC:
  Citirea si construirea matricei sunt identice cu cea de la iterative. In 
varianta algebrica, relatia R = V + d*M*R, unde M este m(i,j) = a(i,j)(din
matricea de adiacenta)/ nr de legaturi exterioare ale lui i, iar V este vector
coloana cu n elemente cu valoarea (1-d)/n. Trecem pe R in stanga, dam factor
comun, rezultand(In - d*M)*R = V. Continuand, ajungem la R = (In-d*M)^-1 *V.
Fie DV = In - d*M. Se calculeaza inversa cu Gram- Schimdt modificat, dupa des-
compunerea in Q si R ramanand de calculat doar R^-1, intrucat Q^-1 = Q'.
R este o matrice superior triunghiulara. Folosesc un algoritm pt a calcula
inversa unui matrice inferior triunghiulara, care va rezulta tot o matrice
inferior triunghiulara, deci il transpun pe R inainte de algoritm, iar
rezultatul dupa utilizarea algoritmului, rezultand o matrice superior
triunghiulara, inversa lui R. In final, dupa ce ambele componente sunt
inversate, ramane de calculat doar R*Q*V si se inchide fisierul.

PAGERANK
  Se citeste n, cele n linii nu ne intereseaza, ci urmatoarele 2, val1 si val2,
ce sunt citite ca stringuri, iar ulterior transformate in numere. pentru a afla
a si b se rezolva sistemul simplu: val1*a+b = 0 si val2*a +b =1, de unde
rezulta a = 1/(val2-val1) si b = val1/(val1-val2). Se creeaza numele fisierului
de iesire prin concatenare, se apeleaza si se afiseaza rezultatul celor 2
functii scrise anterior. Apoi se sorteaza descrecator vectorul din varianta
algebrica prin metoda bulelor. Cu un for de la 1 la nr nodurilor, se afiseaza 
i ul, se cauta cu un while valoarea de pe pozitia i din vectorul sortat in
vectorul nesortat, se afiseaza pozitia in acesta, si valoarea functiei u(x),
unde x este valoarea cautata, tinand cont de cele 3 ramuri si de faptul ca
totul trebuie afisat cu 6 zecimale, inclusiv 1 sau 0. 