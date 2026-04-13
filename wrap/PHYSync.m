function PHY = PHYSync(PHY)
% ===========Input Paramters============%
SyncMode  = PHY.RX.config.SyncMode;
%=======================================%

switch SyncMode
    case 'Timing Estimation'
        PHY = PHYSymbolTimingSync(PHY);
        PHY = PHYFrameFreqSync(PHY);
        
    case 'Fixed Offset'
        PHY = PHYSymbolTimingSync(PHY);
    case 'Joint Timing and Channel Estimation'

        
end