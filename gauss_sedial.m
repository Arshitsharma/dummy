clc;
a=[10 -1 2 0;-1 11 -1 3;2 -1 10 -1;0 3 -1 8];
b=[6;25;-11;15];
x0=[0;0;0;0];
x=[0;0;0;0];
n=size(a,1);
k=1;
while k<=100
for i=1:n
 sum=0;
 sum1=0;
 for j=1:i-1
 sum=sum+a(i,j)*x(j);
 end
 for j=i+1:n
 sum1=sum1+a(i,j)*x0(j);
 end
 x(i)=(1/a(i,i))*(b(i)-sum-sum1);
end
if abs(x-x0)<0.0001
 break;
end
x0=x;
k=k+1;
end
disp(x);
