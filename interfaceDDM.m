function [errorDdm,deviation,ddm] = interfaceDDM(signal90Hz, signal150Hz)
%% interfaceDDM.m
% Calcul la diff�rence de profondeur de modulation (ddm) de deux signals
% modul�s de 90Hz et 150Hz localis�es sur la ligne m�diane d'une piste
% d'atterissage ainsi que la deviation de l'avion

% Entr�s:
%   amplitude90Hz: signal modul�e � 90 Hz [double]
%   amplitude150Hz: signal modul�e � 150 Hz [double] 
%
% Sortie:
%   errorddm: indique la presence d'erreur de la valeur ddm [bool]
%   ddm: signal d'�cart entre les deux ondes porteuses [double]
%        deviation: deviation de l'avion [string]

    amplitude90Hz = moduleSignal(signal90Hz);
    amplitude150Hz = moduleSignal(signal150Hz);
    
    ddm = amplitude90Hz - amplitude150Hz;
    ddm = round(ddm,3,'significant'); % 3 chiffres significatifs
    ddm = single(ddm); % format single 32 bit;
    
    deviation = calculateDeviation(ddm);
    errorDdm = findErrorDdm(amplitude90Hz, amplitude150Hz, ddm);
    
    %sauvegarde ddm dans le fichier ascii 'ddm.txt'
    ddmAscii = num2str(ddm);
    fid = fopen('ddm.txt','wt');
    fprintf(fid, ddmAscii);
    fclose(fid);
    
    %sauvegarde deviation dans le fichier 'deviation.txt';
    fid = fopen('deviation.txt','wt');
    fprintf(fid, deviation);
    fclose(fid);

end

function deviation = calculateDeviation(ddm)
        %% calculateDeviationAvion
        % Calcul la deviation possible de l'avion dependamment de la valeur
        % DDM
        % Entr�s:
        %   ddm: difference de profondeur de modulation [double]
        %
        % Sortie:
        %   deviation: deviation de l'avion [string]
        if (ddm == 0)
            deviation = "nul";
        elseif (ddm < 0)
            deviation = "negative";
        else
            deviation = "positive";
        end
end

function h = moduleSignal(signal)
        %% moduleSignal
        % Module les amplitudes d'un signal pour en extraire l'indice de
        % modulation (ou pourcentage d'amplitude)
        % Entr�s:
        %   signal: signal filtr� � 90 Hz ou 150 Hz avec un sampling rate
        %   de 1500 Hz
        %
        % Sortie:
        %   h: Indice de modulation du signal
        fs = 1500; %taux d'�chantillonnage
        maxima = findpeaks(signal,fs); %retourne toutes les amplitudes
        
        %Calcul de l'indice de modulation 
        % source: https://fr.wikipedia.org/wiki/Modulation_d%27amplitude#:~:text=La%20modulation%20d'amplitude%20ou,utilis%C3%A9e%20pour%20moduler%20un%20signal.
        vMin = min(maxima); %amplitude minimal du signal modul�
        vMax = max(maxima); %amplitude maximal du signal modul�
       
        h = (vMax - vMin)/(vMax + vMin);
end

function errorDdm = findErrorDdm(amplitudeA, amplitudeB, ddm)
        %% findErrorDdm
        % Determine si les valeur de modulation et de ddm respecte leur seuil
        % Entr�s:
        %   amplitudeA: Indice de modulation [double]
        %   amplitudeB: Indice de modulation [double]
        %   ddm: signal d'ecart entre les deux ondes porteuses [double]
        %
        % Sortie:
        %   errorDdm: indique la pr�sence d'une erreur dans le calcul de ddm lorsque vrai [bool]
        errorDdm = true;
        
        amplitudeAThreshold = 1 - amplitudeA;
        amplitudeBThreshold = 1 - amplitudeB;
        ddmSensibility = 0.15;
        
        % Indice de modulation > 70% de la valeur nominale
        % Perte de sensibilit� : ddm < 0.15
        if ((amplitudeAThreshold > 0.70) && (amplitudeBThreshold > 0.70) && (abs(ddm)<ddmSensibility))
            errorDdm = false;
        end
        
end
