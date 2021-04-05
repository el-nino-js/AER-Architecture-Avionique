%% ilsDecoder.m  (Version C)                                                      
% Ce programme lit le fichier data.mat �tant un �chantillon
% de 50 points d'un signal modul� de 1500Hz � une fr�quence 
% de 30Hz. Le signal passe par un d�codeur ILS et retourne 
% en sortie trois fichiers *.txt contenant: 
%
% #            ddm.txt: La DDM (Differential Depth of Modulation)   
% #            deviation.txt: La d�viation de l'avion               
% #            flag: Le drapeau de validit�
%
% Un fichier data.mat est requis dans le m�me dossier.
%
% Auteur : Nuno Silva-Pinto.      
% Revu par: El Mahdi Erriq.
%
% Date de cr�ation: 27 mars 2021. 
% Modifi� le: 4 avril 2021.

%% Clear all previous commands
clear all;
clc;

%% Interface d'entr�e
signal = interfaceInput();

%% Interface du filtre 90Hz et 150Hz
amp90 = interfaceFiltre90Hz(signal);
amp150 = interfaceFiltre150Hz(signal);

%% Interface DDM
[deviation,ddm] = interfaceDDM(amp90, amp150);

%% Interface du drapeau de validit�
flag = interfaceFlag(amp90, amp150);

%% Affichage
disp("ddm: " + ddm);
dispDeviation = strcat("deviation: ",deviation);
disp(dispDeviation);
disp("flag: " + flag);