function PHY = PHYAddcontrol(PHY)
% ===========Input Paramters============%
TrSeqMode = PHY.TX.config.Training.Mode;
symbols   = PHY.TX.Symbols;
N0 = PHY.TX.config.Training.ZeroLen;
%=======================================%
switch TrSeqMode
    case 'BC11'
        [sframe, tr_seq] = sub_addcontrol_BC11(symbols, N0);
end
Ns = length(sframe);
Nt = length(tr_seq);

% ===========Output Paramters============%
PHY.TX.sframe = sframe;
PHY.TX.straining = tr_seq;
PHY.TX.sframeLen = Ns;
PHY.TX.strainingLen = Nt;
%========================================%
