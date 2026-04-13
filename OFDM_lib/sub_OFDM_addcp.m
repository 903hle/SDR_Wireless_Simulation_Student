function s_cd = sub_OFDM_addcp(s_in, Nfft, Ncp)

s_cd = [s_in(Nfft-Ncp+1:end,:); s_in];