function [flag] = interfaceFlag(amp90, amp150, m)
%% interfaceFlag.m
% Calcul un drapeau de validite en v�rifiant qu'aucune erreur
% n'a �t� retourn� dans toutes les interface. Un drapeau positif indique
% la pr�sence d'erreur

% Entr�s:
%   amp90: amplitude du signal filtr� � 90 Hz [double]
%   amp150: amplitude du signal filtr� � 150 Hz [double]
%   m: signal de validation [double]
%
% Sortie:
%   flag : Drapeau de validation. Presence d'erreur lorsque vrai [bool]

    % Un sommation > 0.40 peut etre cause par plusieurs problenes
    %   - Aucune fr�quence radio d�tect�e  
    %   - Les fr�quences 150Hz et 90Hz sont manquantes  
    %   - La profondeur de modulation<70% de la valeur nominale  
    %   - Perte de sensibilit�  
    %   - Erreur BIT (Built-in test)
    sum = m*((amp150 + amp90)/(amp150 + amp90)); % somme des differences de pourcentage d'amplitude
disp(sum);
    if (sum >= 0.4001)
        flag = true;
    else
        flag = false;
    end
    
    % sauvegarde flag dans un format ascii sur fichier 'flag.txt'
    f = int2str(int8(flag));
    fid = fopen('flag.txt','wt');
    fprintf(fid, f);
    fclose(fid);
end


