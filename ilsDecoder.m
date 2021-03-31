%**********************************************************************
% NOM : ilsDecoder.m                                                  *
% VERSION: B                                                          *
%**********************************************************************
% FONCTION : CE PROGRAMME LIT LE FICHIER data.mat ÉTANT UN ÉCHANTILLON*
%            DE 50 POINTS D'UN SIGNAL MODULÉ DE 1500HZ À UNE FRÉQUENCE*
%            DE 30HZ. LE SIGNAL PASSE PAR UN DÉCODEUR ILS ET RETOURNE *
%            EN SORTIE TROIS FICHIERS *.txt CONTENANT:                *
%             1) ddm.txt: LA DDM (DIFFERENTIAL DEPTH OF MODULATION)   *
%             2) deviation.txt: LA DÉVIATION DE L'AVION               *
%             3) flag: LE DRAPEAU DE VALIDITÉ                         *
%**********************************************************************
% FICHIER data.mat REQUIS DANS LE MÊME DOSSIER                        *
%**********************************************************************
%  AUTEUR : NUNO SILVA-PINTO                                          *
%  REVU PAR: EL MAHDI ERRIQ                                           *  
%**********************************************************************
%  DATE DE CRÉATION : 27 MARS 2021. MODIFIE 31 MARS 2021              *
%**********************************************************************

clear all;
clc;

signal = interfaceInput();
amp90 = interfaceFiltre90Hz(signal);
amp150 = interfaceFiltre150Hz(signal);
[deviation,ddm] = interfaceDDM(amp90, amp150);
flag = interfaceFlag(amp90, amp150);

disp("ddm: " + ddm);
disp("deviation: " + deviation);
disp("flag: " + flag);