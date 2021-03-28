function h90 = interfaceFiltre90Hz(signal)
%% interfaceFiltre90Hz.m
% filtre un signal � 90 Hz et retourne sont indice de modulation
% Entr�s:
%   signal: signal echantillonn� � une fr�quence de 1500Hz [vector]
%
% Sortie:
%   h90: indice de modulation d'un signal 90Hz [double]�
    fpass = 90; % frequence de la bande passante du signal (Hz)
    margin = 20; % marge du signal tol�r� de 20H
    fs = 1500; % taux d'echantillonage du signal (Hz)

    marginMin = fpass - margin; 
    marginMax = fpass + margin;
    signalFiltre = bandpass(signal, [marginMin, marginMax], fs);
    h90 = moduleSignal(signalFiltre);
end

function h = moduleSignal(signal)
        %% moduleSignal
        % Module les amplitudes d'un signal pour en extraire l'indice de
        % modulation (ou pourcentage d'amplitude)
        % Entr�s:
        %   signal: signal filtr� avec un sampling rate de 1500 Hz
        %
        % Sortie:
        %   h: Indice de modulation du signal
        fs = 1500; %taux d'�chantillonnage
        maxima = findpeaks(signal,fs); %retourne toutes les amplitudes
        
        %Calcul de l'indice de modulation 
        % source: https://fr.wikipedia.org/wiki/Modulation_d%27amplitude#
        vMin = min(maxima); %amplitude minimal du signal modul�
        vMax = max(maxima); %amplitude maximal du signal modul�
       
        h = (vMax - vMin)/(vMax + vMin);
end
