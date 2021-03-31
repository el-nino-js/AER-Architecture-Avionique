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
%  DATE DE CRÉATION : 27 MARS 2021. MODIFIE 31 MARS 2021              *
%**********************************************************************

clear all;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Génére un fichier de donnée data.mat
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