clear all;
clc
close all;
#seitenlänge dreieck
triangle      = 30                                                  
#anzahl animationsschritte
laenge        = 1                                                   
#Priorität der Koordinaten
x             = 1                                                   
y             = 2
z             = 3
#Eckendefinition
a             = [  0,  0,100]                                       
b             = [100,  0,100]
c             = [ 50,100,100]
#Kreisbewegung definieren
ende          = 2*pi*10                                             
p             = 1:ende
#Kreiskoordinaten errechnen und ablegen
for i=1:ende   
   p(i,x)     = 15*cos(i/10)+50                                     
   p(i,y)     = 15*sin(i/10)+40
   p(i,z)     = i
end
#Richtungsvektoren dreieck
r1            = [c(x)-a(x),c(y)-a(y),c(z)-a(z)]                     
r2            = [b(x)-a(x),b(y)-a(y),b(z)-a(z)]
#Länge Richtungsvektoren
betrag_r1     = sqrt(r1(x)^2+r1(y)^2+r1(z)^2)                       
betrag_r2     = sqrt(r1(x)^2+r1(y)^2+r1(z)^2)
#Normrichtungsvektoren
rn1           = [r1(x)/betrag_r1,r1(y)/betrag_r1,r1(z)/betrag_r1]   
rn2           = [r2(x)/betrag_r2,r2(y)/betrag_r2,r2(z)/betrag_r2]          
#Richtungsvektor mit Dreieckseitenlänge
R1            = [rn1(x)*triangle,rn1(y)*triangle,rn1(z)*triangle]   
R2            = [rn2(x)*triangle,rn2(y)*triangle,rn2(z)*triangle]




          
for i=1:length(p)
  
  achsenschnitt = (c(y)-c(x)*(c(y)-a(y)/c(x)-a(x)))
  y1            = (c(y)-a(y)/c(x)-a(x))*p(i,x)
  y2            = (c(y)-b(y)/c(x)-b(x))*p(i,x) + achsenschnitt

  if(p(i,x)<=c(x)&&p(i,y)<=y1||p(i,x)>c(x)&&p(i,y)<=y2)
    #Achsendifferenz
    delta_x     = p(i+1,x)-p(i,x)                                     
    delta_y     = p(i+1,y)-p(i,y)
    delta_z     = p(i+1,z)-p(i,z)
    for k=1:laenge
      clf
      #Ecken
      line([a(x), b(x)        ],[a(y),  b(y)        ],[a(z),  b(z)        ])
      line([      b(x), c(x)  ],[       b(y), c(y)  ],[       b(z), c(z)  ])
      line([a(x),       c(x)  ],[a(y),        c(y)  ],[a(z),        c(z)  ])
      anteil_x  = (delta_x/laenge)*k
      anteil_y  = (delta_y/laenge)*k
      anteil_z  = (delta_z/laenge)*k
      #Plattform
      line([    p(i,x)+         anteil_x  , p(i,x)+ R1(x)+  anteil_x]
          ,[    p(i,y)+         anteil_y  , p(i,y)+ R1(y)+  anteil_y]
          ,[    p(i,z)+         anteil_z  , p(i,z)+         anteil_z])               
      line([    p(i,x)+         anteil_x  , p(i,x)+ R2(x)+  anteil_x]
          ,[    p(i,y)+         anteil_y  , p(i,y)+ R2(y)+  anteil_y]
          ,[    p(i,z)+         anteil_z  , p(i,z)+         anteil_z])                                                      
      line([    p(i,x)+ R1(x)+  anteil_x  , p(i,x)+ R2(x)+  anteil_x]
          ,[    p(i,y)+ R1(y)+  anteil_y  , p(i,y)+ R2(y)+  anteil_y]
          ,[    p(i,z)+         anteil_z  , p(i,z)+         anteil_z]) 
      #Seile
      line([a(x)                          , p(i,x)+         anteil_x]
          ,[a(y)                          , p(i,y)+         anteil_y]
          ,[a(z)+               anteil_z  , p(i,z)+         anteil_z])                                                   
      line([b(x)                          , p(i,x)+ R2(x)+  anteil_x]
          ,[b(y)                          , p(i,y)+ R2(y)+  anteil_y]
          ,[b(z)+               anteil_z  , p(i,z)+         anteil_z])
      line([c(x)                          , p(i,x)+ R1(x)+  anteil_x]
          ,[c(y)                          , p(i,y)+ R1(y)+  anteil_y]
          ,[c(z)+               anteil_z  , p(i,z)+         anteil_z]) 
      #Diagramm  
      view(-10,30);  
      grid on;
      rotate3d on;
      axis([0 100 0 100 0 100]);
    end
    line([(100/length(p))*i,(100/length(p))*i],[0,0],[0,100])
    pause(0.001);
  elseif
    clf
    line([0,100],[0,100],[0,100])
    line([(100/length(p))*i,(100/length(p))*i],[0,0],[0,100])
    view(-10,30);  
    grid on;
    rotate3d on;
    axis([0 100 0 100 0 100]);
    pause(0.001);
  endif
end                                  