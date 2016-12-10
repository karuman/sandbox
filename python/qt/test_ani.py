import sys
import time
import thread  # from Python 3.0 _thread instead of thread
from PyQt4.QtCore import *
from PyQt4.QtGui import *

class ThreadSample(QWidget):
    rectx = 0
    
    def __init__(self,parent=None):
        QWidget.__init__(self, parent)
        print 'Hello'
        self.setWindowTitle( "Thread Sample")
        self.resize( 300, 300 )
        thread.start_new_thread( self.runner, (self, None) )
        # from Python 3.0 _thread instead of thread
        
    def paintEvent(self,event):
        paint = QPainter()
        paint.begin(self)
        paint.setPen(Qt.red)
        paint.drawRect(self.rectx, 10, 50, 50 )
        paint.drawText( 300-self.rectx, 100, time.ctime())
        paint.end()

    def runner( self, arg1, arg2 ):
        print 'Hello'
        for i in range( 100 ):
            self.rectx += 10
            if self.rectx >= 300:
                self.rectx = 10
            self.update()
            time.sleep(0.5)
            thread.exit()  # from Python 3.0 _thread.exit( )
                
app = QApplication(sys.argv)
sample = ThreadSample()
sample.show()
sys.exit(app.exec_())

