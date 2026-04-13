function PHY = PHYOFDMmodulate(PHY)

% ===========Input Paramters============%
null_idx = PHY.TX.config.OFDM.NullIdx;
Nfft = PHY.TX.config.OFDM.Nfft;
Ncp  = PHY.TX.config.OFDM.Ncp;
s_in = PHY.TX.Symbols;
%=======================================%

s_out = sub_OFDMmodulate(s_in, null_idx, Nfft, Ncp);
Ns = length(s_out);

% ===========Output Paramters============%
PHY.TX.OFDMsymbols = s_out;
PHY.TX.OFDMsymbolLen = Ns;
%========================================%

