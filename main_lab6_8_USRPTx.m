%--------------------------------------------------------------------------
%   MATLAB simulation for Wireless Communication Lab
%   (OFDM: Lab6-Lab8)
%   Ref: DIGITAL COMMUNICATIONS PHYSICAL LAYER EXPLORATION LAB USING THE NI
%   USRP™ PLATFORM (Robert W. Heath)
%
%   Developed by C.H.Chen
%   Last modification: 21/11/2022
%--------------------------------------------------------------------------
clear all;
addpath('./commlib');
addpath('./OFDM_lib/')
addpath('./wrap')

%% Hyperparameters Definition===================================================
PHY.LabName = 'Lab8';
%--------Predefined Parameters-----------%
PHY = PHYParaLoadOFDMUSRP(PHY);
%--------Self-defined Parameters---------%
PHY.HW.config.addrtx = '192.168.10.5';
%--------Initialize other Parameters-----%
PHY = PHYParaInit(PHY);

%% Transmitter=============================================================

%% Transmitter=============================================================
rng(1,'philox');
PHY = PHYSource(PHY); % Generating random bit sequence
PHY = PHYEncode(PHY); % Channel encoding
PHY = PHYModulate(PHY); % Symbol modulation
PHY = PHYOFDMmodulate(PHY); % OFDM modulation
PHY = PHYOFDMAddcontrol(PHY); % Add training sequences
PHY = PHYPulseshaping(PHY); % Upsample and pulse shapping
PHY = PHYApplyChannel(PHY); % Simulated Channels
PHYTxShow(PHY);             % Show transmitted waveform

%% USRP Tx Connect=========================================================
%--------Hardware Parameters-------------%
PHY = PHYHWParaLoad(PHY);
%--------Connect to USRP-------------%
PHY = PHYUSRPTxConnect(PHY);

%% USRP Tx Transmit========================================================
PHYUSRPTxTransmit(PHY);

%% Release resources=======================================================
release(PHY.HW.radiotx);
