% DGL-Funktion
function x_dot = ep_dgl(t,x)
  % params
  g   = 9.81;
  l_0 = 1;
  l_1 = 0.1;
  l_2 = 1;
  m   = 0.1;
  J_szz     = 1/3*m*l_1^2; %not sure
  rho_luft  = 1.01325;
  A     = 0.05^2;
  c_w   = 1.2;
  k_S1  = 1/2*A*rho_luft*c_w;
 
  
  % empty vector for storage
  x_dot = zeros(2,1);
  
  % translation of state space coordinates
  x_1 = x(1);
  x_2 = x(2);
  x_3 = x(3);
  x_4 = x(4);
  
  % evaluate derivatives
  x_dot(1) = x_3;
  x_dot(2) = x_4;
  x_dot(3) = ((l_0*l_1^3*m^2+4*J_szz*l_0*l_1*m)*sin(x_2)*x_4^2+sin(x_2-x_1)^2*((2*k_S1*l_0*l_1^3*m*cos(x_2)-4*J_szz*k_S1*l_1^2)*x_4-2*k_S1*l_0*l_1^3*m*cos(x_2)*x_3+4*J_szz*k_S1*l_1^2*x_3)+cos(x_2-x_1)^2*((2*k_S1*l_0*l_1^3*m*cos(x_2)-4*J_szz*k_S1*l_1^2)*x_4-2*k_S1*l_0*l_1^3*m*cos(x_2)*x_3+4*J_szz*k_S1*l_1^2*x_3)+sin(x_2-x_1)*((2*k_S1*l_0*l_1^3*m+8*J_szz*k_S1*l_0*l_1)*sin(x_1)*x_4+4*k_S1*l_0^2*l_1^2*m*sin(x_1)*cos(x_2)*x_3+(-2*k_S1*l_0*l_1^3*m-16*J_szz*k_S1*l_0*l_1)*sin(x_1)*x_3)+cos(x_2-x_1)*((-2*k_S1*l_0*l_1^3*m-8*J_szz*k_S1*l_0*l_1)*cos(x_1)*x_4+cos(x_2)*(2*g*l_0*l_1^2*m^2-4*k_S1*l_0^2*l_1^2*m*cos(x_1)*x_3)+(2*k_S1*l_0*l_1^3*m+16*J_szz*k_S1*l_0*l_1)*cos(x_1)*x_3-4*J_szz*g*l_1*m)+(-2*l_0*l_1^3*m^2-8*J_szz*l_0*l_1*m)*sin(x_2)*x_3*x_4+sin(x_2)*(2*l_0^2*l_1^2*m^2*cos(x_2)*x_3^2+l_0*l_1^3*m^2*x_3^2)+((4*k_S1*l_0^2*l_1^2*m+16*J_szz*k_S1*l_0^2)*sin(x_1)^2+(4*k_S1*l_0^2*l_1^2*m+16*J_szz*k_S1*l_0^2)*cos(x_1)^2)*x_3+(-2*g*l_0*l_1^2*m^2-8*J_szz*g*l_0*m)*cos(x_1))/(2*l_0^2*l_1^2*m^2*cos(x_2)^2-8*J_szz*l_0*l_1*m*cos(x_2)-2*l_0^2*l_1^2*m^2+(-2*J_szz*l_1^2-8*J_szz*l_0^2)*m);
  x_dot(4) = ((2*l_0^2*l_1^2*m*cos(x_2)+l_0*l_1^3*m)*sin(x_2)*x_4^2+sin(x_2-x_1)*((4*k_S1*l_0^2*l_1^2*sin(x_1)*cos(x_2)+2*k_S1*l_0*l_1^3*sin(x_1))*x_4+(8*k_S1*l_0^3*l_1-2*k_S1*l_0*l_1^3)*sin(x_1)*x_3)+cos(x_2-x_1)*((-4*k_S1*l_0^2*l_1^2*cos(x_1)*cos(x_2)-2*k_S1*l_0*l_1^3*cos(x_1))*x_4+(2*k_S1*l_0*l_1^3-8*k_S1*l_0^3*l_1)*cos(x_1)*x_3+2*g*l_0*l_1^2*m*cos(x_2)+4*g*l_0^2*l_1*m)+sin(x_2-x_1)^2*((2*k_S1*l_0*l_1^3*cos(x_2)+4*k_S1*l_0^2*l_1^2)*x_4-2*k_S1*l_0*l_1^3*cos(x_2)*x_3-4*k_S1*l_0^2*l_1^2*x_3)+cos(x_2-x_1)^2*((2*k_S1*l_0*l_1^3*cos(x_2)+4*k_S1*l_0^2*l_1^2)*x_4-2*k_S1*l_0*l_1^3*cos(x_2)*x_3-4*k_S1*l_0^2*l_1^2*x_3)+sin(x_2)*(-4*l_0^2*l_1^2*m*cos(x_2)*x_3-2*l_0*l_1^3*m*x_3)*x_4+sin(x_2)*(4*l_0^2*l_1^2*m*cos(x_2)*x_3^2+(l_0*l_1^3+4*l_0^3*l_1)*m*x_3^2)+cos(x_2)*((8*k_S1*l_0^3*l_1*sin(x_1)^2+8*k_S1*l_0^3*l_1*cos(x_1)^2)*x_3-4*g*l_0^2*l_1*m*cos(x_1))+(4*k_S1*l_0^2*l_1^2*sin(x_1)^2+4*k_S1*l_0^2*l_1^2*cos(x_1)^2)*x_3-2*g*l_0*l_1^2*m*cos(x_1))/(2*l_0^2*l_1^2*m*cos(x_2)^2-8*J_szz*l_0*l_1*cos(x_2)-2*l_0^2*l_1^2*m-2*J_szz*l_1^2-8*J_szz*l_0^2);
endfunction



