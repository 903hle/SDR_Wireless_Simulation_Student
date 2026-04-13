function PHY = PHYApplyChannelMRC(PHY)

% ===========Input Paramters============%
s_in    = PHY.TX.tr;
sps     = PHY.TX.config.Oversampfac;
Fs      = PHY.TX.config.SampRate;
ch_mod  = PHY.CH.config.Model;
SN      = PHY.CH.config.SNRlin; 
ch_res  = PHY.CH.config.ChannelResponse;
freqSet = PHY.CH.config.FreqOffset;
timeSet = PHY.CH.config.TimeOffset;
AntNum  = PHY.RX.config.AntNum;

%=======================================%
% Zero-pad the channel
s_in = [zeros(fix(length(s_in)/3),1); s_in; zeros(fix(length(s_in)/3),1) ];
for kk = 1 : AntNum
    s_out(:,kk) = sub_channel...
        (s_in, ch_mod, SN, ch_res(kk), freqSet, timeSet, sps, Fs);
end

% ===========Output Paramters============%
PHY.TX.trchannel= s_out;
%========================================%
