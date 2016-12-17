#
#
from collections import namedtuple


signal= namedtuple('Signal','name delay')
addinst= namedtuple('MuxInst','name a0 b0 ci so co')

scount = 0
ccount = 0
addinsts =[]
acount = 0



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
    global acount
    global addinsts
    
    if(len(signals)>2):
        i=max(signals[0].delay,signals[1].delay)
        i=max(i,signals[2].delay)
        name=signals[0].name+signals[1].name+signals[2].name
        acount= acount+1
        scount= scount+1
        ccount= ccount+1
        addinsts.append(addinst('add'+str(acount),
                                signals[0].name,signals[1].name,signals[2].name,
                                's'+str(scount),'c'+str(ccount)))
        signals.pop(0)
        signals.pop(0)
        signals.pop(0)
        signals.append(signal('s'+str(scount),i))
        return  signal('c'+str(ccount),i)
    else:
        return None
    


#
#
#
def procWt(bits):
    for i in range(len(bits)):
        r=procWtSig(bits[i])
        if(r is not None):
            if(i<(len(bits)-1)):
                bits[i+1].append(r)
            else:
                signals=[]
                signals.append(r);
                bits.append(signals)


#
#
#
def printInst(addinst):
    print "fa "+ addinst.name +\
        "(" + \
        ".a0(" + addinst.a0 +"),"+\
        ".b0(" + addinst.b0 +"),"+\
        ".ci(" + addinst.ci +"),"+\
        ".so(" + addinst.so +"),"+\
        ".co(" + addinst.co +")"+\
        ")"
    
    

#************************************************************************
#
#

bits=[]

# 0bit
signals = []
s0 = signal('a0b0','0')
signals.append(s0)
bits.append(signals)

# 1bit
signals = []
s0 = signal('a0b1','0')
signals.append(s0)
s0 = signal('a1b1','0')
signals.append(s0)
bits.append(signals)

# 2bit
signals = []
s0 = signal('a0b2','0')
signals.append(s0)
s0 = signal('a1b2','0')
signals.append(s0)
s0 = signal('a2b2','0')
signals.append(s0)
bits.append(signals)

# 3bit
signals = []
s0 = signal('a0b3','0')
signals.append(s0)
s0 = signal('a1b3','0')
signals.append(s0)
s0 = signal('a2b3','0')
signals.append(s0)
s0 = signal('a3b3','0')
signals.append(s0)
bits.append(signals)

# 4bit
signals = []
s0 = signal('a1b4','0')
signals.append(s0)
s0 = signal('a2b4','0')
signals.append(s0)
s0 = signal('a3b4','0')
signals.append(s0)
bits.append(signals)

# 5bit
signals = []
s0 = signal('a2b5','0')
signals.append(s0)
s0 = signal('a3b5','0')
signals.append(s0)
bits.append(signals)

# 6bit
signals = []
s0 = signal('a3b6','0')
signals.append(s0)
bits.append(signals)


print "init"
printBits(bits)

print "transform"
procWt(bits)

print "fin"
printBits(bits)


print "transform"
procWt(bits)

print "fin"
printBits(bits)

for addinst in addinsts:
    printInst(addinst)



