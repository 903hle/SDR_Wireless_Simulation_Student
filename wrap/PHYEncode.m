function PHY = PHYEncode(PHY)
% ===========Input Paramters============%
CodingOn = PHY.TX.config.CHCodingOn;
bits = PHY.TX.inputbits(:);
%===========================
trellis = [];
if CodingOn
    EncodeMode = PHY.TX.config.CHCoding.Mode;
    switch EncodeMode
        case 'repetition'
            RepNum = PHY.TX.config.CHCoding.Rep.Num;
            bits_codes = sub_encode_rep(bits, RepNum);
        case 'convolutional'
           [bits_codes, trellis] = sub_encode_conv(bits);
           
        otherwise
            bits_codes = bits;
    end
else
    bits_codes = bits;
end

% ===========Output Paramters============%
PHY.TX.codedbits = bits_codes;
PHY.TX.config.CHCoding.Trellis = trellis;
%========================================%
