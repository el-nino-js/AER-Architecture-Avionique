%**********************************************************************
% NOM : ilsDecoder.m                                                  *
% VERSION: A                                                          *
%**********************************************************************
% FONCTION : CE PROGRAMME LIT LE FICHIER data.mat ÉTANT UN ÉCHANTILLON*
%            DE 50 POINTS D'UN SIGNAL MODULÉ DE 1500HZ À UNE FRÉQUENCE*
%            DE 30HZ. LE SIGNAL PASSE PAR UN DÉCODEUR ILS ET RETOURNE *
%            EN SORTIE TROIS FICHIERS *.txt CONTENANT:                          *
%             1) ddm.txt: LA DDM (DIFFERENTIAL DEPTH OF MODULATION)   *
%             2) deviation.txt: LA DÉVIATION DE L'AVION               *
%             3) flag: LE DRAPEAU DE VALIDITÉ                         *
%**********************************************************************
% FICHIER data.mat REQUIS DANS LE MÊME DOSSIER                        *
%**********************************************************************
%  AUTEUR : Nuno Silva-Pinto                                          *
%  REVU PAR: *ENTRER NOM*                                             *  
%**********************************************************************
%  DATE DE CRÉATION : 27 MARS 2021. MODIFIE 28 OCT 2018               *
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