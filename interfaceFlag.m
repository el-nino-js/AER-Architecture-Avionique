function [flag] = interfaceFlag(amp90, amp150)
%% interfaceFlag.m
% Valide un drapeau de validit� en v�rifiant qu'aucune erreur
% n'a �t� retourn�. Un drapeau positif indique
% la pr�sence d'erreur

% Entr�s:
%   amp90: amplitude du signal filtr� � 90 Hz [double]
%   amp150: amplitude du signal filtr� � 150 Hz [double]
%
% Sortie:
%   flag : Drapeau de validation. Presence d'erreur lorsque vrai [bool]

    % Un sommation < 0.40 peut etre cause par plusieurs problenes
    %   - Aucune fr�quence radio d�tect�e  
    %   - Les fr�quences 150Hz et 90Hz sont manquantes  
    %   - La profondeur de modulation<70% de la valeur nominale  
    %   - Perte de sensibilit�  
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


