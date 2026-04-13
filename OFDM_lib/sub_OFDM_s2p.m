function s_2d = sub_OFDM_s2p(s_in, Nrow)
s_in = s_in(:);
Ns = length(s_in);

Nres = mod(Ns,Nrow);
if Nres == 0
    Nzero = 0;
else
    Nzero = Nrow - Nres;
end


s_pad = [s_in; zeros(Nzero,1)];
Npad = length(s_pad);

Ncol = Npad / Nrow;

s_2d = reshape( s_pad, [Nrow, Ncol] );