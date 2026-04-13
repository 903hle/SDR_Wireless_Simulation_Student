function PHY = PHYDecoding(PHY)
% ===========Input Paramters============%
mod_type = PHY.TX.config.ModType;
yn       = PHY.RX.ReceivedSymbolStrip;
%=======================================%

bits_est = sub_decode(yn, mod_type);

% ===========Output Paramters============%
PHY.RX.EstBits = bits_est;
%========================================%
