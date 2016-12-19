#
#

import argparse

parser = argparse.ArgumentParser()
parser.add_argument("a", type=int, help="A bit width")
parser.add_argument("b", type=int, help="B bit width")
parser.add_argument('-f', '--file_name', \
        action='store', \
        nargs='?', \
        const=None, \
        default=None, \
        type=str, \
        choices=None, \
        help='output file name', \
        metavar=None)
args=parser.parse_args()


a=args.a
b=args.b
fo_obj = open('test'+str(a)+'_'+str(b)+'.og', 'w')
fh_obj = open('test'+str(a)+'_'+str(b)+'.v', 'w')

for i in range(1,a+b):
    c=min(i,a)
    s=''
    for j in range(0,c):
        if((i-j)<b+1):
            s=s+'o'
            print >> fh_obj,'wire a'+str(j)+'b'+str(i-1) +'=a['+str(j)+'] & b['+str(i-1-j)+'];'
        else:
            s=s+' '
    print >> fo_obj, s
