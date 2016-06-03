function poging3 = poging3(s1, s2, ref1, ref2)
speedsound=340;
Fs=48000;
samplelinks = 1500;
samplerechts = 1500;
Ny1 = length(s1);
Nx1 = length(ref1);
Ny2 = length(s2);
Nx2 = length(ref2);

% [C1,D1]=conv(s1,ref1);
% [C2,D2]=conv(s2,ref2);
Y1 = fft(s1);
X1 = fft([ref1; zeros(Ny1-Nx1,1)]);
H1 = Y1./X1;
ii = find(abs(H1) < 0.00*(max(abs(H1))));
H1(ii) = 0;
h1 = ifft(H1);

Y2 = fft(s2);
X2 = fft([ref2; zeros(Ny2-Nx2,1)]);
H2 = Y2./X2;
ii = find(abs(H2) < 0.00*(max(abs(H2))));
H2(ii) = 0;
h2 = ifft(H2);
% 
% 
h1 = h1';
h2 = h2';
 h1 = [zeros(1,samplelinks) h1 zeros(1,samplelinks)];
 h2 = [zeros(1,samplelinks) h2 zeros(1,samplelinks)];
I1 = find(h1 == max(h1));
I2 = find(h2 == max(h2(I1-samplelinks:I1+samplerechts)));

I=I2-I1
time = I/Fs;
poging3 = time*speedsound;

end
