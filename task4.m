function [A_k S]=task4(image, k)
   A = double(imread(image));
  [m n] = size(A);
  for i = 1 : m 
    suma = 0;
    for j = 1 : n
      suma += A(i,j);
    endfor
    miu(i) = suma/n;
    for j = 1 : n
      A(i,j) -= miu(i);
    endfor
  endfor
  
  Z = (A*(A'))/(n-1);
  [V S] = eig(Z);
  W(1:m,m-k+1:m) = V(1:m,m-k+1:m);
  Y = W'*A;
  A_k = W*Y;
  for (i = 1:m)
    for (j = 1:n)
      A_k(i,j) += miu(i);
    endfor
  endfor
endfunction