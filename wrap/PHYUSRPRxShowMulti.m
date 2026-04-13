function PHYUSRPRxShowMulti(PHY)

sig_all = PHY.RX.ReceivedSymbolAllFrame;

num_frame = size(sig_all,2);
num_row = 10;
num_col = fix(num_frame/num_row);
min_val = min(real(sig_all(:)));
max_val = max(real(sig_all(:)));
y_lim = max(abs(min_val), abs(max_val));
figure('Position',[50 50 1200 700])
for ii = 1 : size(sig_all,2)
    subplot(num_row, num_col,ii);
    plot(real(sig_all(:,ii)));
    axis([-inf inf -y_lim y_lim])
    title(['f' num2str(ii)])
    set(gca,'xtick',[],'ytick',[])
end
