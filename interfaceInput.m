function data = interfaceInput()
%% interfaceInput.m 
% Retourne le signal reçu representant 
% 50 échantillons de 30Hz échantillonés à 1500Hz
%
% Sortie:
%   data: signal recu [single array 1x51]
    filename = "data.mat";
    % [LLR1]
    if exist(filename, 'file')
         % Fichier data.mat existe.
         data = importdata("data.mat");

         % Fichier doit etre un tableau de cinquante valeurs décimales de simple précision (32 bits).
         if (isa(data, "single") && ~isequal(size(data), [51 1]))
            plot(data);
         end
    else
         data = zeros([51,x]); % signal vide renvoye
    end
    
    % Production d'un graphique de l'échantillon 
    % [LLR2]
    fs = 1500;       % Fréquence d'échantillonnage de 1500Hz
    freqMod = 30;    % Fréquence du modèle à 30Hz
    t = 0:1/fs:(1/freqMod-1/fs); % Temps d'échantillonnage augmenté
    
    plot (t, data);
    title('Signal reçu échantillonné à 1500 Hz et exécuter à 30Hz ');
    xlabel('Temps')
    ylabel('Amplitude')
end

