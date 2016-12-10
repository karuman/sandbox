#
#
from collections import namedtuple

scount = 0
ccount = 0


#
#
#
def printBits(bits):
    for i in range(len(bits)):
        for j in range(len(bits[i])):
            print(bits[i][j].name),
        print


#
#
#
def procWtSig(signals):
    global scount
    global ccount
    if(len(signals)>2):
        i=max(signals[0].delay,signals[1].delay)
        i=max(i,signals[2].delay)
        name=signals[0].name+signals[1].name+signals[2].name
        signals.pop(0)
        signals.pop(0)
        signals.pop(0)
        scount= scount+1
        ccount= ccount+1
        signals.append(signal('s'+str(scount),i))
        return  signal('c'+str(ccount),i)
    else:
        return None
    



def procWtBits(bits):
    for i in range(len(bits)):
        r=procWtSig(bits[i])
        if(r is not None):
            if(i<(len(bits)-1)):
                bits[i+1].append(r)
            else:
                signals=[]
                signals.append(r);
                bits.append(signals)


            
signal= namedtuple('Signal','name delay')
signals = []
bsignals = []
bits=[]

s0 = signal('a0','0')
s1 = signal('a1','0')
s2 = signal('a2','0')
s3 = signal('a3','0')

b0 = signal('b0','0')
b1 = signal('b1','0')
b2 = signal('b2','0')
b3 = signal('b3','0')


signals.append(s0)
signals.append(s1)
signals.append(s2)
signals.append(s3)

bsignals.append(b0)
bsignals.append(b1)
bsignals.append(b2)
bsignals.append(b3)

bits.append(signals)
bits.append(bsignals)

print "init"
printBits(bits)

print "transform"
procWtBits(bits)

print "fin"
printBits(bits)


print "transform"
procWtBits(bits)

print "fin"
printBits(bits)



