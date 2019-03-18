clear;clc;
A=imread('lena.bmp');
figure(1);imshow(A);
title('原始图像');
n=7;
M(1:n,1:n)=1;
A1=wextend('2D','sym',A,n);
A2=double(A1);
[row,col]=size(A1);
A3=A2;
for i=n+1:row-n
    for j=n+1:col-n 
        M1=A2(i:i+(n-1),j:j+(n-1)).*M(1:n,1:n);
        M2=histeq(uint8(M1));
        A4=double(M2);
        A3(i,j)=A4(4,4);
    end
end

A5=A3(n+1:row-n,n+1:col-n);
A5=uint8(A5);
figure(2);imshow(A5);
title('均衡后的图像');