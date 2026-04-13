function PHY = PHYOFDMAddcontrol(PHY)
% ===========Input Paramters============%
TrSeqMode = PHY.TX.config.Training.Mode;
Nfft_tr   = PHY.TX.config.Training.Nfft;
Ncp_tr    = PHY.TX.config.Training.Ncp;
N0        = PHY.TX.config.Training.ZeroLen;
symbols   = PHY.TX.OFDMsymbols;
%=======================================%

switch TrSeqMode
    case 'BC11'
        [sframe, tr_seq] = sub_addcontrol_BC11(symbols, N0);
    case 'IEEE80211a'
        [sframe, tr_seq] = sub_addcontrol_ieee80211a(symbols, Nfft_tr, Ncp_tr, N0);
end
Ns = length(sframe);
Nt = length(tr_seq);

% ===========Output Paramters============%
PHY.TX.sframe = sframe;
PHY.TX.straining = tr_seq;
PHY.TX.sframeLen = Ns;
PHY.TX.strainingLen = Nt;
%========================================%
