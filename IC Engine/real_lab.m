%% lab
clear all
clc

%% load data
load('week_2_data');
load('week_2_data')

time_lr = low_rpm_FW(2:end,1);
encoder_angle_lr = low_rpm_FW(2:end,2);
encoder_angle_lr = encoder_angle_lr .* (pi ./180);%convert to radians
increment_lr = low_rpm_FW(2:end,3);
index_lr = low_rpm_FW(2:end,4);
seg_angle_lr = low_rpm_FW(2:end,6);
ft_volt_lr = low_rpm_FW(2:end,8);

time2_mr = med_rpm_FW(2:end,1);
encoder_angle_mr = med_rpm_FW(2:end,2);
encoder_angle_mr = encoder_angle_mr .* (pi ./180);%convert to radians
increment_mr = med_rpm_FW(2:end,3);
index_mr = med_rpm_FW(2:end,4);
seg_angle_mr = med_rpm_FW(2:end,6);
ft_volt_mr = med_rpm_FW(2:end,8);

time_hr = high_rpm_FW(2:end,1);
encoder_angle_hr = high_rpm_FW(2:end,2);
encoder_angle_hr = encoder_angle_hr .* (pi ./180);%convert to radians
increment_hr = high_rpm_FW(2:end,3);
index_hr = high_rpm_FW(2:end,4);
seg_angle_hr = high_rpm_FW(2:end,6);
ft_volt_hr = high_rpm_FW(2:end,8);

time_lr_nf = low_rpm_no(2:end,1);
encoder_angle_lr_nf = low_rpm_no(2:end,2);
encoder_angle_lr_nf = encoder_angle_lr_nf .* (pi ./180);%convert to radians
increment_lr_nf = low_rpm_no(2:end,3);
index_lr_nf = low_rpm_no(2:end,4);
seg_angle_lr_nf = low_rpm_no(2:end,6);
ft_volt_lr_nf = low_rpm_no(2:end,8);

time2_mr_nf = med_rpm_no(2:end,1);
encoder_angle_mr_nf = med_rpm_no(2:end,2);
encoder_angle_mr_nf = encoder_angle_mr_nf .* (pi ./180);%convert to radians
increment_mr_nf = med_rpm_no(2:end,3);
index_mr_nf = med_rpm_no(2:end,4);
seg_angle_mr_nf = med_rpm_no(2:end,6);
ft_volt_mr_nf = med_rpm_no(2:end,8);

time_hr_nf = high_rpm_no(2:end,1);
encoder_angle_hr_nf = high_rpm_no(2:end,2);
encoder_angle_hr_nf = encoder_angle_hr_nf .* (pi ./180);%convert to radians
increment_hr_nf = high_rpm_no(2:end,3);
index_hr_nf = high_rpm_no(2:end,4);
seg_angle_hr_nf = high_rpm_no(2:end,6);
ft_volt_hr_nf = high_rpm_no(2:end,8);






