function PHY = PHYMatchedfilter(PHY)
% ===========Input Paramters============%
s_in = PHY.RX.ReceivedSymbol;
PStype     = PHY.TX.config.PS.Type;
filter_len = PHY.TX.config.PS.Filterlen;
PScoef = PHY.TX.config.PS.FilterCoef;
sps_rx        = PHY.RX.config.Oversampfac;
MFOn       = PHY.RX.config.MachedFilterOn;
%=======================================%

if MFOn
    rn = sub_matchedfilter(s_in, PStype, filter_len, sps_rx, PScoef);
else 
    rn = s_in;
end



% ===========Output Paramters============%
PHY.RX.ReceivedSymbolMF = rn;
%========================================%