function [deviation,ddm] = interfaceDDM(amp90, amp150)
%% interfaceDDM.m
% Calcul la diff�rence de profondeur de modulation (ddm) de deux signaux
% modul�s de 90Hz et 150Hz localis�es sur la ligne m�diane d'une piste
% d'atterissage ainsi que la d�viation de l'avion

% Entr�s:
%   amp90: amplitude du signal filtr� � 90 Hz [double]
%   amp150: amplitude du signal filtr� � 150 Hz [double]
%
% Sortie:
%   ddm: signal d'�cart entre les deux ondes porteuses [double]
%   deviation: deviation de l'avion [string]

    % [LLR5]
    ddm = (amp150 - amp90)/(amp150 + amp90); % difference des pourcentage d'amplitude
    ddm = round(ddm,3,'significant');        % 3 chiffres significatifs
    ddm = single(ddm);                       % format single 32 bit; 
    deviation = calculateDeviation(ddm);
    
    % [LLR7]
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
        
        % [LLR6]
        if (ddm > -0.0155 && ddm < 0.0155)
            deviation = "centr�"; % 90Hz = 150Hz : L'avion est sur l'axe d'approche
        elseif (ddm < -0.0155)
            deviation = "gauche"; % 90Hz > 150Hz: L'avion est � gauche de l'axe d'approche
        else
            deviation = "droite"; % 90Hz < 150Hz: L'avion est � droite de l'axe d'approche
        end
end


