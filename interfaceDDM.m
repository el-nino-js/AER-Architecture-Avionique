function [ddm,deviation] = interfaceDDM(amplitude90Hz, amplitude150Hz)
%% interfaceDDM.m
% Calcul la diff�rence de profondeur de modulation (ddm) de deux pourcentage d'amplitudes de signals
% modul�s de 90Hz et 150Hz localis�es sur la ligne m�diane d'une piste
% d'atterissage ainsi que la deviation

% Entr�s:
%   amplitude90Hz: Pourcentage d'amplitude d'un signal modul�e � 90 Hz
%   [double]
%   amplitude150Hz: Pourcentage d'amplitude d'un signal modul�e � 150 Hz [double] 
%
% Sortie:
%   ddm: signal d'�cart entre les deux ondes porteuses [double]
%   deviation: deviation de l'avion [string]
    ddm = amplitude90Hz - amplitude150Hz;
    
    deviation = calculerDeviation(ddm);
end

function deviation = calculerDeviation(ddm)
        %% calculerDeviationAvion
        % Calcul la deviation possible de l'avion dependamment de la valeur
        % DDM
        % Entr�s:
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
