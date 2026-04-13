function PHY = PHYOFDMDemodulate(PHY)
% ===========Input Paramters============%
null_idx = PHY.TX.config.OFDM.NullIdx;
Nfft     = PHY.TX.config.OFDM.Nfft;
Ncp      = PHY.TX.config.OFDM.Ncp;
Ns       = PHY.TX.SymbolLen;
rn       = PHY.RX.ReceivedSymbolStrip;
feq      = PHY.RX.config.OFDM.FEQOn;
h_est    = PHY.RX.EstChannelResTD;
%=======================================%

yn = sub_OFDMdemodulate(rn, null_idx, Nfft, Ncp, Ns, h_est, feq);

% ===========Output Paramters============%
PHY.RX.ReceivedSymbolOFDMDemod = yn;
%========================================%
