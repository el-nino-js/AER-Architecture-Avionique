function c = xyz()
%% interfaceDDM.m
% Calcul la diff�rence de profondeur de modulation (ddm) de deux signals
% modul�s de 90Hz et 150Hz localis�es sur la ligne m�diane d'une piste
% d'atterissage ainsi que la deviation de l'avion

% Entr�s:
%   amplitude90Hz: signal modul�e � 90 Hz
%   [double]
%   amplitude150Hz: signal modul�e � 150 Hz [double] 
%
% Sortie:
%   ddm: signal d'�cart entre les deux ondes porteuses [double]
%   deviation: deviation de l'avion [string]
    
    t = (0:0.000667:1)';
    y = sin(2*pi*30*t);

    plot(t(1:500),y(1:500))
    c=0;
end

