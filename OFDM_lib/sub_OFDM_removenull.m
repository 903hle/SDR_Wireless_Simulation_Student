function s_out = sub_OFDM_removenull(s_in, null_idx)
zero_idx = sort(null_idx);
s_in(zero_idx,:) = [];
s_out = s_in;