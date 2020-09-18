# ssh-login-notification
Данный скрипт, при каждом новом входе по SSH, отправляет Вам уведомление в телеграм. 
![alt tag](https://github.com/unixhostpro/ssh-login-notification/blob/master/sshlogin.png)

Для работы скрипта Вам понадобится jq 

Установка jq Ubuntu / Linux Mint / Debian
> sudo apt install jq

Установка jq CentOS
> sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
> sudo yum install jq

Установка :
Копируем скрипт в /usr/local/bin/

Устанавливаем права на запуск 
> chmod +x /usr/local/bin/ssh_login_info.sh

В файл /etc/pam.d/common-session добавляем следующую строку 
> session optional pam_exec.so type=open_session seteuid/usr/local/bin/ssh-login-notification.sh


[Наш сайт UnixHost](https://unixhost.pro/)
[Блог UnixHost](https://blog.unixhost.pro/)
[Telegram](https://t.me/unixhostpro)
[Twitter](https://twitter.com/UnixHostPro)
[Facebook](https://www.facebook.com/unixhost.pro)
[Вконтакте](https://vk.com/unixhost)
