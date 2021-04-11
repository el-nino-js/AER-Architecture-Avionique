function [flag] = interfaceFlag(amp90, amp150)
%% interfaceFlag.m
% Valide un drapeau de validité en vérifiant qu'aucune erreur
% n'a été retourné. Un drapeau positif indique
% la présence d'erreur

% Entrés:
%   amp90: amplitude du signal filtré à 90 Hz [double]
%   amp150: amplitude du signal filtré à 150 Hz [double]
%
% Sortie:
%   flag : Drapeau de validation. Presence d'erreur lorsque vrai [bool]

    % Un sommation < 0.40 peut etre cause par plusieurs problenes
    %   - Aucune fréquence radio détectée  
    %   - Les fréquences 150Hz et 90Hz sont manquantes  
    %   - La profondeur de modulation<70% de la valeur nominale  
    %   - Perte de sensibilité  
    %   - Erreur BIT (Built-in test)
    
    % [LLR8]
    sum = amp150 + amp90; % somme des differences de pourcentage d'amplitude
    if (sum >= 0.4000)
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


