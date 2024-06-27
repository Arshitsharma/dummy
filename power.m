clc
x0=[1;-1;2];
A=[2 1 1;1 2 1;1 1 2];
tol=10^-3;
N=1000;
y=A*x0;
 m1=max(abs(y));
i=0;
while i<=N
i=i+1; 
 x=(1/m1).*y;
 y=A*x;
 m2=max(abs(y));
 if abs(m2-m1)<tol
 fprintf(' max eigenvalue =%f',m2);
 break;
 end
 m1=m2;
end
disp(x);