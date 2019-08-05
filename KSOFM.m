close all;
clear all;
clc;

%Input patterns
x=[0 0 1 1; 1 0 0 0; 0 1 1 0; 0 0 0 1];

%Initializing alpha
alpha=0.5

%Initializing weights randomly between 0 to 1
%w= rand(4,2)
w=[.2 .9; .4 .7; .6 .5; .8 .3];

%Initialzing iteration counter 
iteration =1;
while iteration <=1
    %STEP 1: Computation of euclidean distance
    %'i' represents number of input patterns
    for i=1:4
        %'j' represents number of clusters
        for j=1:2
        D(j)=0;
            for k=1:4
                D(j) = D(j) + ( w(k,j) - x(i,k) )^2;
            end
        end
        %STEP 2: Computation of minimum distance
        for j=1:2
            if D(j)==min(D)
                %'J' represents the winning cluster
                J=j;
            end;
        end;
            %STEP 3: Weight updation on the winning cluster
            w(:,J)=w(:,J) + alpha * (x(i,:)' -w(:,J))
    end; 
   %updating the learning rate
   alpha = 0.5 * alpha;
   iteration = iteration +1;
   
 end;
    

% Grouping
for i=1:4
    d(i,1)=sum((x(i,:)'-w(:,1)).^2);
    d(i,2)=sum((x(i,:)'-w(:,2)).^2);
    if d(i,1) < d(i,2)==1
    cluster(i,1)=1;
    else
        cluster(i,1)=2;
    end
end;
   disp(d)
   disp(cluster)

    