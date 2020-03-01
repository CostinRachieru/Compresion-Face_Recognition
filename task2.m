function task2()
  image = './in/images/image1.gif';
  A = double(imread(image));
  [m n] = size(A);
  [U,S,V] = svd(A,'econ');
  k = [];
  k = [1:19 20:20:99 100:30:min(m,n)];
  
  #figure 1 
  values = [];
  [l c] = size(S);
  for (i = 1:min(l,c))
    values = [values, S(i,i)];
  endfor
  figure(1)
  plot(values);
  
  #figure 2
  sums = [];
  for i = 1:length(k) 
    suma = 0;
    for j = 1:k(i)
      suma += S(j,j);
    endfor
    sums = [sums, suma];
  endfor
  suma = 0;
  for i = 1:min(m,n)
    suma += S(i,i);
  endfor
  sums /= suma;
  figure(2)
  plot(k,sums);
  
  #figure 3
  v_err = [];
  for q = 1 : length(k)
    err = 0;
    A_k = task1(image, k(q));
    T = ((A - A_k).^2);
    [l,c] = size(T);
    T /= (m*n);
    for i = 1 : l
      for j = 1 : c
        err += T(i,j);
      endfor
    endfor
    v_err = [v_err, err];
  endfor
  figure(3);
  plot(k,v_err);
  
  #figure 4
  compresion_rates = [];
  for i = 1:length(k)
    compresion_rates = [compresion_rates, ((m*k(i) + n*k(i) + k(i))/(m*n))];
  endfor
  figure(4);
  plot(k,compresion_rates);  
    
endfunction

  