function [ddm,position] = interfaceDDM(amplitude90Hz, amplitude150Hz)
%% interfaceDDM.m
% Calcul la diff�rence de profondeur de modulation (ddm) de deux pourcentage d'amplitudes de signals
% modul�s de 90Hz et 150Hz localis�es sur la ligne m�diane d'une piste d'atterissage

% Entr�s:
%   amplitude90Hz: Pourcentage d'amplitude d'un signal modul�e � 90 Hz 
%   amplitude150Hz: Pourcentage d'amplitude d'un signal modul�e � 150 Hz  
%
% Sortie:
%   ddm: signal d'�cart entre les deux ondes porteuses
    ddm = amplitude90Hz - amplitude150Hz;
    
    position = calculerPositionAvion(ddm);
end

function position = calculerPositionAvion(ddm)
        %% calculerPositionAvion
        % Calcul la position possible de l'avion dependamment de la valeur
        % DDM

        % Entr�s:
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
