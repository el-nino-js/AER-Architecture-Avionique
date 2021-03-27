function c = xyz()
%% interfaceDDM.m
% Calcul la différence de profondeur de modulation (ddm) de deux signals
% modulés de 90Hz et 150Hz localisées sur la ligne médiane d'une piste
% d'atterissage ainsi que la deviation de l'avion

% Entrés:
%   amplitude90Hz: signal modulée à 90 Hz
%   [double]
%   amplitude150Hz: signal modulée à 150 Hz [double] 
%
% Sortie:
%   ddm: signal d'écart entre les deux ondes porteuses [double]
%   deviation: deviation de l'avion [string]
    
    t = (0:0.000667:1)';
    y = sin(2*pi*30*t);

    plot(t(1:500),y(1:500))
    c=0;
end

