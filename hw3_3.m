clear;clc;
[IM,MAP]=imread('lena1.bmp');%选定要处理的图像名称 
MAP(end:255,:)=0; 
I=ind2gray(IM,MAP); 
[IM2,MAP2]=imread('lena.bmp');%选定要匹配的直方图 
I2=ind2gray(IM2,MAP2); 
hsp=imhist(I2,256);
g=histeq(I,hsp);
figure;
subplot(1,2,1);
imshow(IM,MAP);
% imwrite(IM,MAP,'./result/lena1原图.bmp');
title('lena3.bmp原图');
subplot(1,2,2);
imshow(g,MAP2);
% imwrite(g,MAP2,'./result/lena1直方图匹配增强后的图像.bmp');
title('直方图匹配增强后的图像');
figure;
subplot(3,1,1);
imhist(I,MAP); 
axis([0 256 0 100000]);
title('原图lena3.bmp的直方图');
subplot(3,1,2);
imhist(I2,MAP2);
axis([0 256 0 100000]);
% title(strcat('./result/匹配图lena.bmp的直方图'));
subplot(3,1,3);
imhist(g,MAP);
axis([0 256 0 100000]);
title('增强后图像直方图');