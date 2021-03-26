function [ddm,position] = interfaceDDM(amplitude90Hz, amplitude150Hz)
%% interfaceDDM.m
% Calcul la différence de profondeur de modulation (ddm) de deux pourcentage d'amplitudes de signals
% modulés de 90Hz et 150Hz localisées sur la ligne médiane d'une piste d'atterissage

% Entrés:
%   amplitude90Hz: Pourcentage d'amplitude d'un signal modulée à 90 Hz 
%   amplitude150Hz: Pourcentage d'amplitude d'un signal modulée à 150 Hz  
%
% Sortie:
%   ddm: signal d'écart entre les deux ondes porteuses
    ddm = amplitude90Hz - amplitude150Hz;
    
    position = calculerPositionAvion(ddm);
end

function position = calculerPositionAvion(ddm)
        %% calculerPositionAvion
        % Calcul la position possible de l'avion dependamment de la valeur
        % DDM

        % Entrés:
        %   ddm: difference de profondeur de modulation  
        %
        % Sortie:
        %   position: position de l'avion (centre, gauche, droite)
        if (ddm == 0)
            position = "centre";
        elseif (ddm < 0)
            position = "gauche";
        elseif (ddm > 0)
            position = "droite";
        else
            position = "invalide";
        end
end
