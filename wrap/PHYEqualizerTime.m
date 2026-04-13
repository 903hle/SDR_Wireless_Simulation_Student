function PHY = PHYEqualizerTime(PHY)
% ===========Input Paramters============%
Nt        = PHY.TX.strainingLen;
tr_seq    = PHY.TX.straining ;
rn        = PHY.RX.ReceivedSymbolAllSync;
Lf        = PHY.RX.config.EqualizerLen;
nd        = PHY.RX.config.EqualizerDelay;
EQ        = PHY.RX.config.EqualizerOn;
%=======================================%

if EQ 
    [rn_eq, h_est, nd_est] = sub_equalization(rn, tr_seq, Lf, nd, Nt);
else
    [~, h_est, nd_est] = sub_equalization(rn, tr_seq, Lf, nd, Nt);
    rn_eq = rn;  
end

% ===========Output Paramters============%
PHY.RX.ReceivedSymbolAllSyncEQ = rn_eq;
PHY.RX.EstEQDelay = nd_est;
PHY.RX.EstChannel = h_est;
%========================================%