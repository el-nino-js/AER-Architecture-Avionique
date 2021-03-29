function [flag] = interfaceFlag(h90, h150)
%% interfaceFlag.m
% Calcul un drapeau de validite en v�rifiant qu'aucune erreur
% n'a �t� retourn� dans toutes les interface

% Entr�s:
%   h90: indice de modulation du signal filtre 90 Hz [double]
%   h150: indice de modulation du signal filtre 150 Hz [double]
%
% Sortie:
%   flag : Drapeau de validation. Presence d'erreur lorsque vrai [bool]

    % Un sommation > 0.40 peut etre cause par plusieurs problenes
    %   - Aucune fr�quence radio d�tect�e  
    %   - Les fr�quences 150Hz et 90Hz sont manquantes  
    %   - La profondeur de modulation<70% de la valeur nominale  
    %   - Perte de sensibilit�  
    %   - Erreur BIT (Built-in test) 
    sum = h90 + h150;
    if (sum < 0.40)
        flag = false;
    else
        flag = true; 
    end
    
    % sauvegarde flag dans un format ascii sur fichier 'flag.txt'
    f = int2str(int8(flag));
    fid = fopen('flag.txt','wt');
    fprintf(fid, f);
    fclose(fid);
end


