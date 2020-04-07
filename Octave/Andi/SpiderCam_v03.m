clear all;
clc
close all;

triangle      = 30
laenge        = 1                                                                                                   
x             = 1                                                   
y             = 2
z             = 3
a             = [ 50,  0,100]                                       
b             = [100,100,100]
c             = [  0,100,100]
ende          = 2*pi*10                                             
p             = 1:ende

#Richtungsvektoren dreieck
r1        = [c(x)-a(x),c(y)-a(y),c(z)-a(z)]                     
r2        = [b(x)-a(x),b(y)-a(y),b(z)-a(z)]
#Länge Richtungsvektoren
betrag_r1 = sqrt(r1(x)^2+r1(y)^2+r1(z)^2)                       
betrag_r2 = sqrt(r1(x)^2+r1(y)^2+r1(z)^2)
#Normrichtungsvektoren
rn1       = [r1(x)/betrag_r1,r1(y)/betrag_r1,r1(z)/betrag_r1]   
rn2       = [r2(x)/betrag_r2,r2(y)/betrag_r2,r2(z)/betrag_r2]          
#Richtungsvektor mit Dreieckseitenlänge
R1        = [rn1(x)*triangle,rn1(y)*triangle,rn1(z)*triangle]   
R2        = [rn2(x)*triangle,rn2(y)*triangle,rn2(z)*triangle]                 

#Bewegungskoordinaten errechnen und ablegen
for i=1:ende 
   p(i,x)     = 15*cos(i/10)+35                                     
   p(i,y)     = 15*sin(i/10)+40
   p(i,z)     = i
end

#Rechnen und ablegen   
for i=1:length(p)-1  
  
  delta_x     = p(i+1,x)-p(i,x)                                     #animationshilfen
  delta_y     = p(i+1,y)-p(i,y)
  delta_z     = p(i+1,z)-p(i,z)
  
  for k=1:laenge   
    anteil_x  = (delta_x/laenge)*k
    anteil_y  = (delta_y/laenge)*k
    anteil_z  = (delta_z/laenge)*k

    line_x1(1,i)=p(i,x)+anteil_x
    line_x1(2,i)=p(i,x)+anteil_x
    line_x1(3,i)=p(i,x)+R1(x)+anteil_x
    line_x1(4,i)=a(x)
    line_x1(5,i)=b(x)
    line_x1(6,i)=c(x)
    
    line_x2(1,i)=p(i,x)+R1(x)+anteil_x
    line_x2(2,i)=p(i,x)+R2(x)+anteil_x
    line_x2(3,i)=p(i,x)+R2(x)+anteil_x
    line_x2(4,i)=p(i,x)+anteil_x
    line_x2(5,i)=R2(x)+p(i,x)+anteil_x
    line_x2(6,i)=R1(x)+p(i,x)+anteil_x
    
    line_y1(1,i)=p(i,y)+anteil_y
    line_y1(2,i)=p(i,y)+anteil_y
    line_y1(3,i)=p(i,y)+R1(y)+anteil_y
    line_y1(4,i)=a(y)
    line_y1(5,i)=b(y)
    line_y1(6,i)=c(y)
    
    line_y2(1,i)=p(i,y)+R1(y)+anteil_y
    line_y2(2,i)=p(i,y)+R2(y)+anteil_y
    line_y2(3,i)=p(i,y)+R2(y)+anteil_y
    line_y2(4,i)=p(i,y)+anteil_y
    line_y2(5,i)=R2(y)+p(i,y)+anteil_y
    line_y2(6,i)=R1(y)+p(i,y)+anteil_y
    
    line_z1(1,i)=p(i,z)+anteil_z
    line_z1(2,i)=p(i,z)+anteil_z
    line_z1(3,i)=p(i,z)+anteil_z
    line_z1(4,i)=a(z)+anteil_z
    line_z1(5,i)=b(z)+anteil_z
    line_z1(6,i)=c(z)+anteil_z
    
    line_z2(1,i)=p(i,z)+anteil_z
    line_z2(2,i)=p(i,z)+anteil_z
    line_z2(3,i)=p(i,z)+anteil_z
    line_z2(4,i)=p(i,z)+anteil_z
    line_z2(5,i)=p(i,z)+anteil_z
    line_z2(6,i)=p(i,z)+anteil_z   
  end       
end

#Zeichnen
for i=1:length(p)-1
  clf 
  
  line([a(x),b(x)],[a(y),b(y)],[a(z),b(z)])
  line([b(x),c(x)],[b(y),c(y)],[b(z),c(z)])
  line([a(x),c(x)],[a(y),c(y)],[a(z),c(z)])
  
  for j=1:6
    line([line_x1(j,i),line_x2(j,i)],[line_y1(j,i),line_y2(j,i)],[line_z1(j,i),line_z2(j,i)])
  end
  
  for k=1:i
    line([p(k,x),p(k+1,x)],[p(k,y),p(k+1,y)],[p(k,z),p(k+1,z)])
  end
 
  view(-10,30);  
  grid on;
  rotate3d on;
  axis([0 100 0 100 0 100]);
  
  pause(0.001);                       
end