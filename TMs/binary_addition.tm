states 20
qs
qw1
qw1-0m
qw1-1m
qw2-0
qw2-1
qw2-0m
qw2-1m
qw2-c0
qw2-c1
qw2-b
qw3-0
qw3-1
qw3-mb
qw2-mb
qw1-mb
qdone2
qdone3
qa +
qr -
alphabet 5 0 1 $ # c
qs 0 qw1-0m $ R 
qs 1 qw1-1m $ R
qs # qr # R
qs $ qr $ R 
qs c qr c R
qs _ qr _ R
qw1 0 qw1-0m $ R
qw1 1 qw1-1m $ R
qw1 # qdone2 # R
qw1 $ qr $ R
qw1 c qr c R
qw1 _ qr _ R
qw1-0m 0 qw1-0m 0 R
qw1-0m 1 qw1-0m 1 R
qw1-0m # qw2-0 # R
qw1-0m $ qr $ R 
qw1-0m c qr c R
qw1-0m _ qr _ R
qw1-1m 0 qw1-1m 0 R
qw1-1m 1 qw1-1m 1 R
qw1-1m # qw2-1 # R
qw1-1m $ qr $ R 
qw1-1m c qr c R
qw1-1m _ qr _ R
qw2-0 0 qw2-0m $ R
qw2-0 1 qw2-1m $ R
qw2-0 # qw3-0 # R
qw2-0 $ qw2-0 $ R
qw2-0 c qw2-c0 $ R
qw2-0 _ qr _ R
qw2-1 0 qw2-1m $ R
qw2-1 1 qw2-0m c R
qw2-1 # qw3-1 # R
qw2-1 $ qw2-1 $ R
qw2-1 c qw2-c1 $ R 
qw2-1 _ qr _ R
qw2-c0 0 qw2-1m $ R
qw2-c0 1 qw2-0m c R
qw2-c0 # qw3-1 # R
qw2-c0 $ qr $ R
qw2-c0 c qr c R
qw2-c0 _ qr _ R
qw2-c1 0 qw2-0m c R
qw2-c1 1 qw2-1m c R
qw2-c1 # qw2-b # L
qw2-c1 $ qr $ R
qw2-c1 c qr c R
qw2-c1 _ qr _ R
qw2-b 0 qr 0 R
qw2-b 1 qr 1 R
qw2-b # qr # R
qw2-b $ qw2-0m 1 R
qw2-b c qr c R
qw2-b _ qr _ R
qw2-0m 0 qw2-0m 0 R
qw2-0m 1 qw2-0m 1 R
qw2-0m # qw3-0 # R
qw2-0m $ qr $ R
qw2-0m c qr c R
qw2-0m _ qr _ R
qw2-1m 0 qw2-1m 0 R
qw2-1m 1 qw2-1m 1 R
qw2-1m # qw3-1 # R
qw2-1m $ qr $ R
qw2-1m c qr c R
qw2-1m _ qr _ R
qw3-0 0 qw3-mb $ L
qw3-0 1 qr 1 R
qw3-0 # qr # R
qw3-0 $ qw3-0 $ R
qw3-0 c qr c R
qw3-0 _ qr _ R
qw3-1 0 qr 0 R
qw3-1 1 qw3-mb $ L
qw3-1 # qr # R
qw3-1 $ qw3-1 $ R
qw3-1 c qr c R
qw3-1 _ qr _ R
qdone2 0 qw2-0m $ R
qdone2 1 qw2-1m $ R 
qdone2 # qdone3 # R
qdone2 $ qdone2 $ R
qdone2 c qw2-c0 $ R
qdone2 _ qr _ R
qdone3 0 qr 0 R
qdone3 1 qr 1 R
qdone3 # qr qdone3 R
qdone3 $ qdone3 $ R
qdone3 c qr c R
qdone3 _ qa _ R
qw3-mb 0 qr 0 R
qw3-mb 1 qr 1 R
qw3-mb # qw2-mb # L
qw3-mb $ qw3-mb $ L
qw3-mb c qw3-mb c L
qw3-mb _ qr _ R
qw2-mb 0 qw2-mb 0 L
qw2-mb 1 qw2-mb 1 L
qw2-mb # qw1-mb # L
qw2-mb $ qw2-mb $ L
qw2-mb c qw2-mb c L
qw2-mb _ qr _ R
qw1-mb 0 qw1-mb 0 L
qw1-mb 1 qw1-mb 1 L
qw1-mb # qr # R
qw1-mb $ qw1 $ R
qw1-mb c qr c R
qw1-mb _ qr _ R