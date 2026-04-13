function PHY = PHYUSRPTxConnect(PHY)
% ===========Input Paramters============%
tx_data       = PHY.TX.trchannel;
fctx          = PHY.HW.config.fctx; % in Hz
gaintx        = PHY.HW.config.gaintx;
master_clock  = PHY.HW.config.master_clock; % USRP2: 100e6 (default; read-only)
intp_factor   = PHY.HW.config.intp_factor;
addresstx     = PHY.HW.config.addrtx;
%=======================================%
% Find devices connected to host computer----------------------------------
connectedRadios = findsdru
platform = 'N200/N210/USRP2';

% System object (Tx)------------------------------------------------------
radio_tx = comm.SDRuTransmitter(...
    'Platform',             platform, ...
    'IPAddress',            addresstx, ...
    'MasterClockRate',      master_clock, ...
    'Gain',                 gaintx, ...
    'CenterFrequency',      fctx, ...
    'InterpolationFactor',  intp_factor, ...
    'TransportDataType',  'int16');

info(radio_tx)


% ===========Output Paramters============%
PHY.HW.radiotx = radio_tx;
%=======================================%