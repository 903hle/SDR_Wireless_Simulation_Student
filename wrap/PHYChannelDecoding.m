function PHY = PHYChannelDecoding(PHY)
% ===========Input Paramters============%
CodingOn = PHY.TX.config.CHCodingOn;
bits_est   = PHY.RX.EstBits;
trellis = PHY.TX.config.CHCoding.Trellis;
%=======================================%
if CodingOn
    FEC        = PHY.TX.config.CHCoding.Mode;
    switch FEC
        case 'repetition'
            RepNum = PHY.TX.config.CHCoding.Rep.Num;
            bits_est_fec = sub_channel_decode_rep(bits_est, RepNum);

        case 'convolutional'
            bits_est_fec = sub_channel_decode_viterbi(bits_est, trellis);

        otherwise 
            bits_est_fec = bits_est;
    
    end
else
    bits_est_fec = bits_est;
end
% ===========Output Paramters============%
PHY.RX.EstBitsFec = bits_est_fec;
%========================================%
