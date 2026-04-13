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
addpath('./wrap')

%% Hyperparameters Definition===================================================
PHY.LabName = 'Lab3';
load(['Received_DataStructure_' PHY.LabName])
rng(1,'philox')
PHY = PHYGetTxPara(PHY);

%--------Self-defined Parameters---------%
PHY.RX.config.FigShow = 1;
%--------Initialize other Parameters-----%
PHY = PHYParaInit(PHY);

%% Select frame to process================================================
nn = 33;
PHY.RX.ReceivedSymbol = PHY.RX.ReceivedSymbolAllFrame(:,nn);

%% Receiver================================================================
PHY = PHYMatchedfilter(PHY);     % Matched Filtering
PHY = PHYSync(PHY);              % Synchronization (Timing, Frame, Freq)
PHY = PHYEqualizerTime(PHY);     % Time Domain Qqualizer
PHY = PHYStripControl(PHY);      % Crop Symbols
PHY = PHYDemodulate(PHY);        % Demodulation
PHY = PHYChannelDecoding(PHY);   % Channel Decoding

%% Display=================================================================
PHYPerformance(PHY)
pause(0.3)
