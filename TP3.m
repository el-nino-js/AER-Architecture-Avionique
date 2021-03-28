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
% FICHIER data.mat REQUIS DANS LE M�ME DOSSIER                           *
%**********************************************************************
%  AUTEUR : Nuno Silva-Pinto                                              *
%**********************************************************************
%  DATE DE CR�ATION : 17 MARS 2021. MODIFIE 31 OCT 2018               *
%**********************************************************************

clear all;
clc;

[errorInput, data] = interfaceInput();
[errorFilter90Hz, signal90Hz] = interfaceFiltre90Hz(data);
[errorFilter150Hz, signal150Hz] = interfaceFiltre150Hz(data);
[errorDdm,deviation,ddm] = interfaceDDM(signal90Hz, signal150Hz);
flag = interfaceFlag(errorInput, errorFilter90Hz, errorFilter150Hz,errorDdm);
