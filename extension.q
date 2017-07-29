/ bash$ q extension.q
/ q)print "test"
/ q)print2 "test"

print:`:build/extension 2: (`print;1);
print2:`:build/extension 2: (`print2;1);