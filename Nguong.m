%% Tìm ngưỡng
% Threshold setting / 36 
% thuat toan tim nguong ( dung thuat toan tim kiem nhi phan nhu trong CS425)
% f và g để biểu thị các giá trị hàm thuộc tính của các trạng thái có giá trị thấp hơn và cao hơn
%Bước 1
function T = Nguong(f,g)

%Bước 2
Tmin = max( min (f),min (g) );   % Thu hep khoang nghiem
Tmax = min( max (f),max (g) );

%Bước 3
T = ( Tmin + Tmax ) /2;

%Bước 4

i = length(find(f < T)); % Số lượng phần tử nhỏ hơn T của f
p = length(find(g > T)); % Số lượng phần tử nhỏ hơn T của g

%Bước 5
j = -1;  % so luong phan tu i cu
q = -1; % so luong phan tu p cu
Nf = length(f); 
Ng = length(g);

%Bước 6
while (i ~= j && p ~= q)
%Bước 7
%Dung thuat toan nhi phan chay de tim nguong T thoa man can bang giua Tmax,Tmin de tim T.
    result = (1/Nf)*sum(f(f-T>0)-T) - (1/Ng)*sum(T-g(T-g>0)) % So sánh tỉ lệ phần tử bí mật với ngưỡng T của f() và g()
    if result > 0 
        Tmin = T;
    else
        Tmax = T;
    end

 %Bước 8
    T = (Tmin+Tmax) /2;

 %Bước 9
    j = i; q = p;

 % Bước 10
    i = sum( f < T);
    p = sum( g > T);
  end
end

