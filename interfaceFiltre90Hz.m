function amp90 = interfaceFiltre90Hz(signal)
%% interfaceFiltre90Hz.m
% Filtre un signal à 90 Hz et retourne sont amplitude de modulation
% Entrés:
%   signal: signal echantillonné à une fréquence de 1500Hz [vector]
%
% Sortie:
%   amp90: Amplitude du signal filtre à 90Hz [double]
    
    % Augmentation de la taille de l'échantillon de 30Hz envoyé en réplicant le signal 20 fois 
    % On réduit ainsi l'imprécision 
    for i = 1:20
        duplicateSignal(50*(i-1)+1:50*i) = signal;  
    end
    
    % Fonction de filtre passe-bande à 90Hz réaliser sous FilterDesign 
    Fs = 1500;  % Sampling Frequency

    N      = 200;  % Order
    Fstop1 = 80;   % First Stopband Frequency;
    Fpass1 = 86;   % First Passband Frequency
    Fpass2 = 94;   % Second Passband Frequency
    Fstop2 = 100;  % Second Stopband Frequency;
    Wstop1 = 1;    % First Stopband Weight
    Wpass  = 1;    % Passband Weight
    Wstop2 = 1;    % Second Stopband Weight
    dens   = 50;   % Density Factor

    % Calculate the coefficients using the FIRPM function.
    b  = firpm(N, [0 Fstop1 Fpass1 Fpass2 Fstop2 Fs/2]/(Fs/2), [0 0 1 1 0 ...
               0], [Wstop1 Wpass Wstop2], {dens});
    Hd = dfilt.dffir(b);
    
    signal90 = filter(b,1,duplicateSignal); % Signal filtre a 90Hz
    amp90 = peak2peak(signal90)/2; % Amplitude du signal à 90Hz
end
