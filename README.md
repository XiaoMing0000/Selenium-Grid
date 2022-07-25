# Selenium-Grid

# Distributor 主机配置

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

# Node 主机配置

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

# 插件简单作用

## 常用端口

550-5559 和 4440-4449

## Session

负责将会话 ID 映射到运行的会话相应节点

## Distrubte 分发器

当 Selenium 客户机发出创建 Session 请求时，分发器负责分配适当的节点

## Route 路由器

路由器是一个通常暴露再网络罗，路由器默认会再 localhost:4444 上监听新的 session 请求。
客户端请求被阿松到路由器，并根据请求类型选择合适的路径，传入到创建新的和会话的请求被重定向到路由器进程。

## Node 节点 -> 执行节点

网络没有节点时没用搞得，各个浏览器的 Selnium Driver 放在 Selenium Grid4.jar 文件所在的同一目录中。
可是使用 detect 驱动程序选项自动识别系统中再的 Selenium Driver。
分发服务器下创建时，会话映射会更新节点的信息以及节点 URI，Node URI 默认是 5555.
