
function PHY = PHYOFDMGetTxParaMRC(PHY)
rng(1,'philox')
PHY = PHYSource(PHY);       % Generating random bit sequence
PHY = PHYEncode(PHY);       % Channel encoding
PHY = PHYModulate(PHY);     
PHY = PHYOFDMmodulate(PHY);% Symbol modulation
PHY = PHYOFDMAddcontrol(PHY);   % Add training sequences
PHY = PHYPulseshaping(PHY); % Upsample and pulse shapping