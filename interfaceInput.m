function data = interfaceInput()
%% interfaceInput.m 
% Retourne le signal re�u representant 
% 50 �chantillons de 30Hz �chantillon�s � 1500Hz
%
% Sortie:
%   data: signal recu [single array 1x51]
    filename = "data.mat";
    % [LLR1]
    if exist(filename, 'file')
         % Fichier data.mat existe.
         data = importdata("data.mat");

         % Fichier doit etre un tableau de cinquante valeurs d�cimales de simple pr�cision (32 bits).
         if (isa(data, "single") && ~isequal(size(data), [51 1]))
            plot(data);
         end
    else
         data = zeros([51,x]); % signal vide renvoye
    end
    
    % Production d'un graphique de l'�chantillon 
    % [LLR2]
    fs = 1500;       % Fr�quence d'�chantillonnage de 1500Hz
    freqMod = 30;    % Fr�quence du mod�le � 30Hz
    t = 0:1/fs:(1/freqMod-1/fs); % Temps d'�chantillonnage augment�
    
    plot (t, data);
    title('Signal re�u �chantillonn� � 1500 Hz et ex�cuter � 30Hz ');
    xlabel('Temps')
    ylabel('Amplitude')
end

