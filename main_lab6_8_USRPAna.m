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
load('Received_DataStructure_Lab8')
%% Hyperparameters Definition===================================================
PHY.LabName = 'Lab8';
% Make sure that the transmitted is using to same random seed for generating data
rng(1,'philox')
PHY = PHYOFDMGetTxPara(PHY);

%--------Self-defined Parameters---------%
PHY.RX.config.FigShow = 1;

%--------Initialize other Parameters-----%
PHY = PHYParaInit(PHY);

%% Select frame to process================================================
nn = 29;
PHY.RX.ReceivedSymbol = PHY.RX.ReceivedSymbolAllFrame(:,nn);

%% Receiver================================================================
PHY = PHYMatchedfilter(PHY);     % Matched Filtering
PHY = PHYOFDMSync(PHY);          % OFDM Synchronization
PHY = PHYOFDMChannelEst(PHY);    % OFDM Channel Estimation
PHY = PHYOFDMStripControl(PHY);  % Crop the OFDM Symbols
PHY = PHYOFDMDemodulate(PHY);    % OFDM demodulation
PHY = PHYOFDMDecoding(PHY);      % Demodulation and Decoding
PHY = PHYChannelDecoding(PHY);   % Channel decoding

%% Display=================================================================
PHYPerformanceOFDM(PHY)
pause(0.3)
