function PHY = PHYSymbolTimingSync(PHY)
% Performing symbol timing recovery independent of
% frame synchronization or channel estimation

% ===========Input Paramters============%
Fs       = PHY.RX.config.SampRate;
rn       = PHY.RX.ReceivedSymbolMF;
SyncMode = PHY.RX.config.TimeSyncMode;
sps      = PHY.RX.config.Oversampfac;
TimeSync = PHY.RX.config.TimeSyncOn;
%=======================================%
if TimeSync
    switch SyncMode
        case 'MaxEnergy'
            [rn_sym, sym_delay_pix] = sub_symbolsync_maxenergy(rn, sps);
            
        case 'ELgate' 
            [rn_sym, sym_delay_pix] = sub_symbolsync_elgate(rn, sps);
    end
else
    rn_sym = rn;
    sym_delay_pix = 0;
end

sym_delay_time_est = sym_delay_pix / Fs;

rn_sym_down = sub_downsample(rn_sym, sps);

% ===========Output Paramters============%
PHY.RX.ReceivedSymbolTimeSync = rn_sym_down;
PHY.RX.EstTimeOffset = sym_delay_time_est;
%========================================%