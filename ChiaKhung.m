%% Chia khung
function [frames] = ChiaKhung(Data,Fs,Fd) 
% data = bien do tin hieu goc
% fd = do dai thoi gian cua moi khung (s)
% fs = tan so lay mau
    N = length(Data);
    nS = round(Fd * Fs); %So phan tu(mau) tren moi khung
    nF= floor( N ./ nS); % (So luong frame)
    frames = zeros(nF,nS); % Tao khung (So khung, So mau)
    sample = 0;
    for n = 1 : nF
        frames(n,:) = Data(sample+1:sample+nS); %1->N,N+1->2N,2N+1->3N
        sample = sample+nS;
    end
end