# Selenium-Grid

## Distributor 主机配置

**用 chrome 环境举例，分法服务器配置：**

1. java 运行环境
2. selenium-server-xxxx.jar 包
3. 启动 seleniumGrid 组件
   - event-bus
   - sessions
   - sessionqueue
   - distributor
   - router
   - node （任务分法服务器启动是可选的）
4. 如果分发服务器同时也作为 node 主机 则需要 添加 Node 主机配置

## Node 主机配置

1. java 运行环境
2. selenium-server-xxxx.jar 包
3. 启动 seleniumGrid 组件
   - node
4. chromedriver.exe 驱动
   - 需要与 node 主机 chrome 版本一致
   - chromedriver.exe 文件与 selenium-server-xxxx.jar 放置在同一文件夹内
5. 指定运行 chrome.exe 启动路径
   - 如果 chrome 运行环境与 selenium-server-xxxx.jar 包存在在同一文件夹下可以使" . " 作为相对路径
     ```typescript
     const driver = new Builder()
     	.forBrowser('chrome')
     	.usingServer('http://ServerIP:4444')
     	.setChromeOptions(new Options().setChromeBinaryPath('./chrome/chrome.exe'))
     	.build();
     ```
   - 使用 node 主机默认 chrome
     ```typescript
     const driver = new Builder().forBrowser('chrome').usingServer('http://ServerIP:4444').build();
     ```
