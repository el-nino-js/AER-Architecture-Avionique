function [deviation,ddm] = interfaceDDM(h90, h150)
%% interfaceDDM.m
% Calcul la diff�rence de profondeur de modulation (ddm) de deux signals
% modul�s de 90Hz et 150Hz localis�es sur la ligne m�diane d'une piste
% d'atterissage ainsi que la deviation de l'avion

% Entr�s:
%   h90: indice de modulation du signal filtre 90 Hz [double]
%   h150: indice de modulation du signal filtre 150 Hz [double]
%
% Sortie:
%   ddm: signal d'�cart entre les deux ondes porteuses [double]
%   deviation: deviation de l'avion [string]
    disp(h90);
    disp(h150);
    ddm = h90 - h150;
    ddm = round(ddm,3,'significant'); % 3 chiffres significatifs
    ddm = single(ddm); % format single 32 bit;
    
    deviation = calculateDeviation(ddm);
    
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


