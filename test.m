
n = 10;#input("enter n- steps from time_0  to time_1  : ");
h=(1-0)/n; 
F_x = @(a,b,c) 10*(b-a);
F_y = @(a,b,c) a*(28-c)-b;
F_z = @(a,b,c) a*b-(8/3)*c; 

for j = 1:10000
x(1) = normrnd (1,1,1);
y(1) = normrnd (1,1,1);
z(1) = normrnd (1,1,1);

for i=1:n                              
    k_1 = h*(F_x(x(i),y(i),z(i)));
    l_1 = h*(F_y(x(i),y(i),z(i)));
    m_1 = h*(F_z(x(i),y(i),z(i))); 
    
    k_2 = h*(F_x(x(i)+0.5*k_1,y(i)+0.5*h*l_1,z(i)+0.5*h*m_1));
    l_2 = h*(F_y(x(i)+0.5*k_1,y(i)+0.5*h*l_1,z(i)+0.5*h*m_1)); 
    m_2 = h*(F_z(x(i)+0.5*k_1,y(i)+0.5*h*l_1,z(i)+0.5*h*m_1));
    
    k_3 = h*(F_x(x(i)+0.5*k_2,y(i)+0.5*h*l_2,z(i)+0.5*h*m_2));
    l_3 = h*(F_y(x(i)+0.5*k_2,y(i)+0.5*h*l_2,z(i)+0.5*h*m_2));    
    m_3 = h*(F_z(x(i)+0.5*k_2,y(i)+0.5*h*l_2,z(i)+0.5*h*m_2));    

    k_4 = h*(F_x((x(i)+k_3),(y(i)+l_3),(z(i)+m_3)));
    l_4 = h*(F_y((x(i)+k_3),(y(i)+l_3),(z(i)+m_3)));
    m_4 = h*(F_z((x(i)+k_3),(y(i)+l_3),(z(i)+m_3)));
    
    x(i+1) = x(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*h;
    y(i+1) = y(i) + (1/6)*(l_1+2*l_2+2*l_3+l_4)*h;
    z(i+1) = z(i) + (1/6)*(m_1+2*m_2+2*m_3+m_4)*h;
    
end


x1(j,1:11)=x;
y1(j,1:11)=y;
z1(j,1:11)=z;

end
for i=1:(n+1)
  M_x(i) =mean(x1(:,i));  
  S_x(i) =std(x1(:,i));
  M_y(i) =mean(y1(:,i));
  S_y(i) =std(x1(:,i));  
  M_z(i) =mean(z1(:,i));
  S_z(i) =std(x1(:,i)); 
  x_y= [x1(:,i) y1(:,i)];
  z_x= [z1(:,i) x1(:,i)];
  y_z= [y1(:,i) z1(:,i)];
  
  figure (i)
  subplot (2,2,1)
  hist3 (x_y)
  subplot (2,2,2)
  hist3 (y_z)
  subplot (2,2,3)
  hist3 (z_x)
end
M_x
M_y
M_z
S_x
S_y
S_z
