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

disp('ICD')

[n,p] = interfaceDDM(22,53);

fs = 1e3;t = 0:1/fs:1;
x = [2 1 2]*sin(2*pi*[50 150 250]'.*t) + randn(size(t))/10;


marge = 0.1;

z = interfaceFiltre90Hz(x,marge);
[y,r] = interfaceDDM(2,3);

