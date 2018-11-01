%ANALYZE Print statistics for first patient
%        Save plots of statistics to disk

clear all
close all

% Load data
%

files = dir('data/inflammation*.csv');

for idx = 1:length(files)
    file_name = files(idx).name;
    disp(file_name)
    
    % Generate string for image names
    img_name = replace(file_name,'.csv','.png');
    
    %Generate path to data file and image file
    file_name=fullfile('data',file_name);
    img_name = fullfile('results',img_name);
    
    %Load data
    patient_data = csvread(file_name);
    
    



% Display stats
disp(['Maximum daily inflammation: ',num2str(max(patient_data(:)))])
disp(['Minimum daily inflammation: ',num2str(min(patient_data(:)))])
disp(['Average daily inflammation: ',num2str(mean(patient_data(:)))])

% Calculate averages
ave_day= mean(patient_data,1);
ave_patient= mean(patient_data,2);

% Plot figures
figure('visible','off')
plot(ave_day)
title('Daily average inflammation')
xlabel('Day of trial')
ylabel('Inflammation')

% Save plot in results folder
print(img_name,'-dpng')
%print('results/average','-dpng')
close()


end