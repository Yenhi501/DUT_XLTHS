clear all;close all;

%% Tim ngương chung
%%% Su dung thong ke cac diem V va UV tu 4 file .Lab 
%sFeMaleV=[69:70 111:113 123:127 166:170]; sFeMaleUV= [1:68 71:110 114:122 128:165 ];
%sMaleV= [88:94 127:133 160:166 ]; sMaleUV= [1:87 95:126 134:159 167:178 ];
%pMaleV = [47:139  151:169 180:278]; pMaleUV =[1:46 140:150 170:179 279:286 294:310 330:345 353:415];
%pFeMaleV = [54:114 122:135 146:160 184:220 ]; pFeMaleUV = [1:53  115:121 136:145 161:183 221:228 236:240 ];

sFeMaleV= [78:125 128:135 142:176 184:198]; sFeMaleUV= [1:77 126:127 136:141 ]; 
sMaleV= [46:48 78:79 89:92 ]; sMaleUV= [1:45 49:77 80:88 93:132];  
pMaleV = [54:105 113:124 132:146 169:197 207:212 218:230 244:250 253:280]; pMaleUV = [1:53 106:112 125:131 147:168 198:206 213:217 231:243 251:252]; 
pFeMaleV = [103:188 196:216 226:260 ]; pFeMaleUV = [1:102 189:195 217:225]; 

%% Do dai thoi gian cua moi frame (s)
Fd=0.01;

%% Doc tin hieu dau vao, chia khung, tim nguong ste,zcr theo tung file tin hieu
for i = 1:4
    if i==1 % Studio Female
        %[Data,Fs] = audioread('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuHuanLuyen\studio_F2.wav');
        [Data,Fs] = audioread('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuKiemThu\studio_F1.wav');
        khung = ChiaKhung(Data,Fs,Fd);
        ste = STE(khung);zcr = ZCR(khung);  
        nguongsF_ste =  Nguong(ste(sFeMaleV),ste(sFeMaleUV));  nguognsF_zcr =  Nguong(zcr(sFeMaleV),zcr(sFeMaleUV));        
    elseif i==2 % Studio Male
        %[Data,Fs] = audioread('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuHuanLuyen\studio_M2.wav');
        [Data,Fs] = audioread('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuKiemThu\studio_M1.wav');
        khung = ChiaKhung(Data,Fs,Fd);
        ste = STE(khung);zcr = ZCR(khung);
        nguongsM_ste = Nguong(ste(sMaleV),ste(sMaleUV)); nguongsM_zcr = Nguong(zcr(sMaleV),zcr(sMaleUV));
    elseif i==3 % Phone Female
        %[Data,Fs] = audioread('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuHuanLuyen\phone_F2.wav');
        [Data,Fs] = audioread('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuKiemThu\phone_F1.wav');
        khung = ChiaKhung(Data,Fs,Fd);
        ste = STE(khung);zcr = ZCR(khung);
        nguongpF_ste =  Nguong(ste(pFeMaleV),ste(pFeMaleUV)); nguongpF_zcr =  Nguong(zcr(pFeMaleV),zcr(pFeMaleUV));
    elseif i==4 % Phone Male
        %[Data,Fs] = audioread('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuHuanLuyen\phone_M2.wav');
        [Data,Fs] = audioread('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuKiemThu\phone_M1.wav');
        khung = ChiaKhung(Data,Fs,Fd);
        ste = STE(khung); zcr = ZCR(khung);
        nguongpM_ste =  Nguong(ste(pMaleV),ste(pMaleUV)); nguongpM_zcr = Nguong(zcr(pMaleV),zcr(pMaleUV));
    end
end

%% Threshold theo zcr va ste ( trung binh cong cua 4 nguong cua 4 file.wav)
nguong_zcr = (nguognsF_zcr+nguongsM_zcr+nguongpF_zcr+nguongpM_zcr)/4;
nguong_ste = (nguongsF_ste+nguongsM_ste+nguongpF_ste+nguongpM_ste)/4;

%% Dung vong lap doc 4 file tin hieu studio_F2, studio_M2, phone_F2, phone_M2
for i = 1:4
    if i == 1
        fiName=figure('Name','File s_Female','Color','white') ;
        %[Data,Fs] = audioread('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuHuanLuyen\studio_F2.wav');
        [Data,Fs] = audioread('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuKiemThu\studio_F1.wav');
        %file= fopen('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuHuanLuyen\studio_F2.lab','r'); 
        file= fopen('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuKiemThu\studio_F1.lab','r'); 
    elseif i == 2
        fiName=figure('Name','File s_Male','Color','white') ;
        %[Data,Fs] = audioread('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuHuanLuyen\studio_M2.wav');
        [Data,Fs] = audioread('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuKiemThu\studio_M1.wav');
        %file= fopen('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuHuanLuyen\studio_M2.lab','r');
        file= fopen('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuKiemThu\studio_M1.lab','r');
    elseif i == 3
        fiName=figure('Name','File p_Female','Color','white') ;
        %[Data,Fs] = audioread('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuHuanLuyen\phone_F2.wav');
        [Data,Fs] = audioread('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuKiemThu\phone_F1.wav');
        %file= fopen('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuHuanLuyen\phone_F2.lab','r');
        file= fopen('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuKiemThu\phone_F1.lab','r');
    elseif i == 4
        fiName=figure('Name','File p_Male','Color','white') ;
        %[Data,Fs] = audioread('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuHuanLuyen\phone_M2.wav');
        [Data,Fs] = audioread('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuKiemThu\phone_M1.wav');
        %file= fopen('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuHuanLuyen\phone_M2.lab','r');
        file= fopen('C:\Users\admind\OneDrive - The University of Technology\Desktop\NAM3\Source\Source\TinHieuKiemThu\phone_M1.lab','r');
    end
    
    %% Chia frame
    khung = ChiaKhung(Data,Fs,Fd);

    %% Tinh STE và ZCR 
    ste = STE(khung);
    zcr = ZCR(khung);
    
    %% Chuan hoa nang luong dua vao nguong chung T , dung chuan hoa theo day [-1; 1]
    ste_ChuanHoa = ChuanHoa(ste,nguong_ste); 
    zcr_ChuanHoa = ChuanHoa(zcr,nguong_zcr);

    %% Ve do thi ket hop Zero-crossing rate (ZCR) and Short-time energy (STE)
    subplot(5,1,3); % chia cửa sổ Figure thành từng phần nhỏ
    s = length(Data)/Fs; % Tính toán độ dài(thời gian) của tín hiệu
    ss = linspace(0, s ,length(Data));
    plot(ss, Data,'LineWidth',1); % Ve do thi singal
    hold on;
    s1 = length(DoThi(ste_ChuanHoa,Fs,Fd))/Fs;
    ss1 = linspace(0, s1 ,length(DoThi(ste_ChuanHoa,Fs,Fd)));
    hold on;
    plot(ss1,DoThi(ste_ChuanHoa,Fs,Fd),'g','LineWidth',1);
    hold on;
    plot(ss1,DoThi(zcr_ChuanHoa,Fs,Fd),'b','LineWidth',0.8);
    xlabel('Time axis (sec)'); % thêm label cho trục ngang
    ylabel('Amplitude'); % thêm label cho trục dọc
    title('Zero-crossing rate (ZCR) and Short-time energy (STE)'); % thêm title cho graph
    legend('Singal','ZCR','STE'); % thêm label phân biệt từng đại lượng trong cùng 1 đồ thị


    %% Ve ham Short-time energy (STE)
    subplot(5,2,7); %chia cửa sổ Figure thành từng phần nhỏ
    grid on;
    plot(ss,Data,'LineWidth',1); % Ve do thi singal
    hold on;% Giu khung hinh plot
    s1 = length(DoThi(ste_ChuanHoa,Fs,Fd))/Fs;
    ss1 = linspace(0, s1 ,length(DoThi(ste_ChuanHoa,Fs,Fd)));
    plot(ss1,DoThi(ste_ChuanHoa,Fs,Fd),'b','LineWidth',0.8);
    xlabel('Time axis (sec)'); % thêm label cho trục ngang
    ylabel('Amplitude'); %thêm label cho trục dọc
    title('Normalisation (STE)'); % thêm title cho graph
    hold off; % Tat che do giu khung hinh plot
   

    %%%Ve ham Zero-crossing rate (ZCR)
    subplot(5,2,8); % chia cửa sổ Figure thành từng phần nhỏ
    grid on;
    plot(ss,Data,'LineWidth',0.5); 
    hold on; % Giu khung hinh plot
    s1 = length(DoThi(ste_ChuanHoa,Fs,Fd))/Fs;
    ss1 = linspace(0, s1 ,length(DoThi(ste_ChuanHoa,Fs,Fd)));
    plot(ss1,DoThi(zcr_ChuanHoa,Fs,Fd),'-b','LineWidth',0.8);
    xlabel('Time axis (sec)'); % thêm label cho trục ngang
    ylabel('Amplitude'); % thêm label cho trục dọc
    title('Normalisation (ZCR)'); % thêm title cho graph
    hold off; % Tat che do giu khung hinh plot

    subplot(5,2,9); %chia cửa sổ Figure thành từng phần nhỏ
    grid on;
    plot(ss,Data,'LineWidth',1); % Ve do thi singal
    hold on;% Giu khung hinh plot
    s1 = length(DoThi(ste,Fs,Fd))/Fs;
    ss1 = linspace(0, s1 ,length(DoThi(ste,Fs,Fd)));
    plot(ss1,DoThi(ste,Fs,Fd),'b','LineWidth',0.8);
    xlabel('Time axis (sec)'); % thêm label cho trục ngang
    ylabel('Amplitude'); %thêm label cho trục dọc
    title('Short-time energy (STE)'); % thêm title cho graph
    hold off; % Tat che do giu khung hinh plot
   

    %% Ve ham Zero-crossing rate (ZCR)
    subplot(5,2,10); % chia cửa sổ Figure thành từng phần nhỏ
    grid on;
    plot(ss,Data,'LineWidth',0.5); 
    hold on; % Giu khung hinh plot
    s1 = length(DoThi(ste,Fs,Fd))/Fs;
    ss1 = linspace(0, s1 ,length(DoThi(ste,Fs,Fd)));
    plot(ss1,DoThi(zcr,Fs,Fd),'-b','LineWidth',0.8);
    xlabel('Time axis (sec)'); % thêm label cho trục ngang
    ylabel('Amplitude'); % thêm label cho trục dọc
    title('Zero-crossing rate (ZCR)'); % thêm title cho graph
    hold off; % Tat che do giu khung hinh plot


    %% Do thi ket qua tu dong lay tu file *LAB
    subplot(5,1,2); % chia cửa sổ Figure thành từng phần nhỏ
    plot(ss,Data,'LineWidth',1);  % Ve do thi singal
    title('ĐỒ THỊ KẾT QUẢ VOICED/UNVOICED (FILE *LAB)');
    xlabel('Time axis (sec)'); % thêm label cho trục ngang
    ylabel('Amplitude'); %  thêm label cho trục dọc
    string_Data = textscan(file,'%s'); % tra ve string
    fclose(file); mang = string(string_Data{:}); %chuyen thanh array
    for n=1:length(mang)
    if mang(n) =='si' && mang(n+3) =='uv'
        mang(n+1)=mang(n-2);        
    end
    if mang(n) =='si' && mang(n) =='uv'
        mang(n+1)=mang(n-2);
    end
    if mang(n) == 'uv' 
        if mang(n+3) ~= 'si' 
        xline(str2double(mang(n-2)), '--b','LineWidth',0.7);
        end
        text((str2double(mang(n-1))-str2double(mang(n-2)))/2+str2double(mang(n-2))-0.01,0.75,'u');          
        %Màu đỏ bắt đầu bằng voice, màu xanh bắt đầu bằng unvoice
    end
    if mang(n) == 'v'
        xline(str2double(mang(n-1)), '--b','LineWidth',0.7);
        xline(str2double(mang(n-2)),'--b','LineWidth',0.7);
        text((str2double(mang(n-1))-str2double(mang(n-2)))/2+str2double(mang(n-2))-0.01,0.75,'v');          
    end
end
    legend('Singal','Phân biệt V và UV');
    hold off;

    %% Goi ha phan biet V va UV
    VU = VUS(ste_ChuanHoa,zcr_ChuanHoa);
    ylim([-1 1]);

    %% Loc du lieu de khong trung
    Loc =[]; % Khoi tao fil la mot mang rong
    for i=2:length(VU)-1
        if(VU(i)~=VU(i+1)) && (VU(i)~=VU(i-1)) VU(i)=VU(i-1);
        end
    end
    for i=2:length(VU)-2
        if(VU(i)==VU(i+1)) && (VU(i)~=VU(i-1)) &&(VU(i)~=VU(i+2)) VU(i)=VU(i-1);
            VU(i+1)=VU(i-1);
        end
    end

    Loc = VU;
    pointVU = []; %danh dau nhung diem chuyen tu huu am sang vo am
    n=1;
    for i = 1:length(VU)-1
        if(VU(i) == 5 && VU(i+1) == 1 || VU(i) == 1 && VU(i+1) == 5)
            pointVU(n) = i * 0.01; %luu hoanh do cua nhung diem chuyen tiep
            n = n+1;
        end
    end
    hold on;
    %% Do thi ket qua voiced/unvoiced dung thuat toan
    subplot(5,1,1); % chia cửa sổ Figure thành từng phần nhỏ
    ss = linspace(0,length(Data)/Fs ,length(Data));
    plot(ss,Data,'LineWidth',1); % Ve do thi singal
    title('ĐỒ THỊ KẾT QUẢ VOICED/UNVOICED DÙNG THUẬT TOÁN'); % thêm title cho graph
    xlabel('Time axis (sec)'); % thêm label cho trục ngang
    ylabel('Amplitude'); % thêm label cho trục dọc
    ylim([-1 1]);
    hold on;  %giu khung hinh plot
   
    for i=1:length(pointVU)
        xline(pointVU(i),'--g','LineWidth',0.9);
    end
    for i=1:2:length(pointVU)
        text((pointVU(i+1) -pointVU(i))/2 + pointVU(i)-0.01 , 0.8 , 'v');
        text((pointVU(i+1) -pointVU(i)) + pointVU(i) + 0.01 , 0.8 , 'u');
    end
    
    legend('Singal','Phân biệt V và UV');  % thêm label phân biệt từng đại lượng trong cùng 1 đồ thị
    hold off;  % Tat che do giu khung hinh plot

end















