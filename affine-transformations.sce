clc;
close;
clear;
I=rgb2gray(imread(fullpath(getIPCVpath()+"/image/puffin.png")));
[m,n] = size(I);
for i = 1:m
    for j = 1:n
        J(2*i,2*j)=I(i,j);
        J1(i*1,2*j)=I(i,j);
        J2(2*i,1*j)=I(i,j);
        p = i*cos(%pi/2)+j*sin(%pi/2);
        q = -i*sin(%pi/2)+j*cos(%pi/2);
        p = ceil(abs(p)+0.0001);
        q = ceil(abs(q)+0.0001);
        K(p,q)=I(i,j);
        //shear transformation y direction
        u=i+0.2*j;
        v=j;
        L(u,v)=I(i,j);
        //shear transformation x direction
        u =i;
        v=0.2*i+j;
        M(u,v)=I(i,j);
    end
end
figure(1); title('original image');
imshow(I);
figure(2); title('Scaled image width=height=2');
imshow(J);
figure(3); title('Scaled image column width=2');
imshow(J1);
figure(4); title('Scaled image rows height=2');
imshow(J2);
figure(5); title('Rotated image');
imshow(K);
//translation for x=20
mat = [ 1 0 0;
0 1 0;
0 20 1];
S3 = imtransform(I,mat,'affine');
figure(7);
title('Translation for x =20');
imshow(S3);
//translation for x=y=20
mat = [1 0 0;...
0 1 0;...
20 20 1];
S4=imtransform(I,mat,'affine');
figure(8);
title('Translation for y=x=20');
imshow(S4);
figure(9);
title('shear transformation x direction');
imshow(L);
figure(10);
title('shear transformation y direction');
imshow(M);
mat = [ 1 0 0;
0 1 0;
20 0 1];
S5 = imtransform(I,mat,'affine');
figure(11);
title('Translation for y =20');
imshow(S5);
