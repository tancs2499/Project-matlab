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
BOX4 = S(18).BoundingBox ;
BOX5 = S(47).BoundingBox ;
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
 
 x4 = BOX2(1,1);
 y4 = BOX1(1,2);
 
 x5 = BOX2(1,1):BOX3(1,1);
 y5 = BOX1(1,2);
 
 x6 = BOX4(1,1);
 y6 = BOX4(1,2);
 
 x7 = x1;
 y7 = y1:y6;
 
 x8 = BOX5(1,1);
 y8 = BOX5(1,2);
 hold on
p1 = plot(x1,y1,'r+','Linewidth',2); % plot �ش��� 17
p2 = plot(x2,y2,'r+','Linewidth',2); % plot �ش��� 60
p3 = plot(x3,y3,'r+','Linewidth',2); % plot �ش��� 72
p4 = plot(x4,y4,'r+','Linewidth',2); % plot �ش�������㹡�èѴ
p5 = plot(x5,y5,'r-','Linewidth',2);% plot �ش 60-72
p6 = plot(x6,y6,'r+','Linewidth',2);% plot �ش��� 18
p7 = plot(x7,y7,'r-','Linewidth',2);% plot �ش��� 17-18

x = 60;
IABWcrop = Iopen(y1:y8,x2:x3+180);
figure,imshow(IABWcrop),title('IABWcrop');
 

for i=0:29
      for j = 0:3
        W = IABWcrop(1+(42*i):42*(i+1), 58*j+1 : 58*j + 58 );
        figure(4)
        subplot(30,4,i*4+j+1 );
        imshow(W),title('W');
        count1 = sum(sum(W));       
        if count1 > 350
            answer = 1;           
        else
            answer = 0;
        end
         
        title(['white pixel =',num2str(count1),' answer=',num2str(answer)]);
        
      end
 end