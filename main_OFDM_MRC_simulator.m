%--------------------------------------------------------------------------
%   MATLAB simulation for Wireless Communication Lab
%   (OFDM+MRC: Lab9)
%   Ref: DIGITAL COMMUNICATIONS PHYSICAL LAYER EXPLORATION LAB USING THE NI
%   USRP™ PLATFORM (Robert W. Heath)
%
%   Developed by C.H.Chen
%   Last modification: 15/06/2023
%--------------------------------------------------------------------------
clear all;
addpath('./commlib');
addpath('./wrap')
addpath('./OFDM_lib')

%% Hyperparameters Definition===================================================
PHY.LabName = 'Lab9';
%--------Default Parameters--------------%
PHY = PHYParaLoadOFDMMRC(PHY);
%--------Self-defined Parameters---------%
PHY.RX.config.AntNum = 2;
PHY.CH.config.SNRdB   = 0;

%--------Derived Parameters---------%
PHY.CH.config.ChannelResponse = ...
    ( randn(PHY.RX.config.AntNum,1) + 1j *randn(PHY.RX.config.AntNum,1) ) /sqrt(2);
% PHY.CH.config.ChannelResponse = ones(PHY.RX.config.AntNum,1);

PHY = PHYParaInit(PHY);
rng(1,'twister')
%% Transmitter=============================================================
PHY = PHYSource(PHY); % Generating random bit sequence
PHY = PHYEncode(PHY); % Channel encoding
PHY = PHYModulate(PHY); % Symbol modulation
PHY = PHYOFDMmodulate(PHY);   % OFDM modulation
PHY = PHYOFDMAddcontrol(PHY); % Add training sequences
PHY = PHYPulseshaping(PHY);   % Upsample and pulse shapping

%% Communication channels==================================================
PHY = PHYApplyChannelMRC(PHY);

%% Receiver================================================================
PHY = PHYRXADCMRC(PHY);             % Simulate Receiver AD                        
PHY = PHYMatchedfilterMRC(PHY);     % Matched Filtering
PHY = PHYOFDMSyncMRC(PHY);          % OFDM Synchronization
PHY = PHYOFDMChannelEstMRC(PHY);    % OFDM Channel Estimation
PHY = PHYOFDMStripControlMRC(PHY);  % Crop the OFDM Symbols
PHY = PHYOFDMDemodulateMRC(PHY);    % OFDM demodulation
PHY = PHYOFDMDecoding(PHY);         % Demodulation and Decoding
PHY = PHYChannelDecoding(PHY);      % Channel decoding

%% Display=================================================================
PHYPerformanceOFDMMRC(PHY)


