function PHY = PHYGetTxPara(PHY)
PHY = PHYSource(PHY);       % Generating random bit sequence
PHY = PHYEncode(PHY);       % Channel encoding
PHY = PHYModulate(PHY);     % Symbol modulation
PHY = PHYAddcontrol(PHY);   % Add training sequences
PHY = PHYPulseshaping(PHY); % Upsample and pulse shapping