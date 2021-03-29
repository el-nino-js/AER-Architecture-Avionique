%**********************************************************************
% NOM : ilsDecoder.m                                                  *
% VERSION: A                                                          *
%**********************************************************************
% FONCTION : CE PROGRAMME LIT LE FICHIER data.mat �TANT UN �CHANTILLON*
%            DE 50 POINTS D'UN SIGNAL MODUL� DE 1500HZ � UNE FR�QUENCE*
%            DE 30HZ. LE SIGNAL PASSE PAR UN D�CODEUR ILS ET RETOURNE *
%            EN SORTIE TROIS FICHIERS *.txt CONTENANT:                          *
%             1) ddm.txt: LA DDM (DIFFERENTIAL DEPTH OF MODULATION)   *
%             2) deviation.txt: LA D�VIATION DE L'AVION               *
%             3) flag: LE DRAPEAU DE VALIDIT�                         *
%**********************************************************************
% FICHIER data.mat REQUIS DANS LE M�ME DOSSIER                        *
%**********************************************************************
%  AUTEUR : Nuno Silva-Pinto                                          *
%  REVU PAR: *ENTRER NOM*                                             *  
%**********************************************************************
%  DATE DE CR�ATION : 27 MARS 2021. MODIFIE 28 OCT 2018               *
%**********************************************************************

clear all;
clc;

% transforme le tableau en single
data = interfaceInput();
h90 = interfaceFiltre90Hz(data);
h150 = interfaceFiltre150Hz(data);
[deviation,ddm] = interfaceDDM(h90, h150);
flag = interfaceFlag(h90, h150);

disp("ddm: " + ddm);
disp("deviation: " + deviation);
disp("flag: " + flag);