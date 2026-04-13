function PHY = PHYPulseshaping(PHY)
% ===========Input Paramters============%
PSOn   = PHY.TX.config.PSOn;
PStype = PHY.TX.config.PS.Type;
PScoef = PHY.TX.config.PS.FilterCoef;

s_in = PHY.TX.sframe;
sps    = PHY.TX.config.Oversampfac;
filter_len = PHY.TX.config.PS.Filterlen;
%=======================================%
% Upsampling---------------------
s_up = sub_upsample(s_in, sps);

% Pulse Shaping------------------
if PSOn
    [xn, pn] = sub_pulseshaping(s_up, PStype, filter_len, PScoef, sps);
else
    pn = ones(sps,1);
    xn = conv(s_up,pn);
end
% ===========Output Paramters============%
PHY.TX.tr = xn;
PHY.TX.pulse = pn;
%========================================%