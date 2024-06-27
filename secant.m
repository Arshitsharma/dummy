clc
f=@(x) -4*x+cos(x)+2;
x0=0;
x1=0.8;
e=0.000001;
n=5;
for i=1:n
    x2=x1-((x1-x0)/(f(x1)-f(x0)))*f(x1);
    if abs(x2-x1)<e
        break;
    end
    x0=x1;
    x1=x2;
end

fprintf('the root is approx: %f\n',x2);
fprintf('no of iteration:%f\n',i);