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
p1 = plot(x1,y1,'r+','Linewidth',2); % plot จุดที่ 17
p2 = plot(x2,y2,'r+','Linewidth',2); % plot จุดที่ 60
p3 = plot(x3,y3,'r+','Linewidth',2); % plot จุดที่ 72
p4 = plot(x4,y4,'r+','Linewidth',2); % plot จุดเริ่มต้นในการจัด
p5 = plot(x5,y5,'r-','Linewidth',2);% plot จุด 60-72
p6 = plot(x6,y6,'r+','Linewidth',2);% plot จุดที่ 18
p7 = plot(x7,y7,'r-','Linewidth',2);% plot จุดที่ 17-18

x = p5*4;
IABWcrop = Iopen(y1:y8,x2:x3+x);
figure,imshow(IABWcrop),title('IABWcrop');
 
 scor  = zeros(30,4);
 answer = zeros(30,4);

slindx=0;
i2=0;
for i=0:29
    i2=i2+1;
      for j = 0:3
        slindx = slindx+1;   
        W = IABWcrop(1+(42*i):42*(i+1), 58*j+1 : 58*j + 58 );
        figure(4)
        subplot(30,4,i*4+j+1 );
        imshow(W);%,title('W');
        count1 = sum(sum(W));       
        if count1(i2,slindx) > 700
            answer(i,j) = 1; 
            
        else
            answer(i,j) = 0;
           
        end
         scor(i,j) = answer(i,j);
        %title(['white pixel = ',num2str(count1),' answer=',num2str(answer)]);
        title(['chackpoint = ',num2str(scor(i,j))]);
      end
      slindx=0;
end



I2 = imread('a2.jpg');

Igray2 = rgb2gray(I2);

Iinvert2 = 255-Igray2;

Ibw2 = im2bw(Iinvert2,50/255);
figure,imshow(Ibw2),title('Ibw2');

Iopen2 = bwareaopen(Ibw2,200);
figure,imshow(Iopen2),title('Iopen2');

L2 = bwlabel(Iopen2);
S2 = regionprops(Iopen2, 'all');
BOX12 = S2(17).BoundingBox ;
BOX22 = S2(60).BoundingBox ;
BOX32 = S2(72).BoundingBox ;
BOX42 = S2(18).BoundingBox ;
BOX52 = S2(47).BoundingBox ;

 x12 = BOX12(1,1);%0.500000000000000;
 y12 = BOX12(1,2);%1139.50000000000;

 x22 = BOX22(1,1);%192.500000000000;
 y22 = BOX22(1,2);%1100.50000000000 ;
 
 x32 = BOX32(1,1);%252.500000000000;
 y32 = BOX32(1,2);%1096.50000000000;
 
 x42 = BOX22(1,1);
 y42 = BOX12(1,2);
 
 x52 = BOX22(1,1):BOX3(1,1);
 y52 = BOX12(1,2);
 
 x62 = BOX42(1,1);
 y62 = BOX42(1,2);
 
 x72 = x12;
 y72 = y12:y62;
 
 x82 = BOX52(1,1);
 y82 = BOX52(1,2);
 hold on
p12 = plot(x12,y12,'r+','Linewidth',2); % plot จุดที่ 17
p22 = plot(x22,y22,'r+','Linewidth',2); % plot จุดที่ 60
p32 = plot(x32,y32,'r+','Linewidth',2); % plot จุดที่ 72
p42 = plot(x42,y42,'r+','Linewidth',2); % plot จุดเริ่มต้นในการจัด
p52 = plot(x52,y52,'r-','Linewidth',2);% plot จุด 60-72
p62 = plot(x62,y62,'r+','Linewidth',2);% plot จุดที่ 18
p72 = plot(x72,y72,'r-','Linewidth',2);% plot จุดที่ 17-18

%x2 = p52*4;
IABWcrop2 = Iopen2(y12:y82,x22:x32+180);
figure,imshow(IABWcrop2),title('IABWcrop');
 
scor2  = zeros(30,4);
answer2 = zeros(30,4);

slindx2=0;
i3=0;

for i=0:29
    i3=i3+1;
    
      for j = 0:3
         slindx2 = slindx2+1;
        W = IABWcrop2(1+(42*i):42*(i+1), 58*j+1 : 58*j + 58 );
        figure(4)
        subplot(30,4,i*4+j+1 );
        imshow(W);%,title('W');
        count2 = sum(sum(W));       
        if count2() > 700
            answer2(i,j) = 1; 
            
        else
            answer2(i,j) = 0;
         
        end
         scor2(i,j) = answer2(i,j);
        %title(['white pixel = ',num2str(count1),' answer=',num2str(answer)]);
        title(['chackpoint2 = ',num2str(scor2(i,j))]);
      end
      slindx=0;
end
               
point = 0;
for i=1:30
    %for j = 1:4
        compar = chackpoint(m,n) == chackpoint2(mm,nn);
      if compar
          point = point+1;
      end
    %end
    figure(8),%imshow(W)
    title(['point = ',num2str(point)]);   
end




