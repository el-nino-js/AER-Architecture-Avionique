function signalFiltre = interfaceFiltre90Hz(signal,marge)
%% interfaceFiltre90Hz.m
% Filtre passe-bande ne laissant passer qu'une frequence de 90 Hz

% Entr�s:
%   signal: signal echantillonn� � une fr�quence de 1500Hz [vector]
%   marge: pourcentage de marge permise au signal filtr� [double]
%
% Sortie:
%   ddm: signal filtr� � 90 Hz [vector]
fpass = 90; % frequence de la bande passante du signal (Hz)
fs = 1500; % taux d'echantillonage du signal (Hz)
margeMin = fpass - (fpass * marge);
margeMax = fpass + (fpass * marge);
signalFiltre = bandpass(signal, [margeMin, margeMax], fs);
end

