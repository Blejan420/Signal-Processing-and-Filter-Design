function [omega_p , omega_s] = faza_5(h, Delta_p, Delta_s)

[H, omega0] = freqz(h, 1, 5000);

K_p = find(abs(abs(H)-1)>=Delta_p/100);
K_s = find(abs(H)>=Delta_s/100);

omega_p = omega0(K_p(1)-1);
if(K_s ~= 5000)
    omega_s = omega0(K_s(length(K_s))+1);
else
    omega_s = omega0(K_s(length(K_s)));
end


end
