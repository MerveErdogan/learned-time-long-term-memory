%Extinction deneyi FIPI analysis
%28/08/2020 - Merve Erdogan
%Starting with 15 sec: 17,20,21 & w 30 sec: 22,27,28

clear;
folder = dir ('D:\Extinction_data');
folder = folder([folder.isdir]);
[~,idx] = sort([folder.datenum]);
folder = folder(idx);

for m =[17,20,21,22,27,28,64,69,74,96]
    TNS.Subject(m).Session.Data=[];
    Plotting.Subject(m).Data = []; %for the last 3 session to be plotted
end

t=dir;

for d = 1:length(folder)
    
    if folder(d).name(end)~= '.'
        name = sprintf('D:\\Extinction_data\\%s',folder(d).name);
        t=dir(name);
        
        for i=1:length(t)
            if t(i).name(end) ~= '.'
                cd (name);
                y=[];
                y=dlmread(t(i).name);
                if str2double(t(i).name(end-1:end))==96
                    if isempty(TNS.Subject(96).Session(1).Data)==1
                        TNS.Subject(96).Session(1).Data=y;
                        TNS.Subject(96).Session(1).Date=datestr(t(i).datenum);
                    else
                        TNS.Subject(96).Session(end+1).Data=y;
                        TNS.Subject(96).Session(end).Date=datestr(t(i).datenum);
                    end
                elseif str2double(t(i).name(end-1:end))==69
                    if isempty(TNS.Subject(69).Session(1).Data)==1
                        TNS.Subject(69).Session(1).Data=y;
                        TNS.Subject(69).Session(1).Date=datestr(t(i).datenum);
                    else
                        TNS.Subject(69).Session(end+1).Data=y;
                        TNS.Subject(69).Session(end).Date=datestr(t(i).datenum);
                    end
                    
                elseif str2double(t(i).name(end-1:end))==74
                    if isempty(TNS.Subject(74).Session(1).Data)==1
                        TNS.Subject(74).Session(1).Data=y;
                        TNS.Subject(74).Session(1).Date=datestr(t(i).datenum);
                    else
                        TNS.Subject(74).Session(end+1).Data=y;
                        TNS.Subject(74).Session(end).Date=datestr(t(i).datenum);
                    end
                elseif str2double(t(i).name(end-1:end))==64
                    if isempty(TNS.Subject(64).Session(1).Data)==1
                        TNS.Subject(64).Session(1).Data=y;
                        TNS.Subject(64).Session(1).Date=datestr(t(i).datenum);
                    else
                        TNS.Subject(64).Session(end+1).Data=y;
                        TNS.Subject(64).Session(end).Date=datestr(t(i).datenum);
                    end
                elseif str2double(t(i).name(end-1:end))==28
                    if isempty(TNS.Subject(28).Session(1).Data)==1
                        TNS.Subject(28).Session(1).Data=y;
                        TNS.Subject(28).Session(1).Date=datestr(t(i).datenum);
                    else
                        TNS.Subject(28).Session(end+1).Data=y;
                        TNS.Subject(28).Session(end).Date=datestr(t(i).datenum);
                    end
                elseif str2double(t(i).name(end-1:end))==27
                    if isempty(TNS.Subject(27).Session(1).Data)==1
                        TNS.Subject(27).Session(1).Data=y;
                        TNS.Subject(27).Session(1).Date=datestr(t(i).datenum);
                    else
                        TNS.Subject(27).Session(end+1).Data=y;
                        TNS.Subject(27).Session(end).Date=datestr(t(i).datenum);
                    end
                elseif str2double(t(i).name(end-1:end))==22
                    if isempty(TNS.Subject(22).Session(1).Data)==1
                        TNS.Subject(22).Session(1).Data=y;
                        TNS.Subject(22).Session(1).Date=datestr(t(i).datenum);
                    else
                        TNS.Subject(22).Session(end+1).Data=y;
                        TNS.Subject(22).Session(end).Date=datestr(t(i).datenum);
                    end
                elseif str2double(t(i).name(end-1:end))==21
                    if isempty(TNS.Subject(21).Session(1).Data)==1
                        TNS.Subject(21).Session(1).Data=y;
                        TNS.Subject(21).Session(1).Date=datestr(t(i).datenum);
                    else
                        TNS.Subject(21).Session(end+1).Data=y;
                        TNS.Subject(21).Session(end).Date=datestr(t(i).datenum);
                    end
                elseif str2double(t(i).name(end-1:end))==20
                    if isempty(TNS.Subject(20).Session(1).Data)==1
                        TNS.Subject(20).Session(1).Data=y;
                        TNS.Subject(20).Session(1).Date=datestr(t(i).datenum);
                    else
                        TNS.Subject(20).Session(end+1).Data=y;
                        TNS.Subject(20).Session(end).Date=datestr(t(i).datenum);
                    end
                elseif str2double(t(i).name(end-1:end))==17
                    if isempty(TNS.Subject(17).Session(1).Data)==1
                        TNS.Subject(17).Session(1).Data=y;
                        TNS.Subject(17).Session(1).Date=datestr(t(i).datenum);
                    else
                        TNS.Subject(17).Session(end+1).Data=y;
                        TNS.Subject(17).Session(end).Date=datestr(t(i).datenum);
                    end
                end
            end
        end
    end
end

temp=[];
hemp=[];

for i= [17,20,21,22,27,28,64,69,74,96]
    for ses= 1:length(TNS.Subject(i).Session)
        
        if isempty(TNS.Subject(i).Session(ses).Data)==0
            
            % 1st colum is rounded & pu in the 2nd column
            TNS.Subject(i).Session(ses).Data(:,2)=round(TNS.Subject(i).Session(ses).Data(:,1));
            
            % 1st column is substracted from the 2nd so that decimals are taken
            % decimals are the event codes in the Pascal code
            TNS.Subject(i).Session(ses).Data(:,3)=TNS.Subject(i).Session(ses).Data(:,1)-TNS.Subject(i).Session(ses).Data(:,2);
            
            
            %3rd column times 1000 so that event numbers are get
            TNS.Subject(i).Session(ses).Data(:,4)=TNS.Subject(i).Session(ses).Data(:,3)*1000;
            
            %time is divided by 100
            TNS.Subject(i).Session(ses).Data(:,2) = TNS.Subject(i).Session(ses).Data(:,2)/100;
            
            % rounded again to get rid of the ,
            TNS.Subject(i).Session(ses).Data(:,4)=round(TNS.Subject(i).Session(ses).Data(:,4));
            
        end
    end
end

for sub = [17 20 21 22 27 28 64 69 74 96]
    
    for  ses = size(TNS.Subject(sub).Session,2)-4:size(TNS.Subject(sub).Session,2)
        
        data = TNS.Subject(sub).Session(ses).Data;
        
        %get on off index:
        TNS.Subject(sub).Session(ses).PIon=find(data(:,4) == 47);  %45 is event code for PI20 trial start
        TNS.Subject(sub).Session(ses).PIoff=find(data(:,4) == 48);  %46 is event code for PI20 trial end
        
        % clear if there is any incomplete trials
        if size(TNS.Subject(sub).Session(ses).PIon,1) ~= size(TNS.Subject(sub).Session(ses).PIoff,1)
            TNS.Subject(sub).Session(ses).PIon(end,:)=[];
        end
        
        %shrink the structure a bit and clear extras:
        TNS.Subject(sub).Session(ses).PILimits = [TNS.Subject(sub).Session(ses).PIon TNS.Subject(sub).Session(ses).PIoff];
        
        
    end
    TNS.Subject(sub).Session = rmfield(TNS.Subject(sub).Session, {'Date','PIon','PIoff'});
    
end

save Phase1PI TNS

%%

%get each PI trial data (on to off):

PIEvents = [];

for sub = [17 20 21 22 27 28 64 69 74 96]
    
    for ses = size(TNS.Subject(sub).Session,2)-4:size(TNS.Subject(sub).Session,2)
        
        data = TNS.Subject(sub).Session(ses).Data;
        %PI:
        if isempty(TNS.Subject(sub).Session(ses).PILimits) == 0
            for i = 1:size(TNS.Subject(sub).Session(ses).PILimits,1)
                PIEvents = TNS.Subject(sub).Session(ses).PILimits(i,1): TNS.Subject(sub).Session(ses).PILimits(i,2);
                TNS.Subject(sub).Session(ses).PI(i).Events = data(PIEvents,[2 4]);
            end
        else
            TNS.Subject(sub).Session(ses).PI = [];
        end
        
        % just to check # of trials
        TNS.Subject(sub).Session(ses).PICount = size(TNS.Subject(sub).Session(ses).PILimits,1);
        
    end
    
end

save Phase1PI TNS

%%

%normalize the timestamps so each trial will start from time 0. trial start is
%light on for PI trials. 13 and 17 are event codes for light 1 ON and light 5 ON used
%in this experiment. NP in out codes are 1-7 for NP1 and 5-11 for NP5.

PIData = [];


for sub = [17 20 21 22 27 28 64 69 74 96]
    
    for ses = size(TNS.Subject(sub).Session,2)-4:size(TNS.Subject(sub).Session,2)
        %PI
        for i = 1:size(TNS.Subject(sub).Session(ses).PI,2)
            PIData = TNS.Subject(sub).Session(ses).PI(i).Events(find(TNS.Subject(sub).Session(ses).PI(i).Events(:,2) == 47):find(TNS.Subject(sub).Session(ses).PI(i).Events(:,2) == 48),:);
            PIData(:,1) = PIData(:,1)-PIData(1,1);
            TNS.Subject(sub).Session(ses).PI(i).NormEvents = PIData;
            inTime = TNS.Subject(sub).Session(ses).PI(i).NormEvents(TNS.Subject(sub).Session(ses).PI(i).NormEvents(:,2) == 3); %NP in to NP3
            outTime = TNS.Subject(sub).Session(ses).PI(i).NormEvents(TNS.Subject(sub).Session(ses).PI(i).NormEvents(:,2) == 9); %NP out from NP3
            if size(inTime,1)>size(outTime,1)
                outTime(end+1,1) = TNS.Subject(sub).Session(ses).PI(i).NormEvents(end,1);
            end
            if size(inTime,1)<size(outTime,1)
                outTime(1) = [];
            end
            TNS.Subject(sub).Session(ses).PI(i).InOuts = [inTime outTime];
        end
        
    end
end


save Phase1PI TNS

%%

%PI

pival = 0;

for sub = [64 69 74 96]
    
    if sub == 17 || sub == 21 || sub == 27 
        pival = 15;
    elseif sub == 20 || sub == 22 || sub == 28 || sub == 69 || sub == 74
        pival = 30;
    end
    
    RespRatePI = [];  %all sessions will be in one matrix
    figure;
    loc = 0;
    sgtitle(['Subject(', num2str(sub),')']);
    
    for ses = size(TNS.Subject(sub).Session,2)-4:size(TNS.Subject(sub).Session,2)
        
        for i = 1:size(TNS.Subject(sub).Session(ses).PI,2)
            RespRatePI(end+1,1:100) = 0;
            loc  = loc+1;
            subplot(1,2,1)
            if isempty(TNS.Subject(sub).Session(ses).PI(i).InOuts)==0
                data = ceil(TNS.Subject(sub).Session(ses).PI(i).InOuts);
                for ii =1:size(TNS.Subject(sub).Session(ses).PI(i).InOuts,1)
                    RespRatePI(end,data(ii,1):data(ii,2)) = RespRatePI(end,data(ii,1):data(ii,2))+1; %so counts all responses within a bin
                    plot([TNS.Subject(sub).Session(ses).PI(i).InOuts(ii,1) TNS.Subject(sub).Session(ses).PI(i).InOuts(ii,2)], [loc loc],'k');
                    hold on;
                    xlabel('Time (s)');
                    ylabel('Trial Number');
                end
                
            else  plot([0 0],[loc loc],'k');
                hold on;
                xlabel('Time (s)');
                ylabel('Trial Number');
            end
        end
        xlim([0 60]);
        ylim([0 loc+1]);
        
        
        title(['PI(', num2str(pival),')']);
        plot([pival pival], [0 loc+1], 'r:');
        hold on;
        
    end
    TNS.Subject(sub).RespRatePI20 = RespRatePI;
    
    subplot(1,2,2);
    a= plot((smooth(mean(RespRatePI),15)),'k--');hold on;
    b= plot(smooth(mean(RespRatePI),15)/max(smooth(mean(RespRatePI),15)),'k');
    c= plot(mean(RespRatePI),'g');
    
    plot([pival pival], [0 1], 'r');hold on;
    xlim([0 60]);
    ylim([0 1]);
    xlabel('Time (s)');
    ylabel('Response Rate');
    title(['PI(', num2str(pival),')']);
    
    figureName= sprintf('Subject%d PI( ) Trials',sub);%,size(TNS.Subject(sub).Session,2)
    print (figureName, '-dpng');
    
end

save Phase1PI TNS
