function PHY = PHYParaLoadOFDMUSRP(PHY)
LabName = PHY.LabName;

%% Default Parameters======================================================
%------Transmission Parameters-------%
PHY.TX.config.Numbits = 1000;                                              % # of simulated input bits
PHY.TX.config.SampRate = 4E6;
PHY.TX.config.Oversampfac = 10;                                            % Oversampling factor
PHY.TX.config.CHCodingOn = 0;
PHY.TX.config.ModType = 'QPSK';                     % Modulation type
PHY.TX.config.SymOrder = 'gray';
PHY.TX.config.Es = 1;                                                      % Symbol energy
PHY.TX.config.CHCoding.Mode = '';
% Parameter setting for repitition code-------------------
PHY.TX.config.CHCoding.trellis = [];
PHY.TX.config.CHCoding.Rep.Num = 1;
PHY.TX.config.OFDM.Nfft = 64;
PHY.TX.config.OFDM.Ncp  = 8;
PHY.TX.config.OFDM.NullIdx = [1 32 33 34];
PHY.TX.config.Training.ZeroLen = 8;
PHY.TX.config.Training.Nfft = 64;
PHY.TX.config.Training.Ncp = 16;
PHY.TX.config.Training.Mode = 'IEEE80211a';%'BC11';
PHY.TX.config.PSOn = 1;
PHY.TX.config.PS.Type = 'sqrc';
PHY.TX.config.PS.Filterlen = 8;
PHY.TX.config.PS.FilterCoef = 0.5;

%--------Channel Parameters---------%
PHY.CH.config.Model = 'AWGN';
PHY.CH.config.SNRdB   = 20; % (dB)
PHY.CH.config.ChannelResponse = [];
PHY.CH.config.FreqOffset = 0;
PHY.CH.config.TimeOffset = 0;
PHY.CH.config.ZeroPad = fix(PHY.TX.config.Numbits * PHY.TX.config.Oversampfac / 2);
% PHY.CH.config.ZeroPad = 0;

%--------Receiver Parameters---------%
PHY.RX.config.SampRate = 4E6;
PHY.RX.config.Oversampfac = 10;
PHY.RX.config.MachedFilterOn = 1;
PHY.RX.config.SyncMode     = 'Timing Estimation'; % [Fixed Offset]; [Timing Estimation]; [Joint Timing and ChannelEst]
PHY.RX.config.TimeSyncOn   = 1;
PHY.RX.config.TimeSyncMode = 'MaxEnergy';
PHY.RX.config.FrameSyncMode  = 'SCA_opt'; % [Optimal]; [Sliding Correlator]; [SCA]; [SCA_opt]; [Fixed]
PHY.RX.config.FreqSyncOn = 1;
PHY.RX.config.OFDM.FEQOn = 1;
PHY.RX.config.DemodMode = 'bit';
PHY.RX.config.LLRQuantization = 'double';
PHY.RX.config.ChannelEstLen = 4;



switch LabName
    case {'Lab6'}

    case {'Lab7'}
       PHY.TX.config.Training.Mode = 'IEEE80211a';
    case {'Lab8'}
       PHY.TX.config.CHCodingOn = 1;
       PHY.TX.config.CHCoding.Mode = 'convolutional';
       
       PHY.TX.config.SampRate = 20e6;
       PHY.TX.config.Oversampfac = 8;
       PHY.RX.config.SampRate = 10e6;
       PHY.RX.config.Oversampfac = 4;
       PHY.TX.config.Numbits = 1000;

end