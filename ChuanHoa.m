%% Chuẩn hóa
%Dung ham chuan hoa dua ve day co gia tri nam trong khoang [-1;1]
function normalisa = ChuanHoa(f,T)
    for i = 1 : length(f)
        if(f(i) >=T) 
            % day tu 0 -> 1
            normalisa(i) = (f(i)-T)/(max(f)-T);
        else
            % day tu -1 -> 0
            normalisa(i) = (f(i)-T)/(T-min(f));
        end
    end
end

