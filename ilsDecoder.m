%% ilsDecoder.m  (Version C)                                                      
% Ce programme lit le fichier data.mat étant un échantillon
% de 50 points d'un signal modulé de 1500Hz à une fréquence 
% de 30Hz. Le signal passe par un décodeur ILS et retourne 
% en sortie trois fichiers *.txt contenant: 
%
% #            ddm.txt: La DDM (Differential Depth of Modulation)   
% #            deviation.txt: La déviation de l'avion               
% #            flag: Le drapeau de validité
%
% Un fichier data.mat est requis dans le même dossier.
%
% Auteur : Nuno Silva-Pinto.      
% Revu par: El Mahdi Erriq.
%
% Date de création: 27 mars 2021. 
% Modifié le: 4 avril 2021.

%% Clear all previous commands
clear all;
clc;

%% Interface d'entrée
signal = interfaceInput();

%% Interface du filtre 90Hz et 150Hz
amp90 = interfaceFiltre90Hz(signal);
amp150 = interfaceFiltre150Hz(signal);

%% Interface DDM
[deviation,ddm] = interfaceDDM(amp90, amp150);

%% Interface du drapeau de validité
flag = interfaceFlag(amp90, amp150);

%% Affichage
disp("ddm: " + ddm);
dispDeviation = strcat("deviation: ",deviation);
disp(dispDeviation);
disp("flag: " + flag);