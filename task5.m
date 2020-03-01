function task5()
  image = './in/images/image1.gif';
  A = double(imread(image));
  [m n] = size(A);
  k = [];
  k = [1:19 20:20:99 100:30:min(m,n)];
  
  #figure 1
  [A_k, S] = task3(image, m);
  figure(1)
  plot(diag(S));
  
  #figure 2
  sums = [];
  for i = 1:length(k)
    suma = 0;
    suma_k = 0;
    for j = 1:k(i)
      suma_k += S(j,j);
      suma += S(j,j);
    endfor
    for j = k(i):min(m,n)
      suma+= S(j,j);
    endfor
    sums = [sums, (suma_k/suma)];
  endfor
  figure(2)
  plot(k,sums);
  
  #figure 3
  v_err = [];
  for q = 1 : length(k)
    err = 0;
    [A_k S] = task3(image, k(q));
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
    compresion_rates = [compresion_rates, ((2*k(i) + 1)/n)];
  endfor
  figure(4)
  plot(k,compresion_rates);
    
endfunction
  
  
  
  
  