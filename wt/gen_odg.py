#
#

a=13
b=13

for i in range(1,a+b):
    c=min(i,a)
    s=''
    for j in range(0,c):
        if((i-j)<b+1):
            s=s+'o'
        else:
            s=s+' '
    print s
