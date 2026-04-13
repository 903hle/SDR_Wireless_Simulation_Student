function PHY = PHYSourceMRC(PHY)

% ===========Input Paramters============%
len = PHY.TX.config.Numbits;
%=======================================%

rng(0, 'twister');
bits = sub_source(len);

% ===========Output Paramters============%
PHY.TX.inputbits = bits;
%========================================%
