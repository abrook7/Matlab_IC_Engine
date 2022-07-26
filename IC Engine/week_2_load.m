[~,sheet_name]=xlsfinfo('ICE_Week2_SupplementalData.xlsx')
for k=1:numel(sheet_name)
  data{k}=xlsread('ICE_Week2_SupplementalData.xlsx',sheet_name{k})
end

numericCells1 = data(1,1);
calib_eq = cell2mat(numericCells1);

numericCells2 = data(1,2);
med_rpm_FW = cell2mat(numericCells2);

numericCells3 = data(1,3);
high_rpm_FW = cell2mat(numericCells3);


[~,sheet_name1]=xlsfinfo('ICE_Week2_Data.xlsx')
for ka=1:numel(sheet_name1)
  data{ka}=xlsread('ICE_Week2_Data.xlsx',sheet_name1{ka})
end

numericCells1 = data(1,1);
calib_eq1 = cell2mat(numericCells1);

numericCells2 = data(1,2);
low_rpm_FW = cell2mat(numericCells2);

%numericCells3 = data(1,3);
%med_rpm_FW = cell2mat(numericCells3);

%numericCells1 = data(1,4);
%high_rpm_FW = cell2mat(numericCells4);

numericCells5 = data(1,5);
low_rpm_no = cell2mat(numericCells5);

numericCells6 = data(1,6);
med_rpm_no = cell2mat(numericCells6);

numericCells7 = data(1,7);
high_rpm_no = cell2mat(numericCells7);






