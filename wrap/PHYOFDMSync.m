function PHY = PHYOFDMSync(PHY)
% ===========Input Paramters============%
SyncMode  = PHY.RX.config.SyncMode;
%=======================================%

switch SyncMode
    case 'Timing Estimation'
        PHY = PHYSymbolTimingSync(PHY);  % Symbol timing syncrhonization & downsample
        PHY = PHYOFDMFrameFreqSync(PHY); % OFDM Frame and Freqeuncy syncrhonization
    case 'Fixed Offset'
        PHY = PHYSymbolTimingSync(PHY);
        PHY = PHYOFDMFrameFreqSync(PHY);
    case 'Joint Timing and Channel Estimation'

        
end