clear all
close all
clc

I = imread('a1.jpg');

Igray = rgb2gray(I);

Iinvert = 255-Igray;

Ibw = im2bw(Iinvert,50/255);
figure,imshow(Ibw),title('Ibw');

Iopen = bwareaopen(Ibw,200);
figure,imshow(Iopen),title('Iopen');

L = bwlabel(Iopen);
S = regionprops(Iopen, 'all');
BOX1 = S(17).BoundingBox ;
BOX2 = S(60).BoundingBox ;
BOX3 = S(72).BoundingBox ;
% for i=1:size(S,1)
%     figure(7)
%     imshow(S(i).Image);
%     title([num2str(i),':',num2str(S(i).Area)]);
%     
%     
%     figure(8)
%     II = L==i;
%     imshow(II);
%     
% %     if s(i).Area > 8000
% %         BW2(L==i) = 0;
% %     end
%     
%     waitforbuttonpress
%  end

 x1 = BOX1(1,1);%0.500000000000000;
 y1 = BOX1(1,2);%1139.50000000000;

 x2 = BOX2(1,1);%192.500000000000;
 y2 = BOX2(1,2);%1100.50000000000 ;
 
 x3 = BOX3(1,1);%252.500000000000;
 y3 = BOX3(1,2);%1096.50000000000;
 
 D = x3-x2;
 
 hold on
plot(x1,y1,'r+','Linewidth',2); 
plot(x2,y2,'r+','Linewidth',2); 
plot(x3,y3,'r+','Linewidth',2); 

% x4 = BOX1(1,2);
% y4 = BOX2(1,1);
%p2 = BOX3(1,1):BOX3(1,2);
plot(1139.50000000000,192.500000000000,'r+','Linewidth',2); 

