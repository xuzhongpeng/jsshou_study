from subprocess import call
from apscheduler.schedulers.blocking import BlockingScheduler


cmd = 'display notification \"' + \
    "Notificaton memo" + '\" with title \"Titile\"'
call(["osascript", "-e", cmd])
def dojob():
    # 创建调度器：BlockingScheduler
    scheduler = BlockingScheduler()
    forget()
    scheduler.add_job(
        forget, CronTrigger.from_crontab('0,30 20-22 * * 0-6'))
    scheduler.start()