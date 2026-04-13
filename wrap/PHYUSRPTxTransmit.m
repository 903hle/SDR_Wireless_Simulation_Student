function PHYUSRPTxTransmit(PHY)
% ===========Input Paramters============%
tx_data   = PHY.TX.trchannel;
radio_tx  = PHY.HW.radiotx;
%=======================================%
% transmitted waveform-----------------------------------------------------
tx_data = ( tx_data / max(abs(tx_data)) ) * 0.9;
zero_padding = length(tx_data);
waveform = [zeros(zero_padding,1); tx_data;zeros(zero_padding,1)];

% waveform = repmat(waveform, [5 1]);
% Sequentially transmit and receive----------------------------------------
% step(radio_tx,waveform)
disp(['Start transmitting...'])
while 1
    step(radio_tx,waveform); % Transmit signal and control data to USRP
    pause(PHY.HW.config.capturetime);
end





