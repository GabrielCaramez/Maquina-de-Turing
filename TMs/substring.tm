states 14
qs
qa
qb
qc
qa-s
qb-s
qc-s
qfail
qsuccess
qback
qnext
qdone
qr -
qA +
alphabet 10 a b c a. b. c. a+ b+ c+ #
qs a qa a+ R
qs b qb b+ R
qs c qc c+ R
qs a+ qr a+ R
qs b+ qr b+ R
qs c+ qr b+ R
qs a+ qr q+ R
qs b+ qr b+ R
qs c+ qr c+ R
qs # qr # R
qs _ qr _ R
q1 a qa a. R
q1 b qb b. R
q1 c qc c. R
q1 a+ qr a+ R
q1 b+ qr b+ R
q1 c+ qr b+ R
q1 a+ qr q+ R
q1 b+ qr b+ R
q1 c+ qr c+ R
q1 # qA # R
q1 _ qr _ R
qa a qa a R
qa b qa b R
qa c qa c R
qa a+ qr a+ R
qa b+ qr b+ R
qa c+ qr b+ R
qa a+ qr q+ R
qa b+ qr b+ R
qa c+ qr c+ R
qa # qa-s # R
qa _ qr _ R
qb a qb a R
qb b qb b R
qb c qb c R
qb a+ qr a+ R
qb b+ qr b+ R
qb c+ qr b+ R
qb a+ qr q+ R
qb b+ qr b+ R
qb c+ qr c+ R
qb # qb-s # R
qb _ qr _ R
qc a qc a R
qc b qc b R
qc c qc c R
qc a. qr a. R
qc b. qr b. R
qc c. qr c. R
qc a+ qr q+ R
qc b+ qr b+ R
qc c+ qr c+ R
qc # qc-s # R
qc _ qr _ R
qa-s a qsuccess a. L
qa-s b qfail b+ L
qa-s c qfail c+ L
qa-s a. qa-s a. R
qa-s b. qa-s b. R
qa-s c. qa-s c. R
qa-s a+ qsuccess a. L
qa-s b+ qfail b. L
qa-s c+ qfail c. L
qa-s # qr # R
qa-s _ qr _ R
qb-s a qfail a+ L
qb-s b qsuccess b. L
qb-s c qfail c+ L
qb-s a. qb-s a. R
qb-s b. qb-s b. R
qb-s c. qb-s c. R
qb-s a+ qfail a. L
qb-s b+ qsuccess b. L
qb-s c+ qfail c. L
qb-s # qr # R
qb-s _ qr _ R
qc-s a qfail a+ L
qc-s b qfail b+ L
qc-s c qsuccess c. L
qc-s a. qc-s a. R
qc-s b. qc-s b. R
qc-s c. qc-s c. R
qc-s a+ qfail a. L
qc-s b+ qfail b. L
qc-s c+ qsuccess c. L
qc-s # qr # R
qc-s _ qr _ R
qfail a qfail a L
qfail b qfail b L
qfail c qfail c L
qfail a. qfail a. L
qfail b. qfail b. L
qfail c. qfail c. L
qfail a+ qr q+ R
qfail b+ qr b+ R
qfail c+ qr c+ R
qfail # qback # L
qfail _ qr _ R
qback a qback a L
qback b qback b L
qback c qback c L
qback a. qback a L
qback b. qback b L
qback c. qback c L
qback a+ qa a+ R
qback b+ qb b+ R
qback c+ qc c+ R
qback # qr # R
qback _ qr _ R
qsuccess a qsuccess a L
qsuccess b qsuccess b L
qsuccess c qsuccess c L
qsuccess a. qsuccess a. L
qsuccess b. qsuccess b. L
qsuccess c. qsuccess c. L 
qsuccess a+ qr q+ R
qsuccess b+ qr b+ R
qsuccess c+ qr c+ R
qsuccess # qnext # L
qsuccess _ qr _ R
qnext a qnext a L
qnext b qnext b L
qnext c qnext c L
qnext a. q1 a. R
qnext b. q1 b. R
qnext c. q1 b. R
qnext a+ q1 a+ R
qnext b+ q1 b+ R
qnext c+ q1 b+ R
qnest # qr # R
qnext _ qr _ R