function [ddm,deviation] = interfaceDDM(signal90Hz, signal150Hz)
%% interfaceDDM.m
% Calcul la différence de profondeur de modulation (ddm) de deux signals
% modulés de 90Hz et 150Hz localisées sur la ligne médiane d'une piste
% d'atterissage ainsi que la deviation de l'avion

% Entrés:
%   amplitude90Hz: signal modulée à 90 Hz
%   [double]
%   amplitude150Hz: signal modulée à 150 Hz [double] 
%
% Sortie:
%   ddm: signal d'écart entre les deux ondes porteuses [double]
%   deviation: deviation de l'avion [string]
    
    amplitude90Hz = modulerSignal(signal90Hz);
    amplitude150Hz = modulerSignal(signal150Hz);
    ddm = amplitude90Hz - amplitude150Hz;
    deviation = calculerDeviation(ddm);
end

function deviation = calculerDeviation(ddm)
        %% calculerDeviationAvion
        % Calcul la deviation possible de l'avion dependamment de la valeur
        % DDM
        % Entrés:
        %   ddm: difference de profondeur de modulation [double]
        %
        % Sortie:
        %   deviation: deviation de l'avion [string]
        if (ddm == 0)
            deviation = "nulle";
        elseif (ddm < 0)
            deviation = "negative";
        elseif (ddm > 0)
            deviation = "positive";
        else
            deviation = "invalide";
        end
end

function h = modulerSignal(signal)
        %% modulerSignal
        % Module les amplitudes d'un signal pour en extraire l'indice de
        % modulation (ou pourcentage d'amplitude)
        % Entrés:
        %   signal: signal filtré à 90 Hz ou 150 Hz avec un sampling rate
        %   de 1500 Hz
        %
        % Sortie:
        %   h: Indice de modulation du signal
        fs = 1500; %taux d'échantillonnage
        maxima = findpeaks(signal,fs); %retourne toutes les amplitudes
        
        %Calcul de l'indice de modulation 
        % source: https://fr.wikipedia.org/wiki/Modulation_d%27amplitude#:~:text=La%20modulation%20d'amplitude%20ou,utilis%C3%A9e%20pour%20moduler%20un%20signal.
        vMin = min(maxima); %amplitude minimal du signal modulé
        vMax = max(maxima); %amplitude maximal du signal modulé
       
        h = (vMax - vMin)/(vMax + vMin);
        disp (h);
end

