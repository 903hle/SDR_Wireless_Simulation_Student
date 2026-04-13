function PHY = PHYRXADC(PHY)
% ===========Input Paramters============%
Fs_tx = PHY.TX.config.SampRate;
Fs_rx = PHY.RX.config.SampRate;
s_in  = PHY.TX.trchannel;
%=======================================%

fac = Fs_tx / Fs_rx;
s_out = s_in(1:fac:end);

% ===========Output Paramters============%
PHY.RX.ReceivedSymbol = s_out;
%========================================%