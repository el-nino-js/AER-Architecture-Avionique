%**********************************************************************
% NOM : AER8721.m                                                     *
%**********************************************************************
% FONCTION : CE PROGRAMME LIT UN FICHIER *.CSV ET TRACE DES           *
%            GRAPHIQUES 2D et 3D. SI LE FICHIER *.CSV CONTIENT LA     *
%            POSITION DE L'AVION, LE PROGRAMME TRACE :                *
%                   - LA NAV LAT�RALE DU VOL (2D)                     *
%                   - LA NAV VERTICALE DU VOL (2D)                    *
%                   - LA NAV COMPL�TE (3D)                            *
%**********************************************************************
% FICHIER *.CSV REQUIS DANS LE M�ME DOSSIER                           *
%**********************************************************************
%  AUTEUR : Nuno Silva-Pinto                                              *
%**********************************************************************
%  DATE DE CR�ATION : 17 MARS 2021. MODIFIE 31 OCT 2018               *
%**********************************************************************

clear all;
clc;






uv = interfaceInput();
marge = 0.2;
y = interfaceFiltre150Hz(uv,marge);
z = interfaceFiltre90Hz(uv,marge);
u = interfaceDDM(y,z);
disp(u);
