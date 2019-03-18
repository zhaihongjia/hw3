clear;clc;
[Im,MAP]=imread('citywall.bmp');
MAP(end:255,:)=0; 
figure(1);
imshow(Im,MAP);
title('citywall原始图像');
% imwrite(Im,MAP,'./hw/hw3/result/citywall原始图像.bmp');
figure(2)
imhist(Im,MAP);
GP=zeros(1,256);  %原图灰度概率密度函数
IM=ind2gray(Im,MAP); 
[m,n]=size(IM); 
for k=0:255               %计算原图各灰度级像素个数num 
GP(k+1)=length(find(IM==k))/(m*n);
end                       %绘制原图直方图 
bar(0:255,GP);
axis([0 256 0 0.05]);  
title('citywall原始图像直方图');  
xlabel('灰度值');
ylabel('像素的概率密度');
figure(3);
J=histeq(Im);
imshow(J,MAP);
title('citywall直方图均衡结果');
% imwrite(J,MAP,'citywall直方图均衡结果.bmp');
figure(4);
GP=zeros(1,256);  %原图灰度概率密度函数
IM=ind2gray(J,MAP); 
[m,n]=size(IM); 
for k=0:255               %计算原图各灰度级像素个数num 
GP(k+1)=length(find(IM==k))/(m*n);
end                       %绘制原图直方图 
bar(0:255,GP);
axis([0 256 0 0.05]);  
title('citywall均衡化后的直方图');  
xlabel('灰度值');
ylabel('像素的概率密度');
