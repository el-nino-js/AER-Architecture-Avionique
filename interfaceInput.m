function data = interfaceInput()
%% interfaceInput.m
% Retourne le signal reçu representant 
% 50 échantillons de 30Hz échantillonés à 1500Hz 
%
% Sortie:
%   data: signal recu [single array 1x51]
    if isfile("data.mat")
         % Fichier data.mat existe.
         data = importdata("data.mat");

         % Fichier doit etre un tableau de cinquante valeurs décimales de simple précision (32 bits).
         if (isa(data, "single") && ~isequal(size(data), [51 1]))
            plot(data);
         end
    else
         data = zeros([51,x]); % signal vide renvoye
    end

end

