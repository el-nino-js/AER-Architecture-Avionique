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

clear;
clc;

disp('ICD');

u = load("data3.mat");
x = u.children;


fs = 1500;t = 0:1/fs:1;

x = sin(2*pi*30'.*t) + randn(size(t))/1000;
plot(x);

marge = 0.2;
y = interfaceFiltre150Hz(u,marge);
z = interfaceFiltre90Hz(u,marge);
u = interfaceDDM(y,z);
disp(u);
