%--------------------------------------------------------------------------
%   MATLAB simulation for Wireless Communication Lab 
%   (single carrier: Lab1-Lab5)
%   Ref: DIGITAL COMMUNICATIONS PHYSICAL LAYER EXPLORATION LAB USING THE NI
%   USRP™ PLATFORM (Robert W. Heath)
%
%   Developed by C.H.Chen
%   Last modification: 12/04/2023
%--------------------------------------------------------------------------
clear all;
addpath('./commlib');
addpath('./wrap')

%% Hyperparameters Definition===================================================
PHY.LabName = 'Lab3';
%--------Predefined Parameters-----------%
PHY = PHYParaLoadSingleCarrierUSRP(PHY);

%--------Self-defined Parameters---------%
PHY.TX.config.Numbits = 200;
PHY.CH.config.SNRdB = 10;
PHY.TX.config.ModType = 'QPSK';
PHY.HW.config.addrtx = '192.168.10.5';

%--------Initialize other Parameters-----%
PHY = PHYParaInit(PHY);

%% Transmitter=============================================================
rng(1,'philox')
PHY = PHYSource(PHY);       % Random Bit Sequence Generation
PHY = PHYEncode(PHY);       % Channel Encoding
PHY = PHYModulate(PHY);     % Symbol Modulation
PHY = PHYAddcontrol(PHY);   % Addrel Training Sequence
PHY = PHYPulseshaping(PHY); % Upsample and Pulse Shapping
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


