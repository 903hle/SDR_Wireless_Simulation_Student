%--------------------------------------------------------------------------
%   MATLAB simulation for Wireless Communication Lab 
%   (single carrier: Lab1-Lab5)
%   Ref: DIGITAL COMMUNICATIONS PHYSICAL LAYER EXPLORATION LAB USING THE NI
%   USRP� PLATFORM (Robert W. Heath)
%
%   Author: C.H.Chen
%--------------------------------------------------------------------------
clear all;restoredefaultpath
addpath('./commlib');
addpath('./wrap')

%% Hyperparameters Definition===================================================
PHY.LabName = 'Lab2-2'; % {Lab1, Lab2-1, Lab2-2, Lab3, Lab4, Lab5}
%--------Default Parameters--------------%
PHY = PHYParaLoadSingleCarrier(PHY);
%--------Self-defined Parameters---------%
PHY.RX.config.FigShow = 1;
%--------Derived Parameters--------------%
PHY = PHYParaInit(PHY);

%% Transmitter=============================================================
PHY = PHYSource(PHY);       % Generating Random Bit Sequence
PHY = PHYEncode(PHY);       % Channel Encoding
PHY = PHYModulate(PHY);     % Symbol Modulation
PHY = PHYAddcontrol(PHY);   % Add Training Sequence
PHY = PHYPulseshaping(PHY); % Upsample and Pulse shapping

%% Communication channels==================================================
PHY = PHYApplyChannel(PHY);
% PHYTxShow(PHY)

%% Receiver================================================================
PHY = PHYRXADC(PHY);
PHY = PHYMatchedfilter(PHY);     % Matched Filtering
PHY = PHYSync(PHY);              % Synchronization (symbol, frame, freq)
PHY = PHYEqualizerTime(PHY);     % Time Domain Equalizer
PHY = PHYStripControl(PHY);      % Crop Frame
PHY = PHYDemodulate(PHY);        % Demodulation
PHY = PHYChannelDecoding(PHY);   % Channel decoding

%% Display=================================================================
PHYPerformance(PHY)

