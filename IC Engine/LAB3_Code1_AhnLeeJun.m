% function LAB3_Code1_AhnLeeJun
%% Lab 3 [IC Engine] Plots & Calculations
% Marina Ahn [June 16, 2021]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

format compact
format long

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Read Data (Run on open, then comment out for speed)
% 
%     clear
%     clc
%     
%     % Calibration Data [voltage, weight] [V, g]
%         caldata = readmatrix('ICE_Week1_Data.xlsx', 'Sheet', ...
%             'Calibration Equation', 'Range', 'A2');
%     % Remove empty columns
%         caldata = caldata(:,1:2);
%     % Convert weight from grams to kg
%         caldata(:,2) = caldata(:,2) ./ 1000;
%     % Low RPM [t, angle, 10deg inc, idx, bucketidx, 10deg buckets, t, V_FT]
%         lowRPM = readmatrix('ICE_Week1_Data.xlsx', 'Sheet', ...
%             'LowRPM_Flywheel', 'Range', 'A2');
%     % Med RPM [t, angle, 10deg inc, idx, bucketidx, 10deg buckets, t, V_FT]
%         medRPM = readmatrix('ICE_Week1_Data.xlsx', 'Sheet', ...
%             'MediumRPM_Flywheel', 'Range', 'A2');
%     % High RPM [t, angle, 10deg inc, idx, bucketidx, 10deg buckets, t, V_FT]
%         highRPM = readmatrix('ICE_Week1_Data.xlsx', 'Sheet', ...
%             'HighRPM_Flywheel', 'Range', 'A2');
%     % High RPM 2 [t, angle, 10deg inc, idx, bucketidx, 10deg buckets, t, V_FT]
%         highRPM2 = readmatrix('ICE_Week1_Data.xlsx', 'Sheet', ...
%             'HighRPM_1Flywheel', 'Range', 'A2');

%% Data Vectors
    % Calibration data vectors
        V_cal = caldata(:,1);                   % V
        m_cal = caldata(:,2);                   % kg
        F_cal = m_cal .* g;                     % N
        g = 9.81;                               % m/s^2
        L_a = 0.127;                            % m
        T_cal = m_cal .* g .* L_a;              % N*m
        
    % Low RPM data vectors
        time = lowRPM(:,1);                     % s
        low_angle = lowRPM(:,2);                % deg
        low_10deg_inc = lowRPM(2:1674,3);       % 10 deg inc
        low_idx_inc = lowRPM(1:1674,4);         % #
        low_bukidx = lowRPM(:,5);               % bucket
        low_bucket = lowRPM(:,6);               % deg
        low_VFT = lowRPM(:,8);                  % V
    % Med RPM data vectors
        med_angle = medRPM(:,2);                % deg
        med_10deg_inc = medRPM(2:2175,3);       % 10 deg inc
        med_idx_inc = medRPM(1:2175,4);         % #
        med_bukidx = medRPM(:,5);               % bucket
        med_bucket = medRPM(:,6);               % deg
        med_VFT = medRPM(:,8);                  % V
    % High RPM data vectors
        high_angle = highRPM(:,2);              % deg
        high_10deg_inc = highRPM(2:3013,3);     % 10 deg inc
        high_idx_inc = highRPM(1:3013,4);       % #
        high_bukidx = highRPM(:,5);             % bucket
        high_bucket = highRPM(:,6);             % deg
        high_VFT = highRPM(:,8);                % V
    % High RPM 2 data vectors
        high2_angle = highRPM2(:,2);            % deg
        high2_10deg_inc = highRPM2(2:2215,3);   % 10 deg inc
        high2_idx_inc = highRPM2(1:2215,4);     % #
        high2_bukidx = highRPM2(:,5);           % bucket
        high2_bucket = highRPM2(:,6);           % deg
        high2_VFT = highRPM2(:,8);              % V
    
%% Plot Angular Position vs. Time
    % Generate low RPM plot (angular position vs. time)
            figure(1)
            subplot(2, 2, 1)
            hold on
            grid on
            xlim([0 1.5])
            ylim([0 5000])
            plot(time, low_angle, '.-')
        % Add plot at 10 deg intervals
            low_inctimes = time(low_idx_inc(2:end));
            plot(low_inctimes, low_10deg_inc .*10, '.-')
        % Plot labels
            xlabel('Time [s]')
            ylabel('Encoder Angle [deg]')
            title('Angular Position vs. Time (Low RPM)')
            legend('Angular Position', '10 Degree Intervals')
        hold off

    % Generate med RPM plot (angular position vs. time)
            subplot(2, 2, 2)
            hold on
            grid on
            xlim([0 1.5])
            ylim([0 5000])
            plot(time, med_angle, '.-')
        % Add plot at 10 deg intervals
            med_inctimes = time(med_idx_inc(2:end));
            plot(med_inctimes, med_10deg_inc .*10, '.-')
        % Plot labels
            xlabel('Time [s]')
            ylabel('Encoder Angle [deg]')
            title('Angular Position vs. Time (Med RPM)')
            legend('Angular Position', '10 Degree Intervals')
            hold off
        
    % Generate high RPM plot (angular position vs. time)
            subplot(2, 2, 3)
            hold on
            grid on
            xlim([0 1.5])
            ylim([0 5000])
            plot(time, high_angle, '.-')
        % Add plot at 10 deg intervals
            high_inctimes = time(high_idx_inc(2:end));
            plot(high_inctimes, high_10deg_inc .*10, '.-')
        % Plot labels
            xlabel('Time [s]')
            ylabel('Encoder Angle [deg]')
            title('Angular Position vs. Time (High RPM)')
            legend('Angular Position', '10 Degree Intervals')
            hold off
        
    % Generate high RPM 2 plot (angular position vs. time)
            subplot(2, 2, 4)
            hold on
            grid on
            xlim([0 1.5])
            ylim([0 5000])
            plot(time, high2_angle, '.-')
        % Add plot at 10 deg intervals
            high2_inctimes = time(high2_idx_inc(2:end));
            plot(high2_inctimes, high2_10deg_inc .*10, '.-')
        % Plot labels
            xlabel('Time [s]')
            ylabel('Encoder Angle [deg]')
            title('Angular Position vs. Time (High RPM 2)')
            legend('Angular Position', '10 Degree Intervals')
            hold off
        
%% Torque Calibration Equation & Uncertainties
    % Voltage Uncertainty
        R_V = 20/(2^14);
        P_V = R_V/2;
        U_p_V = P_V/sqrt(3);
        U_a_V = 0.0064 + (0.00004*20);
        U_c_V = sqrt((U_a_V^2) + (U_p_V^2));
    % Calibration Mass Uncertainty
        R_m = 0.0001;
        P_m = R_m/2;
        U_p_m = P_m/sqrt(3);
        U_a_m = 0.00015;
        U_c_m = sqrt((U_a_m^2) + (U_p_m^2));
    % Digital Calipers Uncertainty
        R_calip = 0.00001;
        P_calip = R_calip/2;
        U_p_calip = P_calip/sqrt(6);
        U_a_calip = 0.00003;
        U_c_calip = sqrt((U_p_calip^2) + (U_a_calip^2));
    % Calibration Torque Uncertainty
        T_cal_partial1 = g .* L_a;
        T_cal_partial2 = m_cal .* L_a;
        T_cal_partial3 = m_cal .* g;
        U_c_g = 0;
        U_c_Tcal = sqrt((T_cal_partial1 .* U_c_m^2) + ...
            (T_cal_partial2 .* U_c_g^2) + (T_cal_partial3 .* U_c_calip^2));
    % York Regression
        [T_0, G, U_c_T0, U_c_G] = ...
            york_fit(V_cal, T_cal, U_c_V, U_c_Tcal);
        T_s = G .* V_cal + T_0;
        
%     % Calibration Plot
%         figure(2)
%         hold on
%         grid on
%         plot(V_cal, T_cal, 'b.')
%         plot(V_cal, T_s, 'r')
% %         plot(V_cal, G .* (V_cal + T_0), 'r.')
%         legend('Uncalibrated Data', ['T = ', num2str(G), 'x + ', num2str(T_0)])
%         title('Week 1 Calibration')
%         xlabel('Voltage [V]')
%         ylabel('Torque [N\cdotm]')
% %         ylabel('Force [N]')
%         hold off        
        
%% Torque vs. Time
        t = lowRPM(:,1);
        T_low = G .* (-low_VFT) + T_0;
        T_med = G .* (-med_VFT) + T_0;
        T_high = G .* (-high_VFT) + T_0;
        T_high2 = G .* (-high2_VFT) + T_0;
        
    % Generate low RPM plot (torque vs. time)
            figure(3)
            subplot(2, 2, 1)
            hold on
            grid on
            plot(t, T_low)
        % Plot labels
            xlabel('Time [s]')
            ylabel('Torque [N\cdotm]')
            title('Torque vs. Time (Low RPM)')
            hold off
        
    % Generate med RPM plot (torque vs. time)
            figure(3)
            subplot(2, 2, 2)
            hold on
            grid on
            plot(t, T_med)
        % Plot labels
            xlabel('Time [s]')
            ylabel('Torque [N\cdotm]')
            title('Torque vs. Time (Med RPM)')
            hold off

    % Generate high RPM plot (torque vs. time)
            figure(3)
            subplot(2, 2, 3)
            hold on
            grid on
            plot(t, T_high)
        % Plot labels
            xlabel('Time [s]')
            ylabel('Torque [N\cdotm]')
            title('Torque vs. Time (High RPM)')
            hold off
            
    % Generate high RPM 2 plot (torque vs. time)
            figure(3)
            subplot(2, 2, 4)
            hold on
            grid on
            plot(t, T_high2)
        % Plot labels
            xlabel('Time [s]')
            ylabel('Torque [N\cdotm]')
            title('Torque vs. Time (High RPM 2)')
            hold off
            
%% Averaged Torque & Plot
    % Initialize time interval vector and torque average vector
        timesplit = ones(length(intervaltimes), 1);
        torque_avg = ones(length(timesplit)-1, 1);
    % Designate time intervals
        for i = 1:length(intervaltimes)
            timesplit(i) = find(time > intervaltimes(i), 1);
        end
    % Average torque values according to 10 degree intervals
        for i = 1:(length(timesplit) - 1)
            torque_avg(i) = mean(torque_eqn(timesplit(i):timesplit(i+1)));
        end
    % Generate plot (averaged torque vs. time)
        figure(3)
        hold on
        grid on
        plot(time(timesplit(3:end)), torque_avg(2:end))
        xlabel('Time [s]')
        ylabel('Averaged Torque [N\cdotm]')
        title('Averaged Torque vs. Time')
        legend('Averaged Torque')
    % Generate plot (averaged torque vs. angular position, 10deg intervals)
        figure(4)
        hold on
        grid on
        plot(increment_10deg(3:end).*10, torque_avg(2:end), '.-')
        xlabel('Angular Position [deg]')
        ylabel('Averaged Torque [N\cdotm]')
        title('Averaged Torque vs. Angular Position')
        legend('Averaged Torque')

%% 
        
        