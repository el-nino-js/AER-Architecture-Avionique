function [errorSignalFiltre, signalFiltre] = interfaceFiltre150Hz(signal)
%% interfaceFiltre150Hz.m
% Filtre passe-bande ne laissant passer qu'une frequence de 150 Hz

% Entrés:
%   signal: signal echantillonné à une fréquence de 1500Hz [vector]
%   marge: pourcentage de marge permise au signal filtré [double]
%
% Sortie:
%   signalFiltre: signal filtré à 150 Hz [vector]
%   errorSignalFiltre: indique la présence d'une erreur au niveau du
%                      filtrage 150 Hz lorsque vrai [bool]
    errorSignalFiltre = true;
    fpass = 150; % frequence de la bande passante du signal (Hz)
    fs = 1500; % taux d'echantillonage du signal (Hz)
    margin = 0.02; % marge de fréquence toléré
    margeMin = fpass - (fpass * margin);
    margeMax = fpass + (fpass * margin);
    signalFiltre = bandpass(signal, [margeMin, margeMax], fs);

    % Signal est nulle si le signal 150 Hz present apres le 
    % filtrage est manquant
    if (any(signalFiltre))
        errorSignalFiltre = false;
    end
end

