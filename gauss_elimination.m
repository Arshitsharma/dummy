clc
n=input("enter order of matrix:");
a=[1 0 1 1 ;-1 1 2 1 ;2 1 0 0 ];

for j=1:n
    for i=1:n
        if i>j
            xmulti=a(i,j)/a(j,j);
            for k=1:n+1
               a(i,k)=a(i,k)-xmulti*a(j,k);
            end
        end
    end
end
disp(a);

x(n)=a(n,n+1)/a(n,n);
for i=n-1:-1:1
    sum =0;
    for j=i+1:n
        sum=sum+a(i,j)*x(j);
    end
    x(i)=(a(i,n+1)-sum)/a(i,i);
end
disp(x);