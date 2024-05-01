states 10
q0
qa
qb
qc
pa
pb
pc
qL
qA +
qR -
alphabet 3 a b c #
q0 _ qA _ R
q0 a qa # R
q0 b qb # R
q0 c qc # R
q0 # qR # R
qa a qa a R
qa b qa b R
qa c qa c R
qa _ pa _ L
qa # qR # R
qb a qb a R
qb b qb b R
qb c qb c R
qb _ pb _ L
qb # qR # R
qc a qc a R
qc b qc b R
qc c qc c R
qc _ pc _ L
qc # qR # R
pa a qL _ L
pa b qR b L
pa c qR c L
pa _ qa _ L
pa # qR # R
pb a qR a L
pb b qL _ L
pb c qR c L
pb _ qb _ L
pb # qR # R
pc a qR a L
pc b qR b L
pc c qL _ L
pc _ qc _ L
pc # qR # R
qL a qL a L
qL b qL b L
qL c qL c L
qL _ q0 _ R
qL # q0 _ R