from subprocess import call


cmd = 'display notification \"' + \
    "Notificaton memo" + '\" with title \"Titile\"'
call(["osascript", "-e", cmd])
