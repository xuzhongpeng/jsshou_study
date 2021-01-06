from subprocess import call
from apscheduler.schedulers.blocking import BlockingScheduler

def sendMessage():
    cmd = 'display notification \"' + \
    "Notificaton memo" + '\" with title \"Titile\"'
    call(["osascript", "-e", cmd])
def dojob():
    # 创建调度器：BlockingScheduler
    scheduler = BlockingScheduler()
    scheduler.add_job(
        sendMessage, CronTrigger.from_crontab('0,30 20-22 * * 0-6'))
    scheduler.start()