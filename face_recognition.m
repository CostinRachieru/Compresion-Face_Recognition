function[min_dist output_img_index] = face_recognition(image_path,m,A,eigenfaces,pr_img)
  aux = double(rgb2gray(imread(image_path)));
  T = [];
  T = [T,aux(:)];
  T = T - m';
  pr_test_img = (eigenfaces') * T;
  min_dist = norm(pr_test_img - pr_img(:,1));
  output_img_index = 1;
  for i = 2 : 10
    min_dist_aux = norm(pr_test_img - pr_img(:,i));
    if (min_dist_aux < min_dist)
      min_dist = min_dist_aux;
      output_img_index = i;
    endif
  endfor
  
endfunction
