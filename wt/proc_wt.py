#
#
#
#
#
from collections import namedtuple
import argparse

signal= namedtuple('Signal','name delay')
fainst= namedtuple('FaInst','name a0 b0 ci so co')
hainst= namedtuple('HaInst','name a0 b0 so co')

scount = 0
ccount = 0
fainsts =[]
facount = 0

hainsts =[]
hacount = 0

intersignals=[]

SUM_DELAY=2
CRY_DELAY=3

#use HA or not
WITHOUT_HA=0

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
def printDelay(bits):
    for i in range(len(bits)):
        for j in range(len(bits[i])):
            print(bits[i][j].delay),
        print


        
#
#
#
def max3(a,b,c):
    rtn=max(int(a),int(b))
    rtn=max(int(c),rtn)
    return rtn;
#
#
def procAdderSig(signals):
    global scount
    global ccount
    global facount
    global fainsts
    global hacount
    global hainsts
    
    if(len(signals)>2):
        if((int(signals[2].delay)-int(signals[1].delay))<SUM_DELAY or
           WITHOUT_HA):
            j=max3(signals[0].delay,signals[1].delay,signals[2].delay)
            facount= facount+1
            scount= scount+1
            ccount= ccount+1
            fainsts.append(fainst('fa'+str(facount),
                                  signals[0].name,signals[1].name,signals[2].name,
                                  's'+str(scount),'c'+str(ccount)))
            signals.pop(0)
            signals.pop(0)
            signals.pop(0)
            signals.append(signal('s'+str(scount),int(j)+SUM_DELAY))
            intersignals.append(signal('s'+str(scount),int(j)+SUM_DELAY))
            signals.sort(key=lambda x:int(x.delay))
            intersignals.append(signal('c'+str(ccount),int(j)+CRY_DELAY))

            return  signal('c'+str(ccount),int(j)+CRY_DELAY)
        else:
            j=max(int(signals[0].delay),int(signals[1].delay))
            hacount= hacount+1
            scount= scount+1
            ccount= ccount+1
            hainsts.append(hainst('ha'+str(hacount),
                                  signals[0].name,signals[1].name,
                                  's'+str(scount),'c'+str(ccount)))
            signals.pop(0)
            signals.pop(0)
            signals.append(signal('s'+str(scount),int(j)+SUM_DELAY))
            intersignals.append(signal('s'+str(scount),int(j)+SUM_DELAY))
            signals.sort(key=lambda x:int(x.delay))
            intersignals.append(signal('c'+str(ccount),int(j)+CRY_DELAY))

            return  signal('c'+str(ccount),int(j)+CRY_DELAY)
            
    else:
        return None
    


#
#
#
def procAdder(bits):
    for i in range(len(bits)):
        r=procAdderSig(bits[i])
        if(r is not None):
            if(i<(len(bits)-1)):
                bits[i+1].append(r)
            else:
                signals=[]
                signals.append(r);
                bits.append(signals)


#Max height
#
#
def maxHeight(bits):
    height=0
    for i in range(len(bits)):
        curHeight=len(bits[i])
        if(curHeight>height):
            height=curHeight
    return height
        
    
#
# Printout Full Adder Instance
#
def printFaInst(fainst):
    print "full_adder "+ fainst.name +\
        "(" + \
        ".a0(" + fainst.a0 +"),"+\
        ".b0(" + fainst.b0 +"),"+\
        ".ci(" + fainst.ci +"),"+\
        ".so(" + fainst.so +"),"+\
        ".co(" + fainst.co +")"+\
        ");"

#
# Printout Half Adder Instance
#
def printHaInst(hainst):
    print "half_adder "+ hainst.name +\
        "(" + \
        ".a0(" + hainst.a0 +"),"+\
        ".b0(" + hainst.b0 +"),"+\
        ".so(" + hainst.so +"),"+\
        ".co(" + hainst.co +")"+\
        ");"

def printInterSignal(signals):
    print "signal ",
    cnt=0
    for signal in signals:
        print signal.name,
        cnt=cnt+1
        if(cnt==len(signals)):
            print ":std_ulogic;"
        else:
            print ",",
        if(cnt%8==0):
            print 
            print "    ",
#
def printResultSignals(bits):
    str=''
    for i in range(len(bits)):
        str = bits[i][0].name+','+str
    print str

    str=''
    for i in range(len(bits)):
        if(len(bits[i])>1):
            str = bits[i][1].name+','+str
        else:
            str = '1\'b0,'+str

    print str

    
#
#
#
def printMsg(msg):
    prtMsg="---"+msg+"----------------------------------------------"
    print prtMsg[:30]

    

#************************************************************************
#
#



#----------------------------------------------
#test data. 4x4 mult WT
#
def test():
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

    return bits

#--------------------------------------------------
#Read bit info from a file
#
#
def initFromFile(fileName):
    f = open(fileName)
    line = f.readline()
    idy=0
    bits=[]

    while line:
        signals = []
        for idx in range(0, len(line)):
            if "o" in line[idx]:
                name="a"+str(idx)+"b("+str(idy) +")"
                s0 = signal(name,'0')
                signals.append(s0)
        bits.append(signals)
        line = f.readline()
        idy=idy+1
    f.close

    return bits
    #

    
#************************************************************************
#Main 
#
#************************************************************************






parser = argparse.ArgumentParser()
parser.add_argument('inputFile', help='Input file path')

args=parser.parse_args()


# initialize data
bits=initFromFile(args.inputFile)  #read bits info from file
#bits=test()  #fixed 4x4 mult


# initial stat
printMsg("init")
#printBits(bits)
printDelay(bits)
h=maxHeight(bits)
cnt=1

while(h>2):
    # 1st transform
    printMsg("transform..."+str(cnt))
    procAdder(bits)
    #printBits(bits)
    printDelay(bits)
    h=maxHeight(bits)
    cnt=cnt+1
    
printResultSignals(bits)

printMsg("HDL")
for fainst in fainsts:
    printFaInst(fainst)

for hainst in hainsts:
    printHaInst(hainst)


printInterSignal(intersignals)



