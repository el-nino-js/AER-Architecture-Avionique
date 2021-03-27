%**********************************************************************
% NOM : AER8721.m                                                     *
%**********************************************************************
% FONCTION : CE PROGRAMME LIT UN FICHIER *.CSV ET TRACE DES           *
%            GRAPHIQUES 2D et 3D. SI LE FICHIER *.CSV CONTIENT LA     *
%            POSITION DE L'AVION, LE PROGRAMME TRACE :                *
%                   - LA NAV LATÉRALE DU VOL (2D)                     *
%                   - LA NAV VERTICALE DU VOL (2D)                    *
%                   - LA NAV COMPLÈTE (3D)                            *
%**********************************************************************
% FICHIER *.CSV REQUIS DANS LE MÊME DOSSIER                           *
%**********************************************************************
%  AUTEUR : Nuno Silva-Pinto                                              *
%**********************************************************************
%  DATE DE CRÉATION : 17 MARS 2021. MODIFIE 31 OCT 2018               *
%**********************************************************************

clear all;
clc;

disp('ICD');


uv = importdata("data5.mat");



fs = 1500; t = 0:1/fs:1/30;
 
x = 0.2*sin(2*pi*90'.*t)+ 0.2*sin(2*pi*150'.*t)+ 0.2*sin(2*pi*1090'.*t);
array = [];

plot(t,x);

save('data5.mat','x');


marge = 0.2;
y = interfaceFiltre150Hz(x,marge);
z = interfaceFiltre90Hz(x,marge);
u = interfaceDDM(y,z);
disp(u);
