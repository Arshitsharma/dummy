clc
f=@(x)2^x-5*x+2;
df=@(x)log(2)*2^x-5;

x0=0;
e=0.0001;
n=10;
if df(x0)~=0
for i=1:n
    x1=x0-(f(x0)/df(x0));
    if abs(x1-x0)<e
        break;
    end
    if df(x1)==0
        disp("new ralph failed as derviatve is zero")
    end
    x0=x1;
end
else
    disp("no root exist as intial guess in zero");
end

fprintf("root:%f\n",x1);
fprintf("iteration:%f\n",i);
