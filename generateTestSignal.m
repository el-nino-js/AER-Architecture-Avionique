% Génére un fichier de donnée data.mat
% Ne pas remettre !
% source: https://www.mathworks.com/help/signal/gs/waveform-generation-time-vectors-and-sinusoids-1.html

clear all;
clc;
freq = 30; 
fs = 1500;
t = 0:1/fs:1/freq;

% ex: signal combiné de 95Hz, 146Hz et 1100Hz
x = sin(2*pi*95'.*t) + sin(2*pi*146'.*t)  + sin(2*pi*1110'.*t)  ;
array = [];

plot(t,x);

save('data.mat','x');
data = importdata("data.mat");

% transforme le tableau en single
data1 = single(data);
save('data.mat','data1');