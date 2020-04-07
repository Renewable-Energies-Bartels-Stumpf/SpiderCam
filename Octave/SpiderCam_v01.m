clear all;
clc
close all;

xA=10
yA=0
zA=100

xB=95
yB=80
zB=100

xC=0
yC=95
zC=100

x=31
y=42
z=100

xn=54
yn=70
zn=100

delta_x=abs(x-xn)
delta_y=abs(y-yn)
delta_z=abs(z-zn)

laenge=100

for i=1:laenge
  
  clf

  line([xA,xB],[yA,yB])       #Ecke zu Ecke
  line([xB,xC],[yB,yC])
  line([xC,xA],[yC,yA])

  line([xA,x+(delta_x/laenge)*i],[yA,y+(delta_y/laenge)*i])
  line([xB,x+(delta_x/laenge)*i],[yB,y+(delta_y/laenge)*i])
  line([xC,x+(delta_x/laenge)*i],[yC,y+(delta_y/laenge)*i])

  line([xA,xn],[yA,yn])       #Zielvektoren
  line([xB,xn],[yB,yn])
  line([xC,xn],[yC,yn])

  pause(0.001)
  
end

