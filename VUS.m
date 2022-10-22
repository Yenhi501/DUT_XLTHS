%Phan biet v va uv
%ket hop 2 thuat toan ste va zcr
function [vus]= VUS(ste,zcr)
sample = ste - zcr ;
    for n=1:length(sample)
        if (ste(n) < -0.89775 )
            %&& zcr(n) > 0.01
            vus(n)= 5; % unvoice
        elseif(sample(n) > 0)
            vus(n)= 1; % voice
        elseif (sample(n) < 0)
            vus(n)= 5; % unvoice
        end
    end
end