 %--------------------------------------------------------------------------
%   MATLAB simulation for Wireless Communication Lab
%   (OFDM: Lab6-Lab8)
%   Ref: DIGITAL COMMUNICATIONS PHYSICAL LAYER EXPLORATION LAB USING THE NI
%   USRP™ PLATFORM (Robert W. Heath)
%
%   Developed by C.H.Chen
%   Last modification: 29/11/2022
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
PHY.TX.config.ModType = 'QPSK';
PHY.HW.config.addrrx = '192.168.10.6';
%--------Initialize other Parameters-----%
PHY = PHYParaInit(PHY);

%% Get TX data=============================================================
% Make sure that the transmitted is using to same random seed for generating data
rng(1,'philox')
PHY = PHYGetTxPara(PHY);

%% USRP Rx Connect=========================================================
PHY = PHYHWParaLoad(PHY);
PHY = PHYUSRPRxConnect(PHY);

%% Receive signals using USRP==============================================
PHY = PHYUSRPRxReceiveMulti(PHY);
PHYUSRPRxShowMulti(PHY)

%% Save the data structure=================================================
ffname = ['Received_DataStructure_' PHY.LabName];
save(ffname ,'PHY')

%% Release resources========================================================
release(PHY.HW.radiorx);
