%% Tính STE
%Tinh enegry ngan han cua tin hieu ( Short_Term Energy)
function [ste]= STE(frames)
    [nF,nS]= size(frames); %khoi tao ham nang luong ngan han
    for i = 1:nF
        ste(i)= sum(frames(i,:).^2);
    end
   ste = ste ./ abs(max(ste));
end