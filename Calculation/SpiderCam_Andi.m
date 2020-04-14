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
ende          = 50#2*pi*10                                             
p             = 1:ende
#Kreiskoordinaten errechnen und ablegen
for i=1:ende   
   p(i,x)     = i#15*cos(i/10)+35                                     
   p(i,y)     = 0#15*sin(i/10)+40
   p(i,z)     = 50#i+30#15*sin(i/10)+30
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
  if i<length(p)
    clf
    #Achsendifferenz
    delta_x           = p(i+1,x)-p(i,x)                                     
    delta_y           = p(i+1,y)-p(i,y)
    delta_z           = p(i+1,z)-p(i,z)
    #Längendifferenz    
    laenge_A_vorher   = sqrt((p(i  ,x)-a(x))^2+(p(i  ,y)-a(y))^2+(p(i  ,z)-a(z))^2)
    laenge_A_nachher  = sqrt((p(i+1,x)-a(x))^2+(p(i+1,y)-a(y))^2+(p(i+1,z)-a(z))^2)
    delta_A(i)        = laenge_A_nachher-laenge_A_vorher
    laenge_A(i)       = laenge_A_nachher
    laenge_B_vorher   = sqrt(((p(i  ,x)+R2(x))-b(x))^2+((p(i  ,y)+R2(y))-b(y))^2+((p(i  ,z)+R2(z))-b(z))^2)
    laenge_B_nachher  = sqrt(((p(i+1,x)+R2(x))-b(x))^2+((p(i+1,y)+R2(y))-b(y))^2+((p(i+1,z)+R2(z))-b(z))^2)
    delta_B(i)        = laenge_B_nachher-laenge_B_vorher
    laenge_B(i)       = laenge_B_nachher
    laenge_C_vorher   = sqrt(((p(i  ,x)+R1(x))-c(x))^2+((p(i  ,y)+R1(y))-c(y))^2+((p(i  ,z)+R1(z))-c(z))^2)
    laenge_C_nachher  = sqrt(((p(i+1,x)+R1(x))-c(x))^2+((p(i+1,y)+R1(y))-c(y))^2+((p(i+1,z)+R1(z))-c(z))^2)
    delta_C(i)        = laenge_C_nachher-laenge_C_vorher
    laenge_C(i)       = laenge_C_nachher
  endif
end 

aktuellelaenge_A  = laenge_A(1)
aktuellelaenge_B  = laenge_B(1)
aktuellelaenge_C  = laenge_C(1)

aktuellerpunkt_x  = [1,delta_A(1)]
aktuellerpunkt_y  = [1,delta_B(1)]
aktuellerpunkt_z  = [1,delta_C(1)]

for i=1:length(p)
##  figure(1);
##  achsenschnitt = (c(y)-c(x)*(c(y)-b(y)/c(x)-b(x)))
##  y1            = (c(y)-a(y)/c(x)-a(x))*p(i,x)
##  y2            = (c(y)-b(y)/c(x)-b(x))*p(i,x) + achsenschnitt
##
##  if(p(i,x)<=c(x)&&p(i,y)<=y1||p(i,x)>c(x)&&p(i,y)<=y2)
##    #Achsendifferenz
##    delta_x     = p(i+1,x)-p(i,x)                                     
##    delta_y     = p(i+1,y)-p(i,y)
##    delta_z     = p(i+1,z)-p(i,z)
##    for k=1:laenge
##      clf
##      #Ecken
##      line([a(x), b(x)        ],[a(y),  b(y)        ],[a(z),  b(z)        ]
##            , "linestyle", "-", "color", "k")
##      line([      b(x), c(x)  ],[       b(y), c(y)  ],[       b(z), c(z)  ]
##            , "linestyle", "-", "color", "k")
##      line([a(x),       c(x)  ],[a(y),        c(y)  ],[a(z),        c(z)  ]
##            , "linestyle", "-", "color", "k")
##      anteil_x  = (delta_x/laenge)*k
##      anteil_y  = (delta_y/laenge)*k
##      anteil_z  = (delta_z/laenge)*k
##      #Plattform
##      line([    p(i,x)+         anteil_x  , p(i,x)+ R1(x)+  anteil_x]
##          ,[    p(i,y)+         anteil_y  , p(i,y)+ R1(y)+  anteil_y]
##          ,[    p(i,z)+         anteil_z  , p(i,z)+         anteil_z]
##          , "linestyle", "-", "color", "k")               
##      line([    p(i,x)+         anteil_x  , p(i,x)+ R2(x)+  anteil_x]
##          ,[    p(i,y)+         anteil_y  , p(i,y)+ R2(y)+  anteil_y]
##          ,[    p(i,z)+         anteil_z  , p(i,z)+         anteil_z]
##          , "linestyle", "-", "color", "k")                                                      
##      line([    p(i,x)+ R1(x)+  anteil_x  , p(i,x)+ R2(x)+  anteil_x]
##          ,[    p(i,y)+ R1(y)+  anteil_y  , p(i,y)+ R2(y)+  anteil_y]
##          ,[    p(i,z)+         anteil_z  , p(i,z)+         anteil_z]
##          , "linestyle", "-", "color", "k") 
##      line([p(i,x)+anteil_x ,p(i,x)+anteil_x],[0                ,p(i,y)+anteil_y],[p(i,z)+anteil_z  ,p(i,z)+anteil_z]
##          , "linestyle", "--", "color", "r")   
##      line([0               ,p(i,x)+anteil_x],[p(i,y)+anteil_y  ,p(i,y)+anteil_y],[p(i,z)+anteil_z  ,p(i,z)+anteil_z]
##          , "linestyle", "--", "color", "g")
##      line([p(i,x)+anteil_x ,p(i,x)+anteil_x],[p(i,y)+anteil_y  ,p(i,y)+anteil_y],[0                ,p(i,z)+anteil_z]
##          , "linestyle", "--", "color", "b")
##      #Seile
##      line([a(x)                          , p(i,x)+         anteil_x]
##          ,[a(y)                          , p(i,y)+         anteil_y]
##          ,[a(z)+               anteil_z  , p(i,z)+         anteil_z]
##          , "linestyle", "-", "color", "r")                                                   
##      line([b(x)                          , p(i,x)+ R2(x)+  anteil_x]
##          ,[b(y)                          , p(i,y)+ R2(y)+  anteil_y]
##          ,[b(z)+               anteil_z  , p(i,z)+         anteil_z]
##          , "linestyle", "-", "color", "g")
##      line([c(x)                          , p(i,x)+ R1(x)+  anteil_x]
##          ,[c(y)                          , p(i,y)+ R1(y)+  anteil_y]
##          ,[c(z)+               anteil_z  , p(i,z)+         anteil_z]
##          , "linestyle", "-", "color", "b") 
##      #Diagramm  
##      view(-10,30);  
##      grid on;
##      rotate3d on;
##      axis([0 100 0 100 0 100]);
##    end
##    line([(100/length(p))*i,(100/length(p))*i],[0,0],[0,100])
##    pause(0.001);
##  elseif
##    clf
##    line([0,100],[0,100],[0,100])
##    line([(100/length(p))*i,(100/length(p))*i],[0,0],[0,100])
##    view(-10,30);  
##    grid on;
##    rotate3d on;
##    axis([0 100 0 100 0 100]);
##    pause(0.001);
##  endif
  
  figure(2);
  factor1=30 
  factor2=0.1
  #aktuelle Position       
  line([i,i+1],[p(i,x),p(i+1,x)], "linestyle", "--", "color", "r")
  line([i,i+1],[p(i,y),p(i+1,y)], "linestyle", "--", "color", "g")
  line([i,i+1],[p(i,z),p(i+1,z)], "linestyle", "--", "color", "b")
  figure(1);
  #Längenänderung
  line([aktuellerpunkt_x(x),i],[aktuellerpunkt_x(y)*factor1,delta_A(i)*factor1], "linestyle", "-", "color", "r")
  line([aktuellerpunkt_y(x),i],[aktuellerpunkt_y(y)*factor1,delta_B(i)*factor1], "linestyle", "-", "color", "g")
  line([aktuellerpunkt_z(x),i],[aktuellerpunkt_z(y)*factor1,delta_C(i)*factor1], "linestyle", "-", "color", "b")
  h = legend ("delta_A", "delta_B", "delta_C");
  #Nullinie
  line([1,length(p)],[0,0], "linestyle", "-.", "color", "r")
  grid on;
  rotate3d on;
  figure(2);
  #Seillängen
  #line([aktuellelaenge_A,i],[aktuellelaenge_A*factor2,laenge_A(i)*factor2], "linestyle", "-", "color", "r")
  #line([aktuellelaenge_B,i],[aktuellelaenge_B*factor2,laenge_B(i)*factor2], "linestyle", "-", "color", "g")
  #line([aktuellelaenge_C,i],[aktuellelaenge_C*factor2,laenge_C(i)*factor2], "linestyle", "-", "color", "b")
  
  aktuellerpunkt_x  = [i,delta_A(i)]
  aktuellerpunkt_y  = [i,delta_B(i)]
  aktuellerpunkt_z  = [i,delta_C(i)]
  
  aktuellelaenge_A  = laenge_A(i)
  aktuellelaenge_B  = laenge_B(i)
  aktuellelaenge_C  = laenge_C(i)
  
  h = legend ("x", "y", "z");
  legend (h, "location", "north");
  
  grid on;
  rotate3d on;
  axis([1 length(p) -60 100]);
  pause(0.001);
  
  
end  