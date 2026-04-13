function PHY = PHYModulate(PHY)
% ===========Input Paramters============%
ModType = PHY.TX.config.ModType;
SymOrder = PHY.TX.config.SymOrder;
bits_in = PHY.TX.codedbits;
Es = PHY.TX.config.Es;
%=======================================%

symbols = sub_modulate(bits_in, ModType, Es, SymOrder);
Ns = length(symbols);

% ===========Output Paramters============%
PHY.TX.Symbols = symbols;
PHY.TX.SymbolLen = Ns;
%========================================%
