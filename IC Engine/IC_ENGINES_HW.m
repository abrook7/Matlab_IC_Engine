%%
clear all
clc
%% HW IC Engine
%aidan brook

%load data
data = xlsread('IC Engines HW');
load('icengine');

%segment data into separate vectors
time0 = data(1:end,1);
encoder_angle0 = data(1:end,2);
encoder_angle = encoder_angle0 .* (pi ./180);%convert to radians
time1 = data(1:end,3);
ft_volt = data(1:end,4);
increment = data(1:1101,5);
index = data(1:1101,6);

%initialize variables
time_index = [];
encoder_angle_index = [];
inc = [];

%segment 10 degree sections based on the increments/indexs given
for n = 2:length(increment)-1
    t = time0(index(n),1);
    ea = encoder_angle(index(n),1);
    e = increment(n,1).* 10 .*(pi./180);
    
    %add to vectors
    time_index = [time_index; t];
    encoder_angle_index = [encoder_angle_index; ea];
    inc = [inc;e];
end



%plotting fig1a angular position vs time
figure(1)
hold on
grid on
plot(time0,encoder_angle,'b')
xlabel('Time [s]')
ylabel('Angular Position [rad]')
legend('Angular Position')
hold off

%plotting fig1bc incremented angle & angle vs time
figure(2)
hold on
grid on
plot(time_index,inc,'c-o')
plot(time_index,encoder_angle_index,'b-o')
xlabel('Time [s]')
ylabel('Angular Position [rad]')
legend('Incremented Angle','Angle')
xlim([.4 1]);
hold off


%% part 2 & 3

%original code used to find voltage offset
%voltage = voltage - voltage(1);

%original code used to visualize the voltage vs torque data
%figure(6)
%plot(voltage,torque,'k-o')

%ft_volt = ft_volt .* 10; %units
%voltage = voltage .* 10; %units

[x,y] = polyfit(voltage,torque,1);%lin reg to find gain
T = x(1).* (-ft_volt + (-voltage(1)));%calculate torque using gain and adding initial offset voltage

%plotting fig2a motor torque
figure(3)
plot(time1,T,'k-')
xlabel('Time [s]')
ylabel('Motor Torque [N*m]')
legend('Motor Torque')

avg = mean(T(21051:1:index(2),1)); %initialize variable and take first 0.4 seconds out

%avg torque vals between 10 deg indicies
for n = 3:length(increment)-1
    a = mean(T(index(n-1)+1:1:index(n),1));
    
    avg = [avg; a];
    
end

%plot fig 2b
figure(4)
plot(time_index,avg,'b.-')
xlabel('Time [s]')
ylabel('Motor Torque [N*m]')
legend('Averaged Torque')

%plot fig 3
figure(5)
plot(inc,avg,'b.-')
xlabel('Angular Position [rad]')
ylabel('Motor Torque [N*m]')
legend('Averaged Torque')

%% part 4

Wm = sum(avg .* 10 .* pi ./ 180)%numerical integration equation

%% part 5 Uncertainty

%Elvis analog input voltage uncertainty eqs
    Rvft = 20./ (2.^14); %resolution
    Pvft = Rvft ./ 2; %precision
    Upvft = Pvft ./ sqrt(6); %precision uncertainty
    Uavft = abs(0.00064 .* 10) + 0.00004 .* 20; %accuracy uncertainty
Ucvft = sqrt((Upvft.^2)+(Uavft.^2)) %combined uncertainty

%calibration mass uncertainty
    Rm = 0.0001;%resolution
    Pm = Rm ./2;%precision
    Upm = Pm ./sqrt(3);%precision uncertainty
    Uam = 0.00015;%accuracy uncertainty
Ucm = sqrt((Upm.^2) + (Uam.^2))%combined uncertainty

%Digital Calipers Uncertainty
    Rcalip = 0.00001;%resolution
    Pcalip = Rcalip./2;%precision
    Upcalip = Pcalip./sqrt(3);%precision uncertainty
    Uacalip = 0.00003;%accuracy uncertainty
Uccalip = sqrt((Upcalip.^2) + (Uacalip.^2))%combined uncertainty

%initializing variables
g = 9.81; %gravity
mcal = .2262; %mass of 1 weight
La = 0.127; %length of calibration arm

%Calibration Torque Uncertainty
    Tcal = mcal .* g .* La; %Torque Applied to Torque Transducer
    dtdm = g .* La; %Partial of T_cal with respect to m_cal
    dtdg = mcal .* La; %Partial of T_cal with respect to g
    dtdl = mcal .* g; %Partial of T_cal with respect to L_a
    Ucg = 0; %acceleration due to gravity uncertainty
Uctcal= sqrt(((dtdm .*Ucm).^2)+ ((dtdl.*Uccalip).^2)) %combined uncertainty

%Calibration York Regression Uncertainties
    Ucy = Uctcal;
    Ucx = Ucvft;
    Y = Tcal;
    %X = ft_volt;
% York Linear Regression: [Intercept, Slope, Uc_Intercept, Uc_Slope] = york_fit(X, Y, Uc_X, Uc_Y)
%[B, M, UcTO, UcG] = york_fit(X, Y, Ucx, Ucy);
 


%not sure where the rest of this went














