function [errorInput, data] = interfaceInput()
%% interfaceInput.m
% Retourne le signal re�u representant 
% 50 �chantillons de 30Hz �chantillon�s � 1500Hz 
%
% Sortie:
%   errorInput: indique la presence d'une erreur d'input lorsque vrai (bool)
%   data: signal recu [single array 1x51]
errorInput = true;
if isfile("data.mat")
     % Fichier existe.
     data = importdata("data.mat");
     
     % Fichier est un tableau de cinquante valeurs d�cimales de simple pr�cision (32 bits).
     if (isa(data, "single") && ~isequal(size(data), [51 1]))
        plot(data);
        errorInput = true;
     end
else
     data = zeros([51,x]); % signal vide renvoye
end

end

