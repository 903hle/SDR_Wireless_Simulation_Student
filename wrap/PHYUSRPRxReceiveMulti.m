function PHY = PHYUSRPRxReceiveMulti(PHY)
% ===========Input Paramters============%
sps = PHY.RX.config.Oversampfac;
RXFrameNum    = PHY.HW.config.RXFrameNum;
SamplesPerFrame = PHY.HW.config.SamplesPerFrame;
radio_rx = PHY.HW.radiorx;
%=======================================%

rx_sig_all = zeros(SamplesPerFrame,RXFrameNum);
% Clear memory-------------------
for nn = 1 : 50
    rx_sig = radio_rx();
end

% Receive Frames-------------------
for nn = 1 : RXFrameNum
    [rx_sig_all(:,nn), dataLen, overrun] = radio_rx(); % Receive signal and control data from USRP
    pause(0.01)
end
% figure;plot(real(rx_sig_all));
release(PHY.HW.radiorx);


% ===========Output Paramters============%
PHY.RX.ReceivedSymbolAllFrame = rx_sig_all;
%=======================================%