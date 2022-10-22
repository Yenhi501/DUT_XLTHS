%% Đồ thị
%Dung de ve do thi dang song ste, zcr
function wake = DoThi(s,Fs,Fd)
%wake la ma tran nang luong moi voi gia tri cua moi mau la gia tri
% nang luong cua frame chua mau do
% fs la tan so lay mau
% fd la do dai cua frame
nS = floor(Fd * Fs); %so luong phan tu moi khung
wake = 0; %khoi tao khung
for i = 1 : length(s)
    Position = length(wake); %luu vi tri hien tai cua mwake
    wake(Position : Position + nS) = s(i); %cap du lieu cho khung o vi tri hien tai
end