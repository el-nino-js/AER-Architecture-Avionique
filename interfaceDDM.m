function [deviation,ddm] = interfaceDDM(amp90, amp150)
%% interfaceDDM.m
% Calcul la différence de profondeur de modulation (ddm) de deux signaux
% modulés de 90Hz et 150Hz localisées sur la ligne médiane d'une piste
% d'atterissage ainsi que la déviation de l'avion

% Entrés:
%   amp90: amplitude du signal filtré à 90 Hz [double]
%   amp150: amplitude du signal filtré à 150 Hz [double]
%
% Sortie:
%   ddm: signal d'écart entre les deux ondes porteuses [double]
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
        % Entrés:
        %   ddm: difference de profondeur de modulation [double]
        %
        % Sortie:
        %   deviation: deviation de l'avion [string]
        
        % [LLR6]
        if (ddm > -0.0155 && ddm < 0.0155)
            deviation = "centré"; % 90Hz = 150Hz : L'avion est sur l'axe d'approche
        elseif (ddm < -0.0155)
            deviation = "gauche"; % 90Hz > 150Hz: L'avion est à gauche de l'axe d'approche
        else
            deviation = "droite"; % 90Hz < 150Hz: L'avion est à droite de l'axe d'approche
        end
end


