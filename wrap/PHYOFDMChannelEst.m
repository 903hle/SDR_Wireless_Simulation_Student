function PHY = PHYOFDMChannelEst(PHY)
% ===========Input Paramters============%
tr_seq    = PHY.TX.straining ;
TrSeqMode = PHY.TX.config.Training.Mode;
Nfft_tr   = PHY.TX.config.Training.Nfft;
Ncp_tr    = PHY.TX.config.Training.Ncp;
Lh        = PHY.RX.config.ChannelEstLen;
rn        = PHY.RX.ReceivedSymbolAllSync;
%=======================================%

switch TrSeqMode
    case 'BC11'
        h_est = sub_channelestimate_bc11(rn, tr_seq, Ncp_tr, Nfft_tr, Lh);
    case 'IEEE80211a'
        h_est = sub_channelestimate_ieee80211a(rn, tr_seq, Ncp_tr, Nfft_tr, Lh);
end
% ===========Output Paramters============%
PHY.RX.EstChannelResTD = h_est;
%========================================%
