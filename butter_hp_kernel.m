function k = butter_hp_kernel(I, Dh, n) 
    Height = size(I,1); 
    Width = size(I,2); 

    [u, v] = meshgrid( ...
                    -floor(Width/2) :floor(Width-1)/2, ...
                    -floor(Height/2): floor(Height-1)/2 ...
                 ); 

    k = butter_hp_f(u, v, Dh, n);

function f = butter_hp_f(u, v, Dh, n)
    uv = u.^2+v.^2;
    Duv = sqrt(uv);
    frac = Dh./Duv;
    %denom = frac.^(2*n);
    A=0.414; denom = A.*(frac.^(2*n));    
    f = 1./(1.+denom);