%Simplex method
clc
clear all
cost=[2 1 0 0 0 0];
 a=[1 2 1 0 0;1 1 0 1 0;1 -1 0 0 1];
 b=[10;6;2];
A=[a b];
 Var={'x1','x2','s1','s2','s3','sol'}
 bv=[3 4 5]; % position of s1, s2, s3
zjcj=cost(bv)*A-cost;               
% Display initial simplex table
simplex_table=[A; zjcj]
array2table(simplex_table,'VariableNames',Var)
RUN=true;
 while RUN
if any(zjcj(1:end-1)<0) % check for negative valueoptamility condition
 fprintf(' The current BFS is not optimal \n');
 zc=zjcj(1:end-1);
 [Enter_val, pvt_col]= min(zc) ; %array 
 if all(A(:,pvt_col)<=0)
  error('LPP is Unbounded');
 else
 sol=A(:,end);
 column=A(:,pvt_col);
  for i=1:size(A,1)
 if column(i)>0   % pivot column value positive
 ratio(i)= sol (i)./column(i);
 else
 ratio(i)=inf;
 end
  end 
  [leaving_value,pvt_row]=min(ratio);
 end
 bv(pvt_row)=pvt_col;    % replaced leaving variable with entering variable
 pvt_key=A(pvt_row, pvt_col);
 A(pvt_row,:)=A (pvt_row,:)./pvt_key;
 % row operation 
for i=1:size(A,1)
 if i~=pvt_row
 A(i,:)=A(i,:)-A (i, pvt_col).*A(pvt_row,:);
 end
end
 zjcj=cost(bv)*A-cost;
 next_table=[zjcj; A];
array2table(next_table,'VariableNames',Var)

else
    RUN=false;
    
    fprintf('The final optimal value is % f \n',zjcj(end));
end
 end
%%%%%%%%%%%%%%%%%%%%%%



clc
clear all
% a: supply
% b: demand
% c: cost matrix
%c=[3 11 4 14 15;6 16 18 2 28;10 13 15 19 17;7 12 5 8 9];
% c=[2 3 11 7;1 0 6 1;5 8 15 9];
%  c=[2 10 4 5; 6 12 8 11;3 9 5 7];
c=[6 4 1 5;8 9 2 7;4 3 6 4]
a=[14 16 5];
b=[6 10 15 4];
m=size(c,1);
n=size(c,2);
% a=[15 25 10 15];
% b=[20 10 15 15 5];
% a=[6 1 10];
% b=[7 5 3 2];
% a=[12 25 20];
% b=[25 10 15 5];
z=0;
if sum(a)==sum(b)
    fprintf('Given transportation problem is Balanced \n');
else
     fprintf('Given transportation problem is Unbalanced \n');
     if sum(a)<sum(b)
         c(end+1,:)=zeros(1,length(b))
         a(end+1)=sum(b)-sum(a)
     else
         c(:,end+1)=zeros(length(a),1)
         b(end+1)=sum(a)-sum(b)
     end
end
X=zeros(m,n)
InitialC=c
   for i=1:size(c,1)
       for j=1:size(c,2)
    cpq=min(c(:))
    if cpq==Inf
    break
       end
[p1,q1]=find(cpq==c)
a(p1)
b(q1)
xpq=min(a(p1),b(q1))
X(p1,q1)
[X(p1,q1),ind]=max(xpq)
p=p1(ind)
q=q1(ind)
X(p,q)=min(a(p),b(q))
if min(a(p),b(q))==a(p)
b(q)=b(q)-a(p)
a(p)=a(p)-X(p,q)
c(p,:)=Inf
else
    a(p)=a(p)-b(q)
    b(q)=b(q)-X(p,q)
    c(:,q)=Inf
end
       end
   end
for i=1:size(c,1)
    for j=1:size(c,2)
z=z+InitialC(i,j)*X(i,j)
    end
end
%fprintf('Initial BFS \n')
array2table(X)
fprintf('Transportation cost is %f \n',z);