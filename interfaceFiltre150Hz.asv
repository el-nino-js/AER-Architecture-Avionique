function signalFiltre = interfaceFiltre150Hz(signal,marge)
%% interfaceFiltre150Hz.m
% Filtre passe-bande ne laissant passer qu'une frequence de 150 Hz

% Entrés:
%   signal: signal echantillonné à une fréquence de 1500Hz [vector]
%   marge: pourcentage de marge permise au signal filtré [double]
%
% Sortie:
%   ddm: signal filtré à 150 Hz [vector]
fpass = 150; % frequence de la bande passante du signal (Hz)
fs = 1500; % taux d'echantillonage du signal (Hz)

margeMin = fpass - (fpass * marge);
margeMax = fpass + (fpass * marge);
signalFiltre = bandpass(signal, [margeMin, margeMax], fs);
end

