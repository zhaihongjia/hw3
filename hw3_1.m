clear;clc;
img_name='woman2.bmp';
[Im,MAP]=imread(img_name);
MAP(end:255,:)=0; 
figure(1);imshow(Im,MAP);title('原始图像');
figure(2);imhist(Im,MAP);
axis([0 255 0 5000]); 
title('woman2直方图（调用imhist函数）');

%自己编写的求取图像直方图的程序
GP=zeros(1,256);  %原图灰度概率密度函数
IM=ind2gray(Im,MAP); 
[m,n]=size(IM); 
for k=0:255               %计算原图各灰度级像素个数num 
GP(k+1)=length(find(IM==k))/(m*n);
end                       %绘制原图直方图 
figure(3);
bar(0:255,GP);
axis([0 256 0 0.02]);  
title('woman2直方图（自己编写）');xlabel('灰度值');ylabel('像素的概率密度')