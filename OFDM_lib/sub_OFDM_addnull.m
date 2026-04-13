function s_out = sub_OFDM_addnull(s_in, null_idx)
Nnull = length(null_idx);
Nrow = size(s_in,1) + Nnull;
Ncol = size(s_in,2);
s_out = zeros(Nrow, Ncol);

kk=1;
ss=1;
for ii = 1 : Nrow
    if (kk<=Nnull) && ( ii == null_idx(kk) )
        kk = kk+1;
        continue
    end
    s_out(ii,:) = s_in(ss,:);
    ss=ss+1;
end

