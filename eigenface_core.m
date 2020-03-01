function[m A eigenfaces pr_img] = eigenface_core(database_path)
  T = [];
  for i = 1 : 10
    image_path = strcat(database_path,'/',int2str(i),'.jpg');
    A = double(rgb2gray(imread(image_path)));
    T = [T,A(:)];
  endfor
  m = [];
  [mm n] = size(T);
  for i = 1:mm
    suma = 0;
    for j = 1:n
      suma += T(i,j);
    endfor
    
    m(i) = suma/n;
  endfor
  A = T - m';
  eigenfaces = [];
  [Vaux S] = eig(A'*A);
  [l c]  = size(S);
  V = [];
  for i = 1 : l
    if (S(i,i) > 1) 
      V = [V, Vaux(:,i)];
    endif
  endfor
  eigenfaces = A*V;
  pr_img = (eigenfaces')*A;
endfunction
  
  