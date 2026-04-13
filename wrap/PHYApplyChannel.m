function PHY = PHYApplyChannel(PHY)

% ===========Input Paramters============%
s_in    = PHY.TX.tr;
sps     = PHY.TX.config.Oversampfac;
Fs      = PHY.TX.config.SampRate ;
ch_mod  = PHY.CH.config.Model;
SN      = PHY.CH.config.SNRlin; 
ch_res  = PHY.CH.config.ChannelResponse;
freqSet = PHY.CH.config.FreqOffset;
timeSet = PHY.CH.config.TimeOffset;
len_zero = PHY.CH.config.ZeroPad;
%=======================================%
% Zero-pad the channel
pad_seq = 0.1 * randn(len_zero,1); % add small noise to avoid SCA error
s_in_pad = [pad_seq; s_in; pad_seq];
% s_in_pad = [zeros(len_zero,1); s_in; zeros(len_zero,1)];

s_out = sub_channel...
    (s_in_pad, ch_mod, SN, ch_res, freqSet, timeSet, sps, Fs);

% ===========Output Paramters============%
PHY.TX.trchannel = s_out;
%========================================%
