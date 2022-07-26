%% lab
clear all
clc

%%
load('week_2_data')
load('week2_use')
%%
ind1 = ~isnan(index_lr);
index_lr = index_lr(ind1);
increment_lr = increment_lr(ind1);

%initialize variables
time_index_lr = [];
encoder_angle_index_lr = [];
inc_lr = [];

%segment 10 degree sections based on the increments/indexs given
for n = 1:length(increment_lr)-1
    t = time_lr(index_lr(n));
    ea = encoder_angle_lr(index_lr(n),1);
    e = increment_lr(n,1).* 10 .*(pi./180);
    
    %add to vectors
    time_index_lr = [time_index_lr; t];
    encoder_angle_index_lr = [encoder_angle_index_lr; ea];
    inc_lr = [inc_lr;e];
end

ind2 = ~isnan(index_mr);
index_mr = index_mr(ind2);
increment_mr = increment_mr(ind2);

%initialize variables
time_index_mr = [];
encoder_angle_index_mr = [];
inc_mr = [];

%segment 10 degree sections based on the increments/indexs given
for n = 1:length(increment_mr)-1
    t = time2_mr(index_mr(n));
    ea = encoder_angle_mr(index_mr(n),1);
    e = increment_mr(n,1).* 10 .*(pi./180);
    
    %add to vectors
    time_index_mr = [time_index_mr; t];
    encoder_angle_index_mr = [encoder_angle_index_mr; ea];
    inc_mr = [inc_mr;e];
end

ind3 = ~isnan(index_hr);
index_hr = index_hr(ind3);
increment_hr = increment_hr(ind3);

%initialize variables
time_index_hr = [];
encoder_angle_index_hr = [];
inc_hr = [];

%segment 10 degree sections based on the increments/indexs given
for n = 1:length(increment_hr)-1
    t = time_hr(index_hr(n));
    ea = encoder_angle_hr(index_hr(n),1);
    e = increment_hr(n,1).* 10 .*(pi./180);
    
    %add to vectors
    time_index_hr = [time_index_hr; t];
    encoder_angle_index_hr = [encoder_angle_index_hr; ea];
    inc_hr = [inc_hr;e];
end

ind4 = ~isnan(index_lr_nf);
index_lr_nf = index_lr_nf(ind4);
increment_lr_nf = increment_lr_nf(ind4);

%initialize variables
time_index_lr_nf = [];
encoder_angle_index_lr_nf = [];
inc_lr_nf = [];

%segment 10 degree sections based on the increments/indexs given
for n = 1:length(increment_lr_nf)-1
    t = time_lr_nf(index_lr_nf(n));
    ea = encoder_angle_lr_nf(index_lr_nf(n),1);
    e = increment_lr_nf(n,1).* 10 .*(pi./180);
    
    %add to vectors
    time_index_lr_nf = [time_index_lr_nf; t];
    encoder_angle_index_lr_nf = [encoder_angle_index_lr_nf; ea];
    inc_lr_nf = [inc_lr_nf;e];
end

ind5 = ~isnan(index_mr_nf);
index_mr_nf = index_mr_nf(ind5);
increment_mr_nf = increment_mr_nf(ind5);

%initialize variables
time_index_mr_nf = [];
encoder_angle_index_mr_nf = [];
inc_mr_nf = [];

%segment 10 degree sections based on the increments/indexs given
for n = 1:length(increment_mr_nf)-1
    t = time2_mr_nf(index_mr_nf(n));
    ea = encoder_angle_mr_nf(index_mr_nf(n),1);
    e = increment_mr_nf(n,1).* 10 .*(pi./180);
    
    %add to vectors
    time_index_mr_nf = [time_index_mr_nf; t];
    encoder_angle_index_mr_nf = [encoder_angle_index_mr_nf; ea];
    inc_mr_nf = [inc_mr_nf;e];
end

ind6 = ~isnan(index_hr_nf);
index_hr_nf = index_hr_nf(ind6);
increment_hr_nf = increment_hr_nf(ind6);

%initialize variables
time_index_hr_nf = [];
encoder_angle_index_hr_nf = [];
inc_hr_nf = [];

%segment 10 degree sections based on the increments/indexs given
for n = 1:length(increment_hr_nf)-1
    t = time_hr_nf(index_hr_nf(n));
    ea = encoder_angle_hr_nf(index_hr_nf(n),1);
    e = increment_hr_nf(n,1).* 10 .*(pi./180);
    
    %add to vectors
    time_index_hr_nf = [time_index_hr_nf; t];
    encoder_angle_index_hr_nf = [encoder_angle_index_hr_nf; ea];
    inc_hr_nf = [inc_hr_nf;e];
end
%%

T1 = 7.8485 .* abs(ft_volt_lr) + 0.1205;
T2 = 0.9043 .* abs(ft_volt_mr) + 0.6854;
T3 = 0.9043 .* abs(ft_volt_hr) + 0.6854;
T4 = 7.8485 .* abs(ft_volt_lr_nf) + 0.1205;
T5 = 7.8485 .* abs(ft_volt_mr_nf) + 0.1205;
T6 = 7.8485 .* abs(ft_volt_hr_nf) + 0.1205;


avg1 = mean(T1(1:1:index_lr(1),1)); %initialize variable and take first 0.4 seconds out

%avg torque vals between 10 deg indicies
for n = 2:length(increment_lr)-1
    a = mean(T1(index_lr(n-1)+1:1:index_lr(n),1));
    
    avg1 = [avg1; a];
    
end

avg2 = mean(T2(1:1:index_mr(1),1)); %initialize variable and take first 0.4 seconds out

%avg torque vals between 10 deg indicies
for n = 2:length(increment_mr)-1
    a = mean(T2(index_mr(n-1)+1:1:index_mr(n),1));
    
    avg2 = [avg2; a];
    
end

avg3 = mean(T3(1:1:index_hr(1),1)); %initialize variable and take first 0.4 seconds out

%avg torque vals between 10 deg indicies
for n = 2:length(increment_hr)-1
    a = mean(T3(index_hr(n-1)+1:1:index_hr(n),1));
    
    avg3 = [avg3; a];
    
end

avg4 = mean(T4(1:1:index_lr_nf(1),1)); %initialize variable and take first 0.4 seconds out

%avg torque vals between 10 deg indicies
for n = 2:length(increment_lr_nf)-1
    a = mean(T4(index_lr_nf(n-1)+1:1:index_lr_nf(n),1));
    
    avg4 = [avg4; a];
    
end

avg5 = mean(T5(1:1:index_mr_nf(1),1)); %initialize variable and take first 0.4 seconds out

%avg torque vals between 10 deg indicies
for n = 2:length(increment_mr_nf)-1
    a = mean(T5(index_mr_nf(n-1)+1:1:index_mr_nf(n),1));
    
    avg5 = [avg5; a];
    
end

avg6 = mean(T6(1:1:index_hr_nf(1),1)); %initialize variable and take first 0.4 seconds out

%avg torque vals between 10 deg indicies
for n = 2:length(increment_hr_nf)-1
    a = mean(T6(index_hr_nf(n-1)+1:1:index_hr_nf(n),1));
    
    avg6 = [avg6; a];
    
end

%plot fig 31
figure(1)
hold on
grid on
plot(inc_lr,avg1,'b.-')
%plot([163 163],[0 5],'r')
xlabel('Angular Position [rad]')
ylabel('Motor Torque [N*m]')
legend('Averaged Torque')
title('Low RPM Flywheel')

%plot fig 31
figure(2)
hold on
grid on
plot(inc_mr,avg2,'b.-')
%plot([163 163],[0 5],'r')
xlabel('Angular Position [rad]')
ylabel('Motor Torque [N*m]')
legend('Averaged Torque')
title('Medium RPM Flywheel')

%plot fig 31
figure(3)
hold on
grid on
plot(inc_hr,avg3,'b.-')
%plot([163 163],[0 5],'r')
xlabel('Angular Position [rad]')
ylabel('Motor Torque [N*m]')
legend('Averaged Torque')
title('High RPM Flywheel')

%plot fig 31
figure(4)
hold on
grid on
plot(inc_lr_nf,avg4,'b.-')
%plot([163 163],[0 5],'r')
xlabel('Angular Position [rad]')
ylabel('Motor Torque [N*m]')
legend('Averaged Torque')
title('Low RPM No Flywheel')

%plot fig 31
figure(5)
hold on
grid on
plot(inc_mr_nf,avg5,'b.-')
%plot([163 163],[0 5],'r')
xlabel('Angular Position [rad]')
ylabel('Motor Torque [N*m]')
legend('Averaged Torque')
title('Medium RPM No Flywheel')

%plot fig 31
figure(6)
hold on
grid on
plot(inc_hr_nf,avg6,'b.-')
%plot([163 163],[0 5],'r')
xlabel('Angular Position [rad]')
ylabel('Motor Torque [N*m]')
legend('Averaged Torque')
title('High RPM No Flywheel')

Wmlf = sum(avg1 .* 10 .* pi ./ 180)%numerical integration equation
Wmmf = sum(avg2 .* 10 .* pi ./ 180)%numerical integration equation
Wmhf = sum(avg3 .* 10 .* pi ./ 180)%numerical integration equation
Wmln = sum(avg4 .* 10 .* pi ./ 180)%numerical integration equation
Wmmn = sum(avg5 .* 10 .* pi ./ 180)%numerical integration equation
Wmhn = sum(avg6 .* 10 .* pi ./ 180)%numerical integration equation
