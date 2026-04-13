%--------------------------------------------------------------------------
%   MATLAB simulation for Wireless Communication Lab
%   (OFDM: Lab6-Lab8)
%   Ref: DIGITAL COMMUNICATIONS PHYSICAL LAYER EXPLORATION LAB USING THE NI
%   USRP™ PLATFORM (Robert W. Heath)
%
%   Author: C.H.Chen
%--------------------------------------------------------------------------
clear all;
addpath('./commlib');
addpath('./OFDM_lib')
addpath('./wrap')

%% Hyperparameters Definition===================================================
PHY.LabName = 'Lab6'; % {Lab6, Lab7, Lab8}
%--------Default Parameters--------------%
PHY = PHYParaLoadOFDM(PHY);
%--------Self-defined Parameters---------%
PHY.RX.config.FigShow = 1;
PHY.RX.config.FrameSyncMode  = 'SCA_opt';
%--------Derived Parameters--------------%
PHY = PHYParaInit(PHY);

%% Transmitter=============================================================
PHY = PHYSource(PHY); % Generating random bit sequence
PHY = PHYEncode(PHY); % Channel encoding
PHY = PHYModulate(PHY); % Symbol modulation
PHY = PHYOFDMmodulate(PHY); % OFDM modulation
PHY = PHYOFDMAddcontrol(PHY); % Add training sequences
PHY = PHYPulseshaping(PHY); % Upsample and pulse shapping
%% Communication channels==================================================
PHY = PHYApplyChannel(PHY);

%% Receiver================================================================
PHY = PHYRXADC(PHY);
PHY = PHYMatchedfilter(PHY);     % Matched Filtering
PHY = PHYOFDMSync(PHY);          % OFDM Synchronization
PHY = PHYOFDMChannelEst(PHY);    % OFDM Channel Estimation
PHY = PHYOFDMStripControl(PHY);  % Crop the OFDM Symbols
PHY = PHYOFDMDemodulate(PHY);    % OFDM demodulation
PHY = PHYOFDMDecoding(PHY);      % Demodulation and Decoding
PHY = PHYChannelDecoding(PHY);   % Channel decoding


%% Display=================================================================
PHYPerformanceOFDM(PHY)

