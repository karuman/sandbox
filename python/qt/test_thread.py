# -*- coding: utf-8 -*-

import logging
import signal
import threading
import time

#スレッドのしごと
class Worker(threading.Thread):
    def __init__(self):
        self._running = True
        super(Worker, self).__init__()

    def run(self):
        cnt = 0
        while self._running:
            logging.info('hoge[%s]' % cnt)
            cnt += 1
            time.sleep(1)

    def shutdown(self):
        self._running = False


#メイン関数
if __name__ == '__main__':
    logging.basicConfig(
        format='[%(threadName)s][%(levelname)s]%(message)s',
        level=logging.DEBUG
    )

    #スレッドの生成
    worker = Worker()
    worker1 = Worker()

    logging.debug('-- START --')
    worker.start()
    time.sleep(5)
    worker1.start()

    #Signalを受信したときの処理。各スレッドの停止
    def stop_handler(signum, frame):
        logging.debug('GET signal[%s]' % signum)
        worker.shutdown()
        worker1.shutdown()

    #Signal受信用の定義
    signal.signal(signal.SIGTERM, stop_handler)
    signal.signal(signal.SIGINT, stop_handler)

    signal.pause()

    worker.join()  #workerが終わるのを待つ
    worker1.join() #workerが終わるのを待つ
    logging.debug('-- STOP --')
