java -jar selenium-server-4.1.2.jar node --max-sessions 3 --max-threads 6 --hub http://192.168.75.130:4444 --publish-events tcp://192.168.75.130:4442 --subscribe-events tcp://192.168.75.130:4443  -I "chrome"
exit
:: 可以修改默认端口；默认端口：4444
:: java -jar selenium-server-4.1.2.jar -role hub -maxSession 10 -port 8888

:: --max-sessions  设置最大 会话总是 最高去CPU 内核数
:: --max-threads  设置使用 CPU 单核的线程数量
:: all-threads = max-sessions * max-sessions
:: -I 选择浏览器的驱动

:: 如果 --hub 参数地址不是 localhost 就要使用 --publis-events 和 --subscribe-events 参数