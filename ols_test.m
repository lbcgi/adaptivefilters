clc;close all;clear;
hn = [2,4,1,6];
n = 0 : 20;
xn = n.^2-4*n+1;
M = 6;
N = length(hn);
La = length(xn);
L = M + N - 1;
km = floor(La/M);
break_mtx = zeros(km, M);
end_set = zeros(1, La-km*M); 
y_mtx = zeros(km, L);
end_y_set = zeros(1, La-km*M+N-1);
for k = 0 : km
    if (k~=km)
        break_mtx(k+1, :) = xn(1+k*M:(k+1)*M);
        y_mtx(k+1, :) = conv(break_mtx(k+1, :), hn);
    else
        end_set = xn(1+k*M:La);
        end_y_set = conv(end_set, hn);
    end
end
y_final = zeros(1, La+N-1);
y_mtx = [y_mtx;[end_y_set,zeros(1,L-(La-km*M+N-1))]];
for k = 0 : km
    if(k==0)
         y_final(1+k*M:(k+1)*M) = y_mtx(k+1,1:M); 
        y_final((k+1)*M+1:L+k*M) = y_mtx(k+1, M+1:L)+y_mtx(k+2,1:N-1);
    elseif(k~=km)
         y_final(N+k*M:(k+1)*M) = y_mtx(k+1,N:M); 
        y_final((k+1)*M+1:L+k*M) = y_mtx(k+1, M+1:L)+y_mtx(k+2,1:N-1);
    else
        y_final(N+k*M:end) = y_mtx(k+1,N:La-km*M+N-1); 
    end
end
y_test = conv(xn, hn);
CorrectNum = sum(y_final-y_test==0);
if(CorrectNum==length(y_test))  disp('SUCCESSFUL');end
