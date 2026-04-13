function PHY = PHYOFDMChannelEstMRC(PHY)
% ===========Input Paramters============%
tr_seq    = PHY.TX.straining ;
TrSeqMode = PHY.TX.config.Training.Mode;
Nfft_tr      = PHY.TX.config.OFDM.Nfft;
Ncp_tr      = PHY.TX.config.OFDM.Ncp;
Lh        = PHY.RX.config.ChannelEstLen;
rn        = PHY.RX.ReceivedSymbolAllSync;
AntNum    = PHY.RX.config.AntNum;
%=======================================%
for kk = 1 : AntNum
    switch TrSeqMode
    case 'BC11'
        h_est(:,kk) = sub_channelestimate_bc11(rn(:,kk), tr_seq, Ncp_tr, Nfft_tr, Lh);
    case 'IEEE80211a'
        h_est(:,kk) = sub_channelestimate_ieee80211a(rn(:,kk), tr_seq, Ncp_tr, Nfft_tr, Lh);

    end
end


% ===========Output Paramters============%
PHY.RX.EstChannelResTD = h_est;
%========================================%
