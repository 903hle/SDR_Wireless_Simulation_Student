function PHY = PHYFreqSync(PHY)
% ===========Input Paramters============%
rn        = PHY.RX.ReceivedSymbolFrameSync;
Fs        = PHY.TX.config.SymbolRate;
Nt        = PHY.TX.strainingLen;
Lh        = PHY.CH.config.ChannelLength;
CFO       = PHY.RX.config.FreqSyncOn;
%=======================================%
if CFO
    [rn_sync, fo_est] = sub_freqsync(rn, Fs, Nt, Lh); % Have problem when using bpsk
else
    rn_sync = rn;
    fo_est = [];
end
% ===========Output Paramters============%
PHY.RX.ReceivedSymbolAllSync = rn_sync;
PHY.RX.EstFreqOffset = fo_est;
%========================================%