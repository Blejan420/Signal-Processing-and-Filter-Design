function [delta_pr, delta_sr] = faza_3(h, omega_p, omega_s)

[H, omega0] = freqz(h, 1, 5000);

K_p = find(omega0 <= omega_p);
K_s = find(omega0 >= omega_s);


delta_pr = max(abs(1-abs(H(K_p))));
delta_sr = max(abs(H(K_s)));


end