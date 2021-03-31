function signal = interfaceInput()
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
    
    %Production d'un graphique de l'échantillon
    fs = 1500;       % Fréquence d'échantillonnage de 1500Hz
    freqMod = 30;    % Fréquence du modèle à 30Hz
    t = 0:1/fs:(1/freqMod-1/fs); % Temps d'échantillonnage augmenté
    
    plot (t, data);
    title('Signal reçu échantillonné à 1500 Hz et exécuter à 30Hz ');
    xlabel('Temps')
    ylabel('Amplitude')

    % Augmentation de la taille de l'échantillon de 30Hz envoyé en réplicant le signal 20 fois 
    % On réduit ainsi l'imprécision 
    for i = 1:20
        signal(50*(i-1)+1:50*i) = data;  
    end
    
end

