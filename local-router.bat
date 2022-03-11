java -jar selenium-server-4.1.2.jar router --port 4444 --sessions http://localhost:5556 --distributor http://localhost:5553 --sessionqueue http://localhost:5559
exit
:: 可以修改默认端口；默认端口：4444
:: java -jar selenium-server-4.1.2.jar -role hub -maxSession 10 -port 8888