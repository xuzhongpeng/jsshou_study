import paramiko
from paramiko import hostkeys

#功能：连接到linux的ssh服务器并运行一条命令
#认证方式使用帐号密码
def ssh_command(ip, user, passwd, command):
    #创建客户端对象
    client = paramiko.SSHClient()
    hostkeys = paramiko.HostKeys()
    hostkeys.load('/Users/admin/.ssh/known_hosts')
    #保存目标服务器的SSH密钥
    # client.set_missing_host_key_policy(RejectPolicy())
    # 使用帐号密码方式认证
    client.connect(ip, username=user, password=passwd, hostkeys=hostkeys)
    ssh_session = client.get_transport().open_session()
    if ssh_session.active:
        #执行命令
        ssh_session.exec_command(command)
        print(ssh_session.recv(1024))
    return


ssh_command('192.168.1.99', 'coding', '4000858853', 'ls')