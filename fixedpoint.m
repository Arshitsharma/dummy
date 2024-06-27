clc
g=input("enter function");
x0=input("enter initial guess");
e=input("enter the tolerence");
n=input("no of iterations");

for i=1:n
    x1=g(x0);
    if abs(x1-x0)<e
        break
    end
    x0=x1;
end

