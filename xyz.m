fs = 1500; t = 0:1/fs:1/30;
 
x = sin(2*pi*90'.*t)+ sin(2*pi*150'.*t)+ sin(2*pi*1090'.*t);
array = [];

plot(t,x);

save('data.mat','x');
data = importdata("data.mat");
 data1 = single(data);
 save('data.mat','data1');