clear;clc;
I=imread('elain.bmp');
figure(1);
imhist(I);
title('elain的直方图');
figure(2);
subplot(1,2,1);
imshow(I);
title('elain原始图像');
t1 =80;      %从直方图的峰谷处得阈值；
[m,n]=size(I);
I1=zeros(m,n); 
for i=1:m     
    for j=1:n    
        if I(i,j)>t1        
            I1(i,j)=1;     
        else
            I1(i,j)=0;   
        end
    end
end
subplot(1,2,2);
imshow(I1);
title('分割后的elain.bmp');