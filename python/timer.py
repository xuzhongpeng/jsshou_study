from subprocess import call
from apscheduler.schedulers.blocking import BlockingScheduler
from apscheduler.triggers.cron import CronTrigger


def sendMessage(title: str, content: str):
    cmd = 'display notification \"' + \
        content + '\" with title \"'+title+'\"'
    call(["osascript", "-e", cmd])

# def dojob():
#     # 创建调度器：BlockingScheduler
#     scheduler = BlockingScheduler()
#     scheduler.add_job(
#         sendMessage, CronTrigger.from_crontab('0,30 20-22 * * 0-6'))
#     scheduler.start()
sendMessage('1', '3')
