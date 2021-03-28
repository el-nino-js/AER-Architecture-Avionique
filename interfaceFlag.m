function [flag] = interfaceFlag(errorInput, errorFilter90Hz, errorFilter150Hz, errorDdm)
%% interfaceFlag.m
% Calcul un drapeau de validite en vérifiant qu'aucune erreur
% n'a été retourné dans toutes les interface

% Entrés:
%   errorInput: Indique s'il y a présence d'erreur dans l'interface Input [bool]
%   errorFilter90Hz: Indique s'il y a présence d'erreur dans l'interface de filtrage 90Hz [bool]
%   errorFilter150Hz: Indique s'il y a présence d'erreur dans l'interface de filtrage 150Hz [bool]
%   errorDdm: Indique s'il y a présence d'erreur dans l'interface du calcul DDM [bool]
%
% Sortie:
%   flag : Drapeau de validation. Valide lorsque vrai [bool]
    disp(errorInput);
    disp(errorFilter90Hz);
    disp(errorDdm);
    sum = errorInput + errorFilter90Hz + errorFilter150Hz + errorDdm;
    if (sum == 0)
        flag = true;
    else
        flag = false; 
    
    end
    disp(flag);
end
