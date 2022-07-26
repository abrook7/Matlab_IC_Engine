%% lab
clear all
clc

%%%load data
[~,sheet_name]=xlsfinfo('ICE_Week1_Data.xlsx')
for k=1:numel(sheet_name)
  data{k}=xlsread('ICE_Week1_Data.xlsx',sheet_name{k})
end

numericCells1 = data(1,1);
calib_eq = cell2mat(numericCells1);

numericCells2 = data(1,2);
low_rpm = cell2mat(numericCells2);

numericCells3 = data(1,3);
med_rpm = cell2mat(numericCells3);

numericCells4 = data(1,4);
high_rpm = cell2mat(numericCells4);

numericCells5 = data(1,5);
high_rpm1 = cell2mat(numericCells5);







