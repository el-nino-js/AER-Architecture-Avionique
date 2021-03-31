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
%  DATE DE CR�ATION : 27 MARS 2021. MODIFIE 31 MARS 2021              *
%**********************************************************************

clear all;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% G�n�re un fichier de donn�e data.mat
% Ne pas remettre !
% source: https://www.mathworks.com/help/signal/gs/waveform-generation-time-vectors-and-sinusoids-1.html

clear all;
clc;

[signal, m] = interfaceInput();
amp90 = interfaceFiltre90Hz(signal);
amp150 = interfaceFiltre150Hz(signal);
[deviation,ddm] = interfaceDDM(amp90, amp150);
flag = interfaceFlag(amp90, amp150, m);

disp("ddm: " + ddm);
disp("deviation: " + deviation);
disp("flag: " + flag);