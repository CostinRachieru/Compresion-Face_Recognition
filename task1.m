function A_k = task1(image, k)
  A = double(imread(image));
  [m n] = size(A);
  [U,S,V] = svd(A,'econ');
  U_k(1:m,1:k) = U(1:m,1:k);
  S_k(1:k,1:k) = S(1:k,1:k);
  V = V';
  V_k(1:k,1:n) = V(1:k,1:n);
  A_k = U_k * S_k * V_k;
endfunction
