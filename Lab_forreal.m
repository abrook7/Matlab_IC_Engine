%% lab
clear all
clc

%%
load('ICE_lab_full')
load('week2')
load('week_2_data')
%% Calibration EQ week1 and week2

mom_arm = 0.127;
Weight = calib_equation_weight ./ 100;
Torque = Weight .* mom_arm;

volt_w3 = calib_eq(2:end,1);

Weights = Weights .* 2.262;
Torque2 = Weights .* mom_arm;

[x,y] = polyfit(calib_equation_volt,Torque,1)
[x2,y2] = polyfit(volt_w2,Torque2,1)
[x25,y25] = polyfit(volt_w3,Torque2,1)

figure(1)
hold on
grid on
plot(calib_equation_volt,Torque,'b.')
plot(calib_equation_volt,x(1).*calib_equation_volt + x(2),'r')
xlabel('Voltage (V)')
ylabel('Torque (N-m)')
legend('data','T = 3.721x + 0.976')
title('Week 1 Calibration')
hold off

figure(2)
hold on
grid on
plot(volt_w2,Torque2,'b.')
plot(volt_w2,x2(1).*volt_w2 + x2(2),'r')
xlabel('Voltage (V)')
ylabel('Torque (N-m)')
legend('data','T = 7.8485x + .1205')
title('Week 2 Calibration')
hold off

figure(11)
hold on
grid on
plot(volt_w3,Torque2,'b.')
plot(volt_w3,x25(1).*volt_w3 + x25(2),'r')
xlabel('Voltage (V)')
ylabel('Torque (N-m)')
legend('data','T = 0.9043x + 0.6854')
title('Week 2 Supplemental Calibration')
hold off
%% Week 1

%plotting fig1a angular position vs time
figure(3)
hold on
grid on
plot(time1,encoder_angle1,'b')
xlabel('Time [s]')
ylabel('Angular Position [rad]')
legend('Angular Position')
hold off

ind1 = ~isnan(index1);
index1 = index1(ind1);
increment1 = increment1(ind1);

%initialize variables
time_index1 = [];
encoder_angle_index1 = [];
inc1 = [];

%segment 10 degree sections based on the increments/indexs given
for n = 1:length(increment1)-1
    t = time1(index1(n));
    ea = encoder_angle1(index1(n),1);
    e = increment1(n,1).* 10 .*(pi./180);
    
    %add to vectors
    time_index1 = [time_index1; t];
    encoder_angle_index1 = [encoder_angle_index1; ea];
    inc1 = [inc1;e];
end

ind2 = ~isnan(index2);
index2 = index2(ind2);
increment2 = increment2(ind2);

%initialize variables
time_index2 = [];
encoder_angle_index2 = [];
inc2 = [];

%segment 10 degree sections based on the increments/indexs given
for n = 1:length(increment2)-1
    t = time2(index2(n));
    ea = encoder_angle2(index2(n),1);
    e = increment2(n,1).* 10 .*(pi./180);
    
    %add to vectors
    time_index2 = [time_index2; t];
    encoder_angle_index2 = [encoder_angle_index2; ea];
    inc2 = [inc2;e];
end

ind3 = ~isnan(index3);
index3 = index3(ind3);
increment3 = increment3(ind3);

%initialize variables
time_index3 = [];
encoder_angle_index3 = [];
inc3 = [];

%segment 10 degree sections based on the increments/indexs given
for n = 1:length(increment3)-1
    t = time3(index3(n));
    ea = encoder_angle3(index3(n),1);
    e = increment3(n,1).* 10 .*(pi./180);
    
    %add to vectors
    time_index3 = [time_index3; t];
    encoder_angle_index3 = [encoder_angle_index3; ea];
    inc3 = [inc3;e];
end

ind4 = ~isnan(index4);
index4 = index4(ind4);
increment4 = increment4(ind4);

%initialize variables
time_index4 = [];
encoder_angle_index4 = [];
inc4 = [];

%segment 10 degree sections based on the increments/indexs given
for n = 1:length(increment4)-1
    t = time4(index4(n));
    ea = encoder_angle4(index4(n),1);
    e = increment4(n,1).* 10 .*(pi./180);
    
    %add to vectors
    time_index4 = [time_index4; t];
    encoder_angle_index4 = [encoder_angle_index4; ea];
    inc4 = [inc4;e];
end


%plotting fig1bc incremented angle & angle vs time
figure(4)
hold on
grid on
plot(time_index1,inc1,'c-o')
plot(time_index1,encoder_angle_index1,'b-o')
xlabel('Time [s]')
ylabel('Angular Position [rad]')
legend('Incremented Angle','Angle')
xlim([.4 1]);
hold off
%% torque v time

T1 = x(1) .* -ft_volt1 + x(2);
T2 = x(1) .* -ft_volt2 + x(2);
T3 = x(1) .* -ft_volt3 + x(2);
T4 = x(1) .* -ft_volt4 + x(2);

%plotting fig2a motor torque
figure(5)
plot(time1,T1,'k-')
xlabel('Time [s]')
ylabel('Motor Torque [N*m]')
legend('Motor Torque')

avg1 = mean(T1(1:1:index1(1),1)); %initialize variable and take first 0.4 seconds out

%avg torque vals between 10 deg indicies
for n = 2:length(increment1)-1
    a = mean(T1(index1(n-1)+1:1:index1(n),1));
    
    avg1 = [avg1; a];
    
end

avg2 = mean(T2(1:1:index2(1),1)); %initialize variable and take first 0.4 seconds out

%avg torque vals between 10 deg indicies
for n = 2:length(increment2)-1
    a = mean(T2(index2(n-1)+1:1:index2(n),1));
    
    avg2 = [avg2; a];
    
end

avg3 = mean(T3(1:1:index3(1),1)); %initialize variable and take first 0.4 seconds out

%avg torque vals between 10 deg indicies
for n = 2:length(increment3)-1
    a = mean(T3(index3(n-1)+1:1:index3(n),1));
    
    avg3 = [avg3; a];
    
end

avg4 = mean(T4(1:1:index4(1),1)); %initialize variable and take first 0.4 seconds out

%avg torque vals between 10 deg indicies
for n = 2:length(increment4)-1
    a = mean(T4(index4(n-1)+1:1:index4(n),1));
    
    avg4 = [avg4; a];
    
end


%plot fig 2b
figure(6)
plot(time_index1,avg1,'b.-')
xlabel('Time [s]')
ylabel('Motor Torque [N*m]')
legend('Averaged Torque over 10 degree intervals')

%plot fig 31
figure(7)
hold on
grid on
plot(inc1,avg1,'b.-')
plot([163 163],[0 5],'r')
xlabel('Angular Position [rad]')
ylabel('Motor Torque [N*m]')
legend('Averaged Torque','Begining of steady state')
title('Low RPM Flywheel')

mask = inc1 > 163;
inc1c = inc1(mask);
avg1c = avg1(mask);
favg1 = min(avg1c) + ((max(avg1c) - min(avg1c))./2);

%plot fig 32
figure(8)
hold on
grid on
plot(inc2,avg2,'b.-')
plot([60 60],[1.5 5],'r')
xlabel('Angular Position [rad]')
ylabel('Motor Torque [N*m]')
legend('Averaged Torque','Begining of steady state')
title('Medium RPM Flywheel')

mask = inc2 > 60;
inc2c = inc2(mask);
avg2c = avg2(mask);
favg2 = min(avg2c) + ((max(avg2c) - min(avg2c))./2);

%plot fig 33
figure(9)
hold on
grid on
plot(inc3,avg3,'b.-')
plot([196 196],[1 9],'r')
xlabel('Angular Position [rad]')
ylabel('Motor Torque [N*m]')
legend('Averaged Torque','Begining of steady state')
title('High RPM Flywheel')

mask = inc3 > 196;
inc3c = inc3(mask);
avg3c = avg3(mask);
favg3 = min(avg3c) + ((max(avg3c) - min(avg3c))./2);

%plot fig 34
figure(10)
hold on
grid on
plot(inc4,avg4,'b.-')
plot([191 191],[1 6],'r')
xlabel('Angular Position [rad]')
ylabel('Motor Torque [N*m]')
legend('Averaged Torque','Begining of steady state')
title('High RPM One Flywheel')

mask = inc4 > 191;
inc4c = inc4(mask);
avg4c = avg4(mask);
favg4 = min(avg4c) + ((max(avg4c) - min(avg4c))./2);

Wm1 = sum(avg1 .* 10 .* pi ./ 180)%numerical integration equation
Wm2 = sum(avg2 .* 10 .* pi ./ 180)%numerical integration equation
Wm3 = sum(avg3 .* 10 .* pi ./ 180)%numerical integration equation
Wm4 = sum(avg4 .* 10 .* pi ./ 180)%numerical integration equation

Wm1_c = sum(avg1c .* 10 .* pi ./ 180)%W friction
Wm2_c = sum(avg2c .* 10 .* pi ./ 180)%W friction
Wm3_c = sum(avg3c .* 10 .* pi ./ 180)%W friction
Wm4_c = sum(avg4c .* 10 .* pi ./ 180)%W friction

% W1_p = sum((avg1c - min(avg1c)) .* 10 .* pi ./ 180)%W piston
% W2_p = sum((avg2c - min(avg2c)) .* 10 .* pi ./ 180)%W piston
% W3_p = sum((avg3c - min(avg3c)) .* 10 .* pi ./ 180)%W piston
% W4_p = sum((avg4c - min(avg4c)) .* 10 .* pi ./ 180)%W piston
inc1(end)

Tfric = mean([favg1 , favg2 , favg3]) 

Wfric1 = (Tfric .* 10 .*pi ./180).* inc1(end)
Wfric2 = (Tfric .* 10 .*pi ./180).* inc2(end)
Wfric3 = (Tfric .* 10 .*pi ./180).* inc3(end)
Wfric4 = (favg4 .* 10 .*pi ./180).* inc4(end)

Wmavg = mean([Wm1,Wm2,Wm3]);
Wfricavg = mean([Wfric1,Wfric2,Wfric3]);
wfly1 = inc1(end)./3
wfly2 = inc2(end)./3
wfly3 = inc3(end)./3
wfly4 = inc4(end)./3
wflyavg = mean([wfly1,wfly2,wfly3])

Iflywith = 2.*(Wmavg+Wfricavg)./(wflyavg.^2)
Iflyno = 2.*(Wm4+Wfric4)./(wfly4.^2)
I_fly = (Iflywith - Iflyno).*(4/3)



