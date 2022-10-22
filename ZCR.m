%% Tính ZCR
function [zcr]= ZCR(frames)
    [nF,nS] = size(frames);
    for i = 1:nF
        n = frames(i,:); 
        sum(i)=0 ; 
       
        for j = 1:(nS-1)
            if(n(j) * n(j+1) <0) 
                sum(i) = sum(i)+1;
            end
        end
    end
    zcr = sum/ nS; 
end