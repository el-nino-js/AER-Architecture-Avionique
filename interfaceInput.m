function data = interfaceInput()
%% interfaceInput.m
% Retourne le signal re�u representant 
% 50 �chantillons de 30Hz �chantillon�s � 1500Hz 
%
% Sortie:
%   data: signal recu [single array 1x51]
    if isfile("data.mat")
         % Fichier data.mat existe.
         data = importdata("data.mat");

         % Fichier doit etre un tableau de cinquante valeurs d�cimales de simple pr�cision (32 bits).
         if (isa(data, "single") && ~isequal(size(data), [51 1]))
            plot(data);
         end
    else
         data = zeros([51,x]); % signal vide renvoye
    end

end

