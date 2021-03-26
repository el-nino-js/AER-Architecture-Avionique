function signalFiltre = interfaceFiltre150Hz(signal,marge)
%% interfaceFiltre150Hz.m
% Filtre passe-bande ne laissant passer qu'une frequence de 150 Hz

% Entr�s:
%   signal: vecteur de signal echantillonn� � une fr�quence de 1500Hz
%   marge: pourcentage de marge permise au signal filtr�
%
% Sortie:
%   ddm: vecteur de signal filtr� � 150 Hz
fpass = 150; % frequence de la bande passante du signal (Hz)
fs = 1500; % taux d'echantillonage du signal (Hz)
margeMin = fpass - (fpass * marge);
margeMax = fpass + (fpass * marge);
signalFiltre = bandpass(signal, [margeMin, margeMax], fs);
end

