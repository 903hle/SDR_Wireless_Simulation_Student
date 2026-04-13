function PHY = PHYParaLoadSingleCarrierUSRP(PHY)
LabName = PHY.LabName;

%% Default Parameters======================================================
%------Transmission Parameters------------%
PHY.TX.config.Numbits = 500;              % # of simulated input bits
PHY.TX.config.SampRate = 4E6;             % [Hz] TX sampling rate
PHY.TX.config.Oversampfac = 10;           % TX oversampling factor
PHY.TX.config.CHCodingOn = 0;
PHY.TX.config.CHCoding.Mode = '';         % Channel codeing mode [repetition]; [convolution]
PHY.TX.config.ModType = 'QPSK';           % Modulation type
PHY.TX.config.SymOrder = 'gray';
PHY.TX.config.Es = 1;                     % Symbol energy
PHY.TX.config.Training.ZeroLen = 16;      % Zero-pad number (For better FrameSync)
PHY.TX.config.Training.Mode = 'BC11';     % Traning sequence selection
PHY.TX.config.PSOn = 1;                   % Turn on pulse shaping 
PHY.TX.config.PS.Type = 'sqrc';           % Pulse shaping filter selection
PHY.TX.config.PS.FilterCoef = 0.5;        % PS filter rolloff coefficient
PHY.TX.config.PS.Filterlen = 8;          % PS filter length

%--------Channel Parameters---------------%
PHY.CH.config.Model = 'AWGN';             % Channel model
PHY.CH.config.SNRdB   = 100;              % [dB] SNR in AWGN
PHY.CH.config.ChannelResponse = [];       % ISI channel response
PHY.CH.config.FreqOffset = 0;             % [Hz]  Predefined CFO deviation
PHY.CH.config.TimeOffset = 0;             % [s] Predefined symbol timing deviation
PHY.CH.config.ZeroPad = PHY.TX.config.Numbits * PHY.TX.config.Oversampfac;

%--------Receiver Parameters--------------%
PHY.RX.config.SampRate       = 4E6;       % [Hz] RX sampling rate
PHY.RX.config.Oversampfac    = 10;        % RX oversampling factor
PHY.RX.config.MachedFilterOn = 1;         % Turn on matched filter
PHY.RX.config.SyncMode       = 'Timing Estimation'; % 
PHY.RX.config.TimeSyncOn     = 1;         % Turn on sample sync
PHY.RX.config.TimeSyncMode   = 'MaxEnergy'; % Sample sync mode
PHY.RX.config.FrameSyncMode  = 'Sliding Correlator';   % Frame sync mode [Sliding Correlator]; [Self Reference]; [Fixed]
PHY.RX.config.FrameSyncSet   = 49;        % Set a fixed frame offset when framsync mode is fixed: 41 for MF off 49; for MF
PHY.RX.config.FreqSyncSet    = 0;         % Set a fixed freq offset when framsync mode is fixed
PHY.RX.config.FreqSyncOn     = 1;         % Turn on CFO sync
PHY.RX.config.EqualizerOn    = 1;         % Turn on equalization
PHY.RX.config.EqualizerLen   = 8;         % Equalizer length
PHY.RX.config.EqualizerDelay = -1;        % Equalizer delay
PHY.RX.config.ChannelDecodingMode = '';   % Channel deocding mothod 
PHY.RX.config.ChannelEstLen  = 4;         % Channel length estimation

switch LabName
    case {'Lab1','Lab2-1'}
    case {'Lab3'}
        PHY.CH.config.Model = 'AWGN+ISI'; 
        PHY.CH.config.ChannelResponse = [0.75*exp(j*pi/4)];
        PHY.TX.config.SampRate = 20E6; 
        PHY.TX.config.Oversampfac = 20;
        PHY.RX.config.SampRate = 2e6;
        PHY.RX.config.Oversampfac  = 2;

    case {'Lab4'}
        PHY.CH.config.Model = 'AWGN+ISI';
        PHY.CH.config.ChannelResponse = [1];
        PHY.RX.config.EqualizerOn    = 1;
    case{'Lab5'}
        PHY.RX.config.FrameSyncMode  = 'Sliding Correlator';

end