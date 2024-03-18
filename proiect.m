%% Faza 1
clc;
close all;

[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1(3,3);

%Subpunctul A

figure(1); 
subplot(2,2,1); 
w = triang(M);
stem(w, 'Color', [0 0 1]); title("Triunghiulara"); xlabel ("Timp"); ylabel("Amplitudine"); 
w = blackman(M); 
subplot(2,2,2);
stem(w, 'Color', [0 0 1]); title("Blackman"); xlabel ("Timp"); ylabel("Amplitudine"); 
subplot(2,2,3); 
w = hamming(M); 
stem(w, 'Color', [0 0 1]);  title("Hamming"); xlabel ("Timp"); ylabel("Amplitudine"); 
subplot(2,2,4); 
w = hanning(M); 
stem(w, 'Color', [0 0 1]); title("Hanning"); xlabel ("Timp"); ylabel("Amplitudine"); 

figure(2); 
subplot(2,3,2);
w=chebwin(M,r);
stem(w); title("Chebysev, r= " + r + " "); xlabel ("Timp"); ylabel("Amplitudine");
subplot(2,3,1);
w=chebwin(M,r-5); a = r-5;
stem(w); title("Chebysev, r= " + a + " "); xlabel ("Timp"); ylabel("Amplitudine");
subplot(2,3,3);
w=chebwin(M,r+5); a = r+5;
stem(w); title("Chebysev, r= " + a + " "); xlabel ("Timp"); ylabel("Amplitudine");
subplot(2,3,5);
w=kaiser(M,beta);
stem(w); title("Kaiser, beta= " + beta + " "); xlabel ("Timp"); ylabel("Amplitudine");
subplot(2,3,4);
w=kaiser(M,beta-1); a = beta-1;
stem(w); title("Kaiser, beta= " + a + " "); xlabel ("Timp"); ylabel("Amplitudine");
subplot(2,3,6);
w=kaiser(M,beta+1); a = beta+1;
stem(w); title("Kaiser, beta= " + a + " "); xlabel ("Timp"); ylabel("Amplitudine");

n = 0 : 1 : M-1;
figure(3); 
subplot(2,3,2);
w = (sin(2*pi*(2*n-M+1)/(2*(M-1)))./(2*pi*(2*n-M+1)/(2*(M-1)))).^L;   
stem(w); title("Lanczos, L= " + L + " "); xlabel ("Timp"); ylabel("Amplitudine");
subplot(2,3,1);
w = (sin(2*pi*(2*n-M+1)/(2*(M-1)))./(2*pi*(2*n-M+1)/(2*(M-1)))).^(L-1); a = L-1;  
stem(w); title("Lanczos, L= " + a + " "); xlabel ("Timp"); ylabel("Amplitudine");
subplot(2,3,3);
w = (sin(2*pi*(2*n-M+1)/(2*(M-1)))./(2*pi*(2*n-M+1)/(2*(M-1)))).^(L+1); a = L+1; 
stem(w); title("Lanczos, L= " + a + " "); xlabel ("Timp"); ylabel("Amplitudine");
subplot(2,3,5);
w = tukeywin(M,alfa) ;
stem(w); title("Tuckey, alfa= " + alfa + " "); xlabel ("Timp"); ylabel("Amplitudine");
subplot(2,3,4);
w = tukeywin(M,alfa-15) ; a = alfa - 15;
stem(w); title("Tuckey, alfa= " + a + " "); xlabel ("Timp"); ylabel("Amplitudine");
subplot(2,3,6);
w = tukeywin(M,alfa+15) ; a = alfa +15;
stem(w); title("Tuckey, alfa= " + a + " "); xlabel ("Timp"); ylabel("Amplitudine");
%% Subpunctul B
clc;
close all;

w = boxcar(M);
w = w/sum(w); %normare
[W, omega] = freqz(w, 1, 5000);
figure(4);
omega = omega./(2*pi);
plot(omega, 20*log10(abs(W))); title("Raspuns in frecventa - Fereastra dreptunghiulara"); xlabel ("Frecventa normalizata"); ylabel("Magnitudine (dB)");

figure(5);
subplot(2,2,1); 
w = triang(M);
w = w/sum(w); %normare
[W, omega] = freqz(w, 1, 5000);
omega = omega./(2*pi);
plot(omega, 20*log10(abs(W))); title("Fereastra triunghiulara"); xlabel ("Frecventa normalizata"); ylabel("Magnitudine (dB)");
w = blackman(M);
w = w/sum(w); %normare
[W, omega] = freqz(w, 1, 5000);
subplot(2,2,2);
omega = omega./(2*pi);
plot(omega, 20*log10(abs(W))); title("Fereastra Blackman"); xlabel ("Frecventa normalizata"); ylabel("Magnitudine (dB)");
subplot(2,2,3); 
w = hamming(M);
w = w/sum(w); %normare
[W, omega] = freqz(w, 1, 5000);
omega = omega./(2*pi);
plot(omega, 20*log10(abs(W))); title("Fereastra Hamming"); xlabel ("Frecventa normalizata"); ylabel("Magnitudine (dB)");
subplot(2,2,4); 
w = hanning(M); 
w = w/sum(w); %normare
[W, omega] = freqz(w, 1, 5000);
omega = omega./(2*pi);
plot(omega, 20*log10(abs(W))); title("Fereastra Hanning"); xlabel ("Frecventa normalizata"); ylabel("Magnitudine (dB)");

figure(6);
subplot(2,3,1); 
w=chebwin(M,r-5);
w = w/sum(w); %normare
[W, omega] = freqz(w, 1, 5000);
omega = omega./(2*pi);
plot(omega, 20*log10(abs(W))); title("Chebysev, r = " + (r-5) + " "); xlabel ("Frecventa normalizata"); ylabel("Magnitudine (dB)");

w=chebwin(M,r);
w = w/sum(w); %normare
[W, omega] = freqz(w, 1, 5000);
subplot(2,3,2);
omega = omega./(2*pi);
plot(omega, 20*log10(abs(W))); title("Chebysev, r = " + r + " "); xlabel ("Frecventa normalizata"); ylabel("Magnitudine (dB)");

subplot(2,3,3); 
w=chebwin(M,r+5);
w = w/sum(w); %normare
[W, omega] = freqz(w, 1, 5000);
omega = omega./(2*pi);
plot(omega, 20*log10(abs(W))); title("Chebysev, r = " + (r+5) + " "); xlabel ("Frecventa normalizata"); ylabel("Magnitudine (dB)");

subplot(2,3,4); 
w=kaiser(M,beta-1); 
w = w/sum(w); %normare
[W, omega] = freqz(w, 1, 5000);
omega = omega./(2*pi);
plot(omega, 20*log10(abs(W))); title("Kaiser, beta = " +(beta-1)+ " "); xlabel ("Frecventa normalizata"); ylabel("Magnitudine (dB)");

subplot(2,3,5); 
w=kaiser(M,beta);
w = w/sum(w); %normare
[W, omega] = freqz(w, 1, 5000);
omega = omega./(2*pi);
plot(omega, 20*log10(abs(W))); title("Kaiser, beta = " +beta+ " "); xlabel ("Frecventa normalizata"); ylabel("Magnitudine (dB)");

subplot(2,3,6); 
w=kaiser(M,beta+1);
w = w/sum(w); %normare
[W, omega] = freqz(w, 1, 5000);
omega = omega./(2*pi);
plot(omega, 20*log10(abs(W))); title("Kaiser, beta = " +(beta+1)+ " "); xlabel ("Frecventa normalizata"); ylabel("Magnitudine (dB)");

figure(7);
subplot(2,3,1); 
w = (sin(2*pi*(2*n-M+1)/(2*(M-1)))./(2*pi*(2*n-M+1)/(2*(M-1)))).^(L-1); %formula de definitie
w = w/sum(w); %normare
[W, omega] = freqz(w, 1, 5000);
omega = omega./(2*pi);
plot(omega, 20*log10(abs(W))); title("Lanczos, L = " + (L-1) + " "); xlabel ("Frecventa normalizata"); ylabel("Magnitudine (dB)");

w = (sin(2*pi*(2*n-M+1)/(2*(M-1)))./(2*pi*(2*n-M+1)/(2*(M-1)))).^L; %formula de definitie
w = w/sum(w); %normare
[W, omega] = freqz(w, 1, 5000);
subplot(2,3,2);
omega = omega./(2*pi);
plot(omega, 20*log10(abs(W))); title("Lanczos, L = " + L + " "); xlabel ("Frecventa normalizata"); ylabel("Magnitudine (dB)");

subplot(2,3,3); 
w = (sin(2*pi*(2*n-M+1)/(2*(M-1)))./(2*pi*(2*n-M+1)/(2*(M-1)))).^(L+1); %formula de definitie
w = w/sum(w); %normare
[W, omega] = freqz(w, 1, 5000);
omega = omega./(2*pi);
plot(omega, 20*log10(abs(W))); title("Lanczos, L = " + (L+1) + " "); xlabel ("Frecventa normalizata"); ylabel("Magnitudine (dB)");

subplot(2,3,4); 
w = tukeywin(M,alfa-15) ;
w = w/sum(w); %normare
[W, omega] = freqz(w, 1, 5000);
omega = omega./(2*pi);
plot(omega, 20*log10(abs(W))); title("Tuckey, alfa =" +(alfa-15)+ " "); xlabel ("Frecventa normalizata"); ylabel("Magnitudine (dB)");

subplot(2,3,5); 
w = tukeywin(M,alfa) ;
w = w/sum(w); %normare
[W, omega] = freqz(w, 1, 5000);
omega = omega./(2*pi);
plot(omega, 20*log10(abs(W))); title("Tuckey, alfa =" +alfa+ " "); xlabel ("Frecventa normalizata"); ylabel("Magnitudine (dB)");

subplot(2,3,6); 
w = tukeywin(M,alfa+15) ;
w = w/sum(w); %normare
[W, omega] = freqz(w, 1, 5000);
omega = omega./(2*pi);
plot(omega, 20*log10(abs(W))); title("Tuckey, alfa =" +(alfa+15)+ " "); xlabel ("Frecventa normalizata"); ylabel("Magnitudine (dB)");

%Subpunctul C

% DREPTUNGHIULARA - lat. lob prin. : 0.028  
% dif. lob prin. - sec. : -13.4 dB
% TRIUNGHIULARA - lat. lob prin. : 0.056   
% dif lob prin. - sec. : -26.4 dB

% In ceea ce priveste ferestrele dreptunghiulara si triunghiulara, ambele sunt slabe, avand diferente de amplitudine 
% dintre lobul principal si primul lob secundar mici, latimi ale lobului principal mari si atenuari slabe ale tuturor lobilor secundari. 
% Lobul principal se distinge mai usor in cazul ferestrei triunghiulare, avand o diferenta de amplitune mai mare intre lobul principal si cel secundar.

% BLACKMAN - lat. lob prin. : 0.087 
% dif. lob prin. - sec. : -57.7 dB
% HAMMING - lat. lob prin. : 0.06   
% dif. lob prin. - sec. : -50.24 dB
% HANNING - lat. lob prin. : 0.054  
% dif. lob prin. - sec. : -33.43 dB

% Fereastra Blackman, raportat la diferenta de amplitudine dintre lp si ls, este cea mai buna, 
% comparativ cu celelalte ferestre discutate pana acum, insa detine si cel mai lat lob principal. 
% Fereastra Hamming succede fereastra blackman in ceea ce priveste atenuarile ls, dar, datorita unei mai mici latimi a lobului principal, 
% aceasta este superioara ferestrei blackman, iar fereastra Hanning este undeva la mijloc.

% CHEBYSHEV - lat. lob prin. : 0.095
% dif. lob prin. - sec. : -86.5 dB
% Pentru un r mai mare, avem o atenuare mai puternica a ls(r =85 : y = -86 / r=90 : y= -91 / r=95 : y=-97), dar si o latime a lb mai mare
% KAISER - lat. lob prin. : 0.055	   
% dif. lob prin. - sec. : -39.66 dB
% Pentru un beta mai mare, avem o atenuare si mai puternica a ls ca in cazul Chebysev (beta = 5 : y = -39 / beta = 6 : y= -45 / beta = 7 : y= -54)

% Fereastra Chebyshev are o atenuare a lobilor secundari semnificativ mai mare decat restul ferestrelor, 
% insa este mult mai slaba in ceea ce priveste latimea lp (caracteristicile ei se inclina pe atenuarea ls). 
% Fereastra Kaiser pune in balans diferenta lb-ls si ingustimea benzii lb, asemanator cu fereastra Hamming 
%(fereastra Hamming inca fiind cea mai buna fereastra pentru variabilele date).

% LANCZOS - lat. lob prin. : 0.062
% dif. lob prin. - sec : -28.7 dB
% Pentru un L mai mare, avem o latime a lp exponential mai mare (L = 1 : x = 0.62 / L = 2 : x = 0.75 / L = 3 : x = 0.97) si o atenuare mai mare a ls, 
% insa, cu cat L devine mai mare, cu atat acest compromis este mai prost.
% TUCKEY- lat. lob prin. : 0.055	   
% dif. lob prin. - sec : -33.61 dB
% Pentru variatii ale lui alfa, graficul raspunsului in frecventa nu se modifica, insa pentru un alfa negativ, aceasta fereastra isi pierde proprietatile, 
% semanand mai mult cu fereastra dreptunghiulara.

% Fereastra Lanczos, respectiv Tuckey, au caracteristici mediocre raportate la topul ferestrelor: 
% o latime a lb relativ mica, care insa nu justifica o atenuare a ls foarte slaba.

%% Faza 2

%Subpunctul A
clc;
close all;

[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1(3,3);
omega_c = PS_PRJ_1_Faza_2a(3,3) ; 

freq_c = omega_c./(2*pi);

figure(8);
subplot(1,5,1);
w=boxcar(M) ; 
h = fir1(M-1,freq_c,w) ;
stem(h); title("Dreptunghiulara"); xlabel("Timp"); ylabel("Amplitudine");
subplot(1,5,2);
w=triang(M) ; 
h = fir1(M-1,freq_c,w) ;
stem(h); title("Triunghiulara"); xlabel("Timp"); ylabel("Amplitudine");
subplot(1,5,3);
w=blackman(M) ; 
h = fir1(M-1,freq_c,w) ;
stem(h); title("Blackman"); xlabel("Timp"); ylabel("Amplitudine");
subplot(1,5,4);
w=hamming(M) ;
h = fir1(M-1,freq_c,w) ;
stem(h); title("Hamming"); xlabel("Timp"); ylabel("Amplitudine");
subplot(1,5,5);
w=hanning(M) ; 
h = fir1(M-1,freq_c,w) ;
stem(h); title("Hanning"); xlabel("Timp"); ylabel("Amplitudine");

figure(9);
subplot(2,3,2);
w=chebwin(M,r);
h = fir1(M-1,freq_c,w) ;
stem(h); title("Chebysev, r= " + r + " "); xlabel ("Timp"); ylabel("Amplitudine");
subplot(2,3,1);
w=chebwin(M,r-5); a = r-5;
h = fir1(M-1,freq_c,w) ;
stem(h); title("Chebysev, r= " + a + " "); xlabel ("Timp"); ylabel("Amplitudine");
subplot(2,3,3);
w=chebwin(M,r+5); a = r+5;
h = fir1(M-1,freq_c,w) ;
stem(h); title("Chebysev, r= " + a + " "); xlabel ("Timp"); ylabel("Amplitudine");
subplot(2,3,5);
w=kaiser(M,beta);
h = fir1(M-1,freq_c,w) ;
stem(h); title("Kaiser, beta= " + beta + " "); xlabel ("Timp"); ylabel("Amplitudine");
subplot(2,3,4);
w=kaiser(M,beta-1); a = beta-1;
h = fir1(M-1,freq_c,w) ;
stem(h); title("Kaiser, beta= " + a + " "); xlabel ("Timp"); ylabel("Amplitudine");
subplot(2,3,6);
w=kaiser(M,beta+1); a = beta+1;
h = fir1(M-1,freq_c,w) ;
stem(h); title("Kaiser, beta= " + a + " "); xlabel ("Timp"); ylabel("Amplitudine");

figure(10);
n = 0:M-1;
subplot(2,3,2);
w = (sin(2*pi*(2*n-M+1)/(2*(M-1)))./(2*pi*(2*n-M+1)/(2*(M-1)))).^L;   
h = fir1(M-1,freq_c,w) ;
stem(h); title("Lanczos, L= " + L + " "); xlabel ("Timp"); ylabel("Amplitudine");
subplot(2,3,1);
w = (sin(2*pi*(2*n-M+1)/(2*(M-1)))./(2*pi*(2*n-M+1)/(2*(M-1)))).^(L-1); a = L-1;
h = fir1(M-1,freq_c,w) ;
stem(h); title("Lanczos, L= " + a + " "); xlabel ("Timp"); ylabel("Amplitudine");
subplot(2,3,3);
w = (sin(2*pi*(2*n-M+1)/(2*(M-1)))./(2*pi*(2*n-M+1)/(2*(M-1)))).^(L+1); a = L+1;
h = fir1(M-1,freq_c,w) ;
stem(h); title("Lanczos, L= " + a + " "); xlabel ("Timp"); ylabel("Amplitudine");
subplot(2,3,5);
w = tukeywin(M,alfa) ;
h = fir1(M-1,freq_c,w) ;
stem(h); title("Tuckey, alfa= " + alfa + " "); xlabel ("Timp"); ylabel("Amplitudine");
subplot(2,3,4);
w = tukeywin(M,alfa-15) ; a = alfa - 15;
h = fir1(M-1,freq_c,w) ;
stem(h); title("Tuckey, alfa= " + a + " "); xlabel ("Timp"); ylabel("Amplitudine");
subplot(2,3,6);
w = tukeywin(M,alfa+15) ; a = alfa +15;
h = fir1(M-1,freq_c,w) ;
stem(h); title("Tuckey, alfa= " + a + " "); xlabel ("Timp"); ylabel("Amplitudine");

figure(11);
subplot(2,5,1);
w=boxcar(M);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi);
plot(omega0, 20*log10(abs(H))); title("Drept. - Ampl."); ylabel("Magnitudine(dB)");xlabel("Frecv. norm.");
subplot(2,5,6);
plot(omega0, (180/pi)*angle(H)); title("Drept. - Faza") ; ylabel("Faza(grade)"); xlabel("Frecv. norm.");
subplot(2,5,2);
w=triang(M);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi);
plot(omega0, 20*log10(abs(H))); title("Triung. - Ampl."); ylabel("Magnitudine(dB)");xlabel("Frecv. norm.");
subplot(2,5,7);
plot(omega0, (180/pi)*angle(H)); title("Triung. - Faza") ; ylabel("Faza(grade)"); xlabel("Frecv. norm.");
subplot(2,5,3);
w=blackman(M);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi);
plot(omega0, 20*log10(abs(H))); title("Blckm. - Ampl."); ylabel("Magnitudine(dB)");xlabel("Frecv. norm.");
subplot(2,5,8);
plot(omega0, (180/pi)*angle(H)); title("Blckm. - Faza") ; ylabel("Faza(grade)"); xlabel("Frecv. norm.");
subplot(2,5,4);
w=hamming(M);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi);
plot(omega0, 20*log10(abs(H))); title("Hamm. - Ampl."); ylabel("Magnitudine(dB)");xlabel("Frecv. norm.");
subplot(2,5,9);
plot(omega0, (180/pi)*angle(H)); title("Hamm. - Faza") ; ylabel("Faza(grade)"); xlabel("Frecv. norm.");
subplot(2,5,5);
w=hanning(M);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi);
plot(omega0, 20*log10(abs(H))); title("Hann. - Ampl."); ylabel("Magnitudine(dB)");xlabel("Frecv. norm.");
subplot(2,5,10);
plot(omega0, (180/pi)*angle(H)); title("Hann. - Faza") ; ylabel("Faza(grade)"); xlabel("Frecv. norm.");

figure(12);
subplot(3,4,1);
w=chebwin(M,r-5);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi); a = round(r-5);
plot(omega0, 20*log10(abs(H))); title("Cheb., r = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Magnitudine (dB)");
w=chebwin(M,r);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
subplot(3,4,5);
omega0 = omega0./(2*pi); a = round(r);
plot(omega0, 20*log10(abs(H))); title("Cheb., r = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Magnitudine (dB)");
subplot(3,4,9); 
w=chebwin(M,r+5);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi); a = round(r+5);
plot(omega0, 20*log10(abs(H))); title("Cheb., r = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Magnitudine (dB)");
subplot(3,4,2);
w=chebwin(M,r-5);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi);  a = round(r-5);
plot(omega0, (180/pi)*angle(H)); title("Cheb., r = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Faza (grade)");
w=chebwin(M,r);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
subplot(3,4,6);
omega0 = omega0./(2*pi);  a = round(r);
plot(omega0, (180/pi)*angle(H)); title("Cheb., r = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Faza (grade)");
subplot(3,4,10); 
w=chebwin(M,r+5);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi);  a = round(r+5);
plot(omega0, (180/pi)*angle(H)); title("Cheb., r = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Faza (grade)");

subplot(3,4,3);
w=kaiser(M,beta-1);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi); a = round(beta-1);
plot(omega0, 20*log10(abs(H))); title("Kaiser, beta = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Magnitudine (dB)");
w=kaiser(M,beta);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
subplot(3,4,7);
omega0 = omega0./(2*pi); a = round(beta);
plot(omega0, 20*log10(abs(H))); title("Kaiser, beta = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Magnitudine (dB)");
subplot(3,4,11); 
w=kaiser(M,beta+1);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi); a = round(beta+1);
plot(omega0, 20*log10(abs(H))); title("Kaiser, beta = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Magnitudine (dB)");
subplot(3,4,4);
w=kaiser(M,beta-1);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi);  a = round(beta-1);
plot(omega0, (180/pi)*angle(H)); title("Kaiser, beta = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Faza (grade)");
w=kaiser(M,beta);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
subplot(3,4,8);
omega0 = omega0./(2*pi);  a = round(beta);
plot(omega0, (180/pi)*angle(H)); title("Kaiser, beta = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Faza (grade)");
subplot(3,4,12); 
w=kaiser(M,beta+1);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi);  a = round(beta+1);
plot(omega0, (180/pi)*angle(H)); title("Kaiser, beta = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Faza (grade)");

figure(13);
subplot(3,4,3);
w=tukeywin(M,alfa-15);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi); a = round(alfa-15);
plot(omega0, 20*log10(abs(H))); title("Tuckey, alfa = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Magnitudine (dB)");
w=tukeywin(M,alfa);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
subplot(3,4,7);
omega0 = omega0./(2*pi); a = round(alfa);
plot(omega0, 20*log10(abs(H))); title("Tuckey, alfa = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Magnitudine (dB)");
subplot(3,4,11); 
w=tukeywin(M,alfa+15);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi); a = round(alfa+15);
plot(omega0, 20*log10(abs(H))); title("Tuckey, alfa = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Magnitudine (dB)");
subplot(3,4,4);
w=tukeywin(M,alfa-15);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi);  a = round(alfa-15);
plot(omega0, (180/pi)*angle(H)); title("Tuckey, alfa = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Faza (grade)");
w=tukeywin(M,alfa);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
subplot(3,4,8);
omega0 = omega0./(2*pi);  a = round(alfa);
plot(omega0, (180/pi)*angle(H)); title("Tuckey, alfa = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Faza (grade)");
subplot(3,4,12); 
w=tukeywin(M,alfa+15);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi);  a = round(alfa+15);
plot(omega0, (180/pi)*angle(H)); title("Tuckey, alfa = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Faza (grade)");

subplot(3,4,1);
w = (sin(2*pi*(2*n-M+1)/(2*(M-1)))./(2*pi*(2*n-M+1)/(2*(M-1)))).^(L-1);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi); a = round(L-1);
plot(omega0, 20*log10(abs(H))); title("Lanczos, L = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Magnitudine (dB)");
w = (sin(2*pi*(2*n-M+1)/(2*(M-1)))./(2*pi*(2*n-M+1)/(2*(M-1)))).^L;
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
subplot(3,4,5);
omega0 = omega0./(2*pi); a = round(L);
plot(omega0, 20*log10(abs(H))); title("Lanczos, L = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Magnitudine (dB)");
subplot(3,4,9); 
w = (sin(2*pi*(2*n-M+1)/(2*(M-1)))./(2*pi*(2*n-M+1)/(2*(M-1)))).^(L+1);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi); a = round(L+1);
plot(omega0, 20*log10(abs(H))); title("Lanczos, L = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Magnitudine (dB)");
subplot(3,4,2);
w = (sin(2*pi*(2*n-M+1)/(2*(M-1)))./(2*pi*(2*n-M+1)/(2*(M-1)))).^(L-1);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi);  a = round(L-1);
plot(omega0, (180/pi)*angle(H)); title("Lanczos, L = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Faza (grade)");
w = (sin(2*pi*(2*n-M+1)/(2*(M-1)))./(2*pi*(2*n-M+1)/(2*(M-1)))).^L;
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
subplot(3,4,6);
omega0 = omega0./(2*pi);  a = round(L);
plot(omega0, (180/pi)*angle(H)); title("Lanczos, L = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Faza (grade)");
subplot(3,4,10); 
w = (sin(2*pi*(2*n-M+1)/(2*(M-1)))./(2*pi*(2*n-M+1)/(2*(M-1)))).^(L+1);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi);  a = round(L+1);
plot(omega0, (180/pi)*angle(H)); title("Lanczos, L = " + a + " "); xlabel ("Frecv. normalizata"); ylabel("Faza (grade)");

% DREPTUGHIULARA:
% latime lob principal : 0.144
% diferenta lob principal - lob secundar (atenuare): -20.14 dB

% TRIUNGHIULARA:
% latime lob principal : 0.176
% diferenta lob principal - lob secundar (atenuare): -28.11 dB

% BLACKMAN:
% latime lob principal : 0.216
% diferenta lob principal - lob secundar (atenuare): -79.04 dB

% HAMMING:
% latime lob principal : 0.179
% diferenta lob principal - lob secundar (atenuare): -75.22 dB

% HANNING:
% latime lob principal : 0.173
% diferenta lob principal - lob secundar (atenuare): -45.92 dB

% CHEBYSHEV r=85:
% latime lob principal : 0.218
% diferenta lob principal - lob secundar (atenuare): -103.47 dB

% CHEBYSHEV r=90:
% latime lob principal : 0.228
% diferenta lob principal - lob secundar (atenuare): -108.93 dB

% CHEBYSHEV r=95:
% latime lob principal : 0.239
% diferenta lob principal - lob secundar (atenuare): -114.95 dB

% KAISER beta =5:
% latime lob principal : 0.182
% diferenta lob principal - lob secundar (atenuare): -61.22 dB

% KAISER beta =6:
% latime lob principal : 0.189
% diferenta lob principal - lob secundar (atenuare): -65.68 dB

% KAISER beta =7:
% latime lob principal : 0.196
% diferenta lob principal - lob secundar (atenuare): -73.90 dB

% LANCZOS L =1:
% latime lob principal : 0.169
% diferenta lob principal - lob secundar (atenuare): -40.75 dB

% LANCZOS L =2:
% latime lob principal : 0.192
% diferenta lob principal - lob secundar (atenuare): -57.59 dB

% LANCZOS L =3:
% latime lob principal : 0.211
% diferenta lob principal - lob secundar (atenuare): -75.36 dB

% TUKEY alfa=36:
% latime lob principal : 0.179
% diferenta lob principal - lob secundar (atenuare): -48.15 dB

% TUKEY alfa=51:
% latime lob principal : 0.179
% diferenta lob principal - lob secundar (atenuare): -48.15 dB

% TUKEY alfa=66:
% latime lob principal : 0.179
% diferenta lob principal - lob secundar (atenuare): -48.15 dB

% Pe baza datelor de mai sus, am realizat clasamentul de mai jos. De notat este faptul 
% ca am considerat ca o atenuare mai mare a lobilor secundari este mai importanta decat o 
% largime de banda mai ingusta a lobului principal, desi acest lucru este subiectiv. Totusi, 
% o fereastra cu latimea lobului principal semnificativ mai mica decat a unei alte ferestre 
% cu o atenuare mai mare a lobilor secundari ocupa un loc prioritar in clasament (ex. fereastra 
% Hamming este pusa deasupra ferestrei Blackman sau Kaiser beta = 7 pusa peste Lanczos L = 3). 
% De asemenea, am pus accent si pe atenuarile lobilor secundari aflati spre finalul spectrului, 
% nu doar primii lobi secundari, dar si pe oscilatiile in magnitudine, pentru a face diferente 
% intre aceleasi ferestre cu parametri variabili (ex. ferestrele Kaiser beta = 5 si beta = 6). 
% Cum ferestrele Tukey alfa = 36, alfa = 51 si alfa = 66 sunt identice, ele sunt plasate una dupa 
% alta in clasament, desi, teoretic, ar trebui sa ocupe acelasi loc. Clasamentul pune pe primul loc 
% fereastra optima, iar pe ultimul fereastra cea mai slaba.

%CLASAMENT
% 1. Fereastra Chebyshev r = 95
% 2. Fereastra Chebyshev r = 90
% 3. Fereastra Chebyshev r = 85
% 4. Fereastra Hamming
% 5. Fereastra Blackman
% 6. Fereastra Kaiser beta = 7
% 7. Fereastra Lanczos L = 3
% 8. Fereastra Kaiser beta = 5
% 9. Fereastra Kaiser beta = 6
% 10. Fereastra Lanczos L = 2
% 11. Fereastra Tukey  afla = 36
% 12. Fereastra Tukey alfa = 51
% 13. Fereastra Tukey alfa = 66
% 14. Fereastra Hanning
% 15. Fereastra Lanczos L = 1
% 16. Fereastra triunghiulara
% 17. Fereastra dreptunghiulara

% Dupa aceasta clasificare, se poate realiza si clasificarea celor 9 ferestre de semnal, 
% pe baza performantei filtrelor obtinute:

% 1. Fereastra Chebyshev, avand toate cele 3 variatii in topul clasamentului
% 2. Fereastra Hamming
% 3. Fereastra Blackman
% 4. Fereastra Kaiser, variatiile ei ocupand pozitii superioare variatiilor ferestrei Lanczos
% 5. Fereastra Lanczos
% 6. Fereastra Tukey
% 7. Fereastra Hanning
% 8. Fereastra triunghiulara
% 9. Fereastra dreptunghiulara

% Clasificarea de la quiz:

% 1. Fereastra Kaiser
% 2. Fereastra Lanczos
% 3. Fereastra Blackman
% 4. Fereastra Hanning
% 5. Fereastra Hamming
% 6. Fereastra Tukey
% 7. Fereastra Chebyshev
% 8. Fereastra triunghiulara
% 9. Fereastra dreptunghiulara

% Se observa o mare diferenta intre cele doua clasamente. In primul rand, 
% fereastra Chebyshev ocupa primul loc pentru clasificarea de la proiect, 
% in timp ce la clasificarea de la quiz ocupa locul 7, fiind considerata o 
% fereastra relativ slaba. Mai departe, ferestrele kaiser si lanczos sunt 
% depreciate semnificativ la proiect fata de quiz, unde nu mai este vorba 
% de caracteristicile ferestrelor, ci de performanta practica a filtrului 
% proiectat. Sunt si cateva asemanari, respectiv ferestrele Blackman, Tukey, 
% triunghiulara si dreptunghiulara, care ocupa aceleasi pozitii in ambele 
% clasamente.

%% Subpunctul B
clc;
close all;

[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1(3,3);
omega_c = PS_PRJ_1_Faza_2a(3,3) ;

% 1. Fereastra Chebyshev r = 95

figure(14);
w=chebwin(M,r+5);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi);  a = round(r+5); b = M;
subplot(2,3,1);
plot(omega0, 20*log10(abs(H))); title("Cheb. r = " + a + ", M =  "+ b); xlabel ("Frecv. normalizata"); ylabel("Magnitudine (dB)");
subplot(2,3,4);
plot(omega0, (180/pi)*angle(H)); title("Cheb. r = " + a + ", M = " + b); xlabel ("Frecv. normalizata"); ylabel("Faza (grade)");

w=chebwin(M+M/2,r+5);
h = fir1(M+M/2-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi);  a = round(r+5); b = M+M/2;
subplot(2,3,2);
plot(omega0, 20*log10(abs(H))); title("Cheb. r = " + a + ", M =  "+ b); xlabel ("Frecv. normalizata"); ylabel("Magnitudine (dB)");
subplot(2,3,5);
plot(omega0, (180/pi)*angle(H)); title("Cheb. r = " + a + ", M = " + b); xlabel ("Frecv. normalizata"); ylabel("Faza (grade)");

w=chebwin(2*M,r+5);
h = fir1(2*M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi);  a = round(r+5); b = 2*M;
subplot(2,3,3);
plot(omega0, 20*log10(abs(H))); title("Cheb. r = " + a + ", M =  "+ b); xlabel ("Frecv. normalizata"); ylabel("Magnitudine (dB)");
subplot(2,3,6);
plot(omega0, (180/pi)*angle(H)); title("Cheb. r = " + a + ", M = " + b); xlabel ("Frecv. normalizata"); ylabel("Faza (grade)");

% 9. Fereastra Kaiser beta = 6

figure(15);
w=kaiser(M,beta);
h = fir1(M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi);  a = round(beta); b = M;
subplot(2,3,1);
plot(omega0, 20*log10(abs(H))); title("Kaiser beta = " + a + ", M =  "+ b); xlabel ("Frecv. normalizata"); ylabel("Magnitudine (dB)");
subplot(2,3,4);
plot(omega0, (180/pi)*angle(H)); title("Kaiser beta = " + a + ", M = " + b); xlabel ("Frecv. normalizata"); ylabel("Faza (grade)");

w=kaiser(M+M/2,beta);
h = fir1(M+M/2-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi);  a = round(beta); b = M+M/2;
subplot(2,3,2);
plot(omega0, 20*log10(abs(H))); title("Kaiser beta = " + a + ", M =  "+ b); xlabel ("Frecv. normalizata"); ylabel("Magnitudine (dB)");
subplot(2,3,5);
plot(omega0, (180/pi)*angle(H)); title("Kaiser beta = " + a + ", M = " + b); xlabel ("Frecv. normalizata"); ylabel("Faza (grade)");

w=kaiser(2*M,beta);
h = fir1(2*M-1,freq_c,w) ;
[H, omega0] = freqz(h, 1, 5000);
omega0 = omega0./(2*pi);  a = round(beta); b = 2*M;
subplot(2,3,3);
plot(omega0, 20*log10(abs(H))); title("Kaiser beta = " + a + ", M =  "+ b); xlabel ("Frecv. normalizata"); ylabel("Magnitudine (dB)");
subplot(2,3,6);
plot(omega0, (180/pi)*angle(H)); title("Kaiser beta = " + a + ", M = " + b); xlabel ("Frecv. normalizata"); ylabel("Faza (grade)");

% Chebyshev r =95 M = 36:
% latime lob principal : 0.226
% diferenta lob principal - lob secundar (atenuare): -111.338 dB

% Chebyshev r =95 M = 54:
% latime lob principal : 0.196
% diferenta lob principal - lob secundar (atenuare): -112.091 dB

% Chebyshev r =95 M = 72:
% latime lob principal : 0.174
% diferenta lob principal - lob secundar (atenuare): -113.414 dB

% Kaiser beta =6 M = 36:
% latime lob principal : 0.185
% diferenta lob principal - lob secundar (atenuare): -64.824 dB

% Kaiser beta =6 M = 54:
% latime lob principal : 0.161
% diferenta lob principal - lob secundar (atenuare): -63.235 dB

% Kaiser beta =6 M = 72:
% latime lob principal : 0.147
% diferenta lob principal - lob secundar (atenuare): -64.282 dB

% In cazul ferestrei Chebyshev r = 95, observam ca o crestere a ordinului 
% duce la o ingustare semnificativa a lobului principal, atenuarea lobilor 
% secundari mentinandu-se relativ constanta. In cazul ferestrei Kaiser, 
% avem acelasi fenomen ca la fereastra Chebyshev r = 95: ingustarea lobului 
% principal, cu variatii mici ale atenuarii. Astfel, deducem ca cel mai bun 
% filtru al ferestrei Chebyshev r = 95 este de ordinul M = 72, iar pentru
% Kaiser beta = 6 este tot M = 72:

% Chebyshev r =95 M = 72:
% latime lob principal : 0.174
% diferenta lob principal - lob secundar (atenuare): -113.414 dB

% Kaiser beta =6 M = 72:
% latime lob principal : 0.147
% diferenta lob principal - lob secundar (atenuare): -64.282 dB

% Se observa ca filtrul ferestrei Chebyshev este net superior filtrului 
% ferestrei Kaiser. Intr-adevar, avem o banda mai ingusta a lobului principal 
% pentru fereastra Kaiser, insa atenuarea lobilor secundari in cazul ferestrei
% Chebyshev este aproape de 2 ori mai mare, ceea ce face acest filtru sa se
% apropie mai mult de un filtru trece-jos ideal si sa fie folosit in mai multe
% aplicatii de prelucrare a semnalelor.

%% Faza 3

clc;
close all;
[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1(3,3);

%Subpunctul A

omega_p = pi/3;
omega_s = pi/2;
omega_c = (omega_p+omega_s)/2;

w=chebwin(M,r+5);
freq_c = omega_c./pi;
h = fir1(M-1,freq_c,w) ;

[delta_pr, delta_sr] = faza_3(h, omega_p, omega_s) 
%se testeaza functia realizata, faza_3.m

%% Subpunctul B
clc;
close all;
[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1(3,3);

[omega_p,omega_s,Delta_p] = PS_PRJ_1_Faza_3b(3,3) ; 
Delta_s = Delta_p;

omega_s = 1.8118; %valoarea retinuta pe care s-a realizat clasamentul performantelor

%1. Fereastra Chebyshev r=95.3243
%w=chebwin(M,r+5);

for w2 = [0.25 0.5 0.75]
    omega_c = (1-w2)*omega_p+w2*omega_s;
    fprintf("-------------w = " + w2 + "\n");
    for M1 = [M M+M/2 6*M]
        fprintf("--------M = " + M1 + "\n");
        w=chebwin(M1,r+5);
        freq_c = omega_c./pi;
        h = fir1(M1-1,freq_c,w) ;
        [delta_pr, delta_sr] = faza_3(h, omega_p, omega_s);
        sum = delta_pr + delta_sr
        %delta_pr
        %delta_sr
    end
end

%Deoarece, pentru M-ul dat, performantele filtrelor rezultate sunt 
%FOARTE slabe, marim ultima valoare pe care o ia M1 din 2*M in 6*M

%Clasificare in functie de performanta (descrescator):
% 1. w = 0.5 M = 216 : sum = 1.1154e-05
% 2. w = 0.25 M = 216 : sum = 0.0368
% 3. w = 0.75 M = 216 : sum = 0.0372
% 4. w = 0.5 M = 54 : sum = 0.3894
% 5. w = 0.25 M = 54 : sum = 0.4300
% 6. w = 0.75 M = 54 : sum = 0.4302
% 7. w = 0.5 M = 36 : sum = 0.5676
% 8. w = 0.25 M = 36 : sum = 0.5823
% 9. w = 0.75 M = 36 : sum = 0.5823

w2 = [0.5 0.25 0.75 0.5 0.25 0.75 0.5 0.25 0.75];
M1 = [216 216 216 54 54 54 36 36 36];

figure(16); sgtitle("Secvente pondere Chebyshev r=95");
i = 1;
for i = 1:length(w2)
    omega_c = (1-w2(i))*omega_p+w2(i)*omega_s;
    w=chebwin(M1(i),r+5);
    freq_c = omega_c./pi;
    h = fir1(M1(i)-1,freq_c,w) ;
    subplot(3,3,i);
    stem(h); title("M= " + M1(i) + " w= "+ w2(i)); xlabel ("Timp"); ylabel("Amplitudine");
    i = i+1;
end

figure(17); sgtitle("Spectre Chebyshev r=95");
i = 1;
for i = 1:length(w2)
    omega_c = (1-w2(i))*omega_p+w2(i)*omega_s;
    w=chebwin(M1(i),r+5);
    freq_c = omega_c./pi;
    h = fir1(M1(i)-1,freq_c,w) ;
    [H, omega0] = freqz(h, 1, 5000);
    [delta_pr, delta_sr] = faza_3(h, omega_p, omega_s);
    subplot(3,3,i);
    plot(omega0, 20*log10(abs(H))); title("M=" + M1(i) + " d_pr=" + sprintf('%.6f', delta_pr) + " d_sr=" + sprintf('%.6f', delta_sr)); xlabel ("Pulsatie"); ylabel("Magnitudine(dB)");
    %liniile rosii arata deplasate deoarece spectrul este reprezentat
    %in DECIBELI!
    line([omega_p, omega_p], ylim, 'Color', 'r', 'LineStyle', '--');
    line([omega_s, omega_s], ylim, 'Color', 'r', 'LineStyle', '--');
    line([omega_c, omega_c], ylim, 'Color', 'r', 'LineStyle', '--');
    line([0, omega_p], [20*log10(abs(1+Delta_p/100)), 20*log10(abs(1+Delta_p/100))], 'Color', 'g', 'LineStyle', '--');
    line([0, omega_p], [20*log10(abs(1-Delta_p/100)), 20*log10(abs(1-Delta_p/100))], 'Color', 'g', 'LineStyle', '--');
    line([omega_s, pi], [20*log10(abs(Delta_s/100)), 20*log10(abs(Delta_s/100))], 'Color', 'g', 'LineStyle', '--');
    %Pentru M=216 graficul spectrului este in limitele impuse
    i = i+1;
end

figure(18); sgtitle("Faze Chebyshev r=95");
i = 1;
for i = 1:length(w2)
    omega_c = (1-w2(i))*omega_p+w2(i)*omega_s;
    w=chebwin(M1(i),r+5);
    freq_c = omega_c./pi;
    h = fir1(M1(i)-1,freq_c,w) ;
    [H, omega0] = freqz(h, 1, 5000);
    [delta_pr, delta_sr] = faza_3(h, omega_p, omega_s);
    subplot(3,3,i);
    plot(omega0, (180/pi)*angle(H)); title("M=" + M1(i) + " d_pr=" + sprintf('%.6f', delta_pr) + " d_sr=" + sprintf('%.6f', delta_sr)); xlabel ("Pulsatie"); ylabel("Faza(grade)");
    line([omega_p, omega_p], ylim, 'Color', 'r', 'LineStyle', '--');
    line([omega_s, omega_s], ylim, 'Color', 'r', 'LineStyle', '--');
    line([omega_c, omega_c], ylim, 'Color', 'r', 'LineStyle', '--');
    i = i+1;
end

%% Faza 4
clc;
close all;
clear all;

[omega_p,omega_s,Delta_p] = PS_PRJ_1_Faza_3b(3,3) ; 
Delta_s = Delta_p;
omega_s = 1.8118; % valoarea retinuta anterior
sum_min = 0.12; % (Delta_p + Delta_s)/100

% r = 0 : 0.01 : 100
% alfa = 0 : 0.01 : 100
% beta = 0 : 0.01 : 10
% L = 1 : 10

p = 0;
for M = 20 : 200
    for w1 = 0.45 : 0.01 : 0.55 % din teste anterioare a rezultat ca 
    % valoarea optima pt omega_c reiese din variatii ale lui w in jurul
    % valorii de 0.5, de aceea ia valori intre 0.45 si 0.55
        for beta = 0 : 0.01 : 10
            w = kaiser(M, beta); % s-a testat fiecare fereastra in parte, cu 
            % variatii ale paramentrilor unde este cazul, si s-au notat cele 
            % mai bune performante (cele mai mici M pentru care tolerantele nu
            % depasesc pragul). Aici se testa kaiser cu paramentrul beta.
            omega_c = w1*omega_p + (1-w1)*omega_s;
            freq_c = omega_c/pi;
            h = fir1(M-1,freq_c,w);
            [delta_pr, delta_sr] = faza_3(h, omega_p, omega_s);
            if (delta_pr*100 > Delta_p || delta_sr*100 > Delta_s) % se verifica daca sunt depasite tolerantele
                continue;
            end
            p = 1; %cand s-a ajuns la un M care satisface tolerantele, se mai 
            % verifica doar parametrii ferestrelor, unde este cazul, pentru sum 
            % cat mai mic dupa care se iese din for-uri
            sum = delta_pr + delta_sr;
            if(sum < sum_min) % se retin variabilele pentru care delta_pr + delta_sr este minim
                sum_min = sum;
                w_min = w1;
                beta_min = beta;
                omega_c_min = omega_c;
            end
        end
    end
    if (p == 1)
       M_min = M; % se retine cel mai mic M (ordin) care satisface tolerantele
      break;
    end
end

% se afiseaza rezultatele optime (M cat mai mic, dupa care delta_pr + delta_sr 
% cat mai mic) pentru o anumita fereastra
if(sum_min ~= 0.12)
    fprintf('beta_min: %.2f\n', beta_min);
    fprintf('M_min: %d\n', M_min);
    fprintf('w_min: %.2f\n', w_min);
    fprintf('sum_min: %.4f\n', sum_min);
    fprintf('omega_c_min: %.4f\n', omega_c_min);
end

% Dupa finalizarea testelor, au rezultat urmatoarele trei FTJ optime:
%------------------GOLD
% kaiser
% beta_min: 1.53
% M_min: 39
% omega_c: 1.7108
% sum_min: 0.089812
%------------------SILVER
% kaiser
% beta_min: 1.53
% M_min: 39
% omega_c: 1.7087
% sum_min: 0.090644
%------------------BRONZE
% kaiser
% beta_min: 1.53
% M_min: 39
% omega_c: 1.7066
% sum_min: 0.096343

%Se salveaza filtrul GOLD in .mat
omega_c = 1.7108;
w = kaiser(39,1.53);
h = fir1(38,omega_c/pi,w);

[omega_p,omega_s,Delta_p] = PS_PRJ_1_Faza_3b(3,3) ; 
Delta_s = Delta_p;
omega_s = 1.8118;

save BLEJAN_Andrei_F#4 h omega_p omega_c omega_s Delta_p Delta_s 

%% Faza 4 grafice GOLD SILVER BRONZE
[omega_p,omega_s,Delta_p] = PS_PRJ_1_Faza_3b(3,3) ; 
Delta_s = Delta_p;
omega_s = 1.8118; %valoarea retinuta anterior

figure(19); sgtitle("GOLD | SILVER | BRONZE")
subplot(3,3,1);
w = kaiser(39, 1.53);
h = fir1(38,1.7108/pi,w);
[H, omega0] = freqz(h, 1, 5000);
plot(omega0, 20*log10(abs(H))); title("Kai. beta=1.53 M=39 o_c=1.7108"); xlabel ("Pulsatie"); ylabel("Magnitudine(dB)");
line([omega_p, omega_p], ylim, 'Color', 'r', 'LineStyle', '--');
line([omega_s, omega_s], ylim, 'Color', 'r', 'LineStyle', '--');
line([1.7108, 1.7108], ylim, 'Color', 'r', 'LineStyle', '--');
line([0, omega_p], [20*log10(abs(1+Delta_p/100)), 20*log10(abs(1+Delta_p/100))], 'Color', 'g', 'LineStyle', '--');
line([0, omega_p], [20*log10(abs(1-Delta_p/100)), 20*log10(abs(1-Delta_p/100))], 'Color', 'g', 'LineStyle', '--');
line([omega_s, pi], [20*log10(abs(Delta_s/100)), 20*log10(abs(Delta_s/100))], 'Color', 'g', 'LineStyle', '--');

subplot(3,3,2);
w = kaiser(39, 1.53);
h = fir1(38,1.7087/pi,w);
[H, omega0] = freqz(h, 1, 5000);
plot(omega0, 20*log10(abs(H))); title("Kai., beta=1.53 M=39 o_c=1.7087"); xlabel ("Pulsatie"); ylabel("Magnitudine(dB)");
line([omega_p, omega_p], ylim, 'Color', 'r', 'LineStyle', '--');
line([omega_s, omega_s], ylim, 'Color', 'r', 'LineStyle', '--');
line([1.7087, 1.7087], ylim, 'Color', 'r', 'LineStyle', '--');
line([0, omega_p], [20*log10(abs(1+Delta_p/100)), 20*log10(abs(1+Delta_p/100))], 'Color', 'g', 'LineStyle', '--');
line([0, omega_p], [20*log10(abs(1-Delta_p/100)), 20*log10(abs(1-Delta_p/100))], 'Color', 'g', 'LineStyle', '--');
line([omega_s, pi], [20*log10(abs(Delta_s/100)), 20*log10(abs(Delta_s/100))], 'Color', 'g', 'LineStyle', '--');

subplot(3,3,3);
w = kaiser(39, 1.53);
h = fir1(38,1.7066/pi,w);
[H, omega0] = freqz(h, 1, 5000);
plot(omega0, 20*log10(abs(H))); title("Kai. beta=1.53 M=39 o_c=1.7066"); xlabel ("Pulsatie"); ylabel("Magnitudine(dB)");
line([omega_p, omega_p], ylim, 'Color', 'r', 'LineStyle', '--');
line([omega_s, omega_s], ylim, 'Color', 'r', 'LineStyle', '--');
line([1.7066, 1.7066], ylim, 'Color', 'r', 'LineStyle', '--');
line([0, omega_p], [20*log10(abs(1+Delta_p/100)), 20*log10(abs(1+Delta_p/100))], 'Color', 'g', 'LineStyle', '--');
line([0, omega_p], [20*log10(abs(1-Delta_p/100)), 20*log10(abs(1-Delta_p/100))], 'Color', 'g', 'LineStyle', '--');
line([omega_s, pi], [20*log10(abs(Delta_s/100)), 20*log10(abs(Delta_s/100))], 'Color', 'g', 'LineStyle', '--');

subplot(3,3,4);
w = kaiser(39, 1.53);
h = fir1(38,1.7108/pi,w);
[H, omega0] = freqz(h, 1, 5000);
plot(omega0, (180/pi)*angle(H)); title("Faza"); xlabel ("Pulsatie"); ylabel("Faza(grade)");

subplot(3,3,5);
w = kaiser(39, 1.53);
h = fir1(38,1.7087/pi,w);
[H, omega0] = freqz(h, 1, 5000);
plot(omega0, (180/pi)*angle(H)); title("Faza"); xlabel ("Pulsatie"); ylabel("Faza(grade)");

subplot(3,3,6);
w = kaiser(39, 1.53);
h = fir1(38,1.7066/pi,w);
[H, omega0] = freqz(h, 1, 5000);
plot(omega0, (180/pi)*angle(H)); title("Faza"); xlabel ("Pulsatie"); ylabel("Faza(grade)");

subplot(3,3,7);
w = kaiser(39, 1.53);
h = fir1(38,1.7108/pi,w);
stem(h); title("Secventa pondere"); xlabel ("Timp"); ylabel("Amplitudine");

subplot(3,3,8);
w = kaiser(39, 1.53);
h = fir1(38,1.7087/pi,w);
stem(h); title("Secventa pondere"); xlabel ("Timp"); ylabel("Amplitudine");

subplot(3,3,9);
w = kaiser(39, 1.53);
h = fir1(38,1.7066/pi,w);
stem(h); title("Secventa pondere"); xlabel ("Timp"); ylabel("Amplitudine");

%% Faza 5
clc;
close all;
clear all;

Delta_p = 5.0973;
Delta_s = 5.0973;
dif_min = inf;

%Cum ferestra cea mai performanta de la Faza 4 a fost, de departe,
%fereastra Kaiser, la faza 5 am testat preponderent diferite variatii ale
%acestei ferestre.
%NU am interpretat toate cele 8 variable de cautare, deoarece timpul de
%calcul ar fi mult prea mare pentru a efectua teste.

p = 0;
for M = 20 : 200
    for dif_prag = 0.002*M : 0.01 :0.004*M %pragul pentru care este acceptata
        % o anume largime a benzii de tranzitie este scalata la M pentru a 
        % pune in balanta importanta unui ordin cat mai mic cu importanta 
        % unei benzi de tranzitie cat mai inguste
        for omega_c = pi/8 : 0.02 : pi/2
            for beta = 1 : 0.02 : 3
                w = kaiser(M, beta);
                freq_c = omega_c/pi;
                h = fir1(M-1,freq_c,w);
                [omega_p, omega_s] = faza_5(h, Delta_p, Delta_s); %se 
                % calculeaza omega_p si omega_s (cu ajutorul formulelor din
                % indicatii) in functie de fereastra si frecv de taiere setate
                [delta_pr, delta_sr] = faza_3(h, omega_p, omega_s); %dupa 
                % care se calculeaza tolerantele cu benzile definite 
                if((omega_s - omega_p) > dif_prag)
                    continue
                end
                if (delta_pr*100 > Delta_p || delta_sr*100 > Delta_s)
                    continue;
                end
                p = 1;
                if(omega_s - omega_p < dif_min)
                    dif_min = omega_s - omega_p;
                    omega_c_min = omega_c;
                    beta_min = beta;
                    sum = delta_pr + delta_sr;
                    omega_p_min = omega_p;
                    omega_s_min = omega_s;
                end
            end
        end
    end
    if (p == 1)
        M_min = M;
        break;
    end
end

if(dif_min ~= inf)
    fprintf('beta_min: %.2f\n', beta_min);
    fprintf('M_min: %d\n', M_min);
    fprintf('omega_c_min: %.4f\n', omega_c_min);
    fprintf('dif_min: %.6f\n', dif_min);
    fprintf('sum: %6f\n', sum);
end

% In urma testarilor, a reiesit ca fereastra Kaiser M = 45 beta = 1.54 este 
% cel mai bun filtru pe care am reusit sa il creez, tinand cont atat de 
% ordinul filtrului, cat si de banda de tranzitie ingusta si de tolerante mici.

M = 45;
beta = 1.54;
omega_c = 0.51;
omega_p =  0.4247;
omega_s = 0.5976;

w = kaiser(M, beta);    
freq_c = omega_c/pi;
h = fir1(M-1,freq_c,w);
[H, omega0] = freqz(h, 1, 5000);

figure(20); sgtitle("Kaiser M = 45 beta = 1.54")
subplot(1,3,1);
plot(omega0, 20*log10(abs(H))); title("Spectru"); xlabel ("Pulsatie"); ylabel("Magnitudine(dB)");
line([omega_p, omega_p], ylim, 'Color', 'r', 'LineStyle', '--');
line([omega_s, omega_s], ylim, 'Color', 'r', 'LineStyle', '--');
line([omega_c, omega_c], ylim, 'Color', 'r', 'LineStyle', '--');
line([0, omega_p], [20*log10(abs(1+Delta_p/100)), 20*log10(abs(1+Delta_p/100))], 'Color', 'g', 'LineStyle', '--');
line([0, omega_p], [20*log10(abs(1-Delta_p/100)), 20*log10(abs(1-Delta_p/100))], 'Color', 'g', 'LineStyle', '--');
line([omega_s, pi], [20*log10(abs(Delta_s/100)), 20*log10(abs(Delta_s/100))], 'Color', 'g', 'LineStyle', '--');

subplot(1,3,2);
plot(omega0, 180/pi*angle(H)); title("Faza"); xlabel ("Pulsatie"); ylabel("Faza (grade)");

subplot(1,3,3);
stem(h); title("Secventa pondere"); xlabel ("Timp"); ylabel("Amplitudine");

save BLEJAN_Andrei_F#5 h omega_p omega_c omega_s Delta_p Delta_s 
