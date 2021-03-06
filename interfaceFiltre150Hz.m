function amp150 = interfaceFiltre150Hz(signal)
%% interfaceFiltre150Hz.m
% Filtre un signal ? 150 Hz et retourne sont indice de modulation
% Entr?s:
%   signal: signal echantillonn? ? une fr?quence de 1500Hz [vector]
%
% Sortie:
%   amp150: Amplitude du signal filtr? ? 150Hz [double]
    
    
    % Fonction de filtre passe-bande ? 150Hz r?aliser sous FilterDesign 
    Fs = 1500;  % Sampling Frequency

    N      = 200;  % Order
    Fstop1 = 140;   % First Stopband Frequency;
    Fpass1 = 146;   % First Passband Frequency
    Fpass2 = 154;   % Second Passband Frequency
    Fstop2 = 160;  % Second Stopband Frequency;
    Wstop1 = 1;    % First Stopband Weight
    Wpass  = 1;    % Passband Weight
    Wstop2 = 1;    % Second Stopband Weight
    dens   = 50;   % Density Factor

    % Calculate the coefficients using the FIRPM function.
    b  = firpm(N, [0 Fstop1 Fpass1 Fpass2 Fstop2 Fs/2]/(Fs/2), [0 0 1 1 0 ...
               0], [Wstop1 Wpass Wstop2], {dens});
    Hd = dfilt.dffir(b);
    
    % [LLR3] [LLR4]
    signal150 = filter(b,1,signal);  % Signal filtre a 150Hz
    amp150 = peak2peak(signal150)/2; % Amplitude du signal ? 150Hz
end
