# 连接到comma 3/3X

comma 3/3X是一台普通的[Linux](https://github.com/commaai/agnos-builder)计算机，提供[SSH](https://wiki.archlinux.org/title/Secure_Shell)和[串行控制台](https://wiki.archlinux.org/title/Working_with_the_serial_console)接口。

## 串行控制台

在comma three和3X上，串行控制台可通过主OBD-C端口访问。
使用普通USB C线缆将comma 3/3X连接到您的计算机，或使用[comma serial](https://comma.ai/shop/comma-serial)获得稳定的12V电源。

在comma three上，串行控制台通过UART-to-USB芯片暴露，可以使用`tools/scripts/serial.sh`脚本连接。

在comma 3X上，串行控制台可通过[panda](https://github.com/commaai/panda)使用`panda/tests/som_debug.sh`脚本访问。

  * 用户名：`comma`
  * 密码：`comma`

## SSH

要通过SSH连接到您的设备，您需要一个带有SSH密钥的GitHub账户。请参阅此[GitHub文章](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)，了解如何设置带有SSH密钥的账户。

* 在设备设置中启用SSH
* 在设备设置中输入您的GitHub用户名
* 连接到您的设备
    * 用户名：`comma`
    * 端口：`22`

以下是使用设备共享网络连接到设备的示例命令：<br />
`ssh comma@192.168.43.1`

对于在设备上进行开发工作，建议使用[SSH代理转发](https://docs.github.com/en/developers/overview/using-ssh-agent-forwarding)。

## ADB

要在设备上使用ADB，您需要执行以下步骤，参考下图：

![comma 3/3x back](../assets/three-back.svg)

* 使用端口2将设备插入恒定电源，让设备启动
* 在设备设置中启用ADB
* 使用端口1将设备连接到您的PC
* 连接到您的设备
    * 通过USB使用`adb shell`
    * 通过WiFi使用`adb connect`
    * 以下是使用设备共享网络连接到设备的示例命令：`adb connect 192.168.43.1:5555`

> [!NOTE]
> comma 3/3X上ADB的默认端口是5555。

有关ADB的更多信息，请参阅[Android Debug Bridge (ADB)文档](https://developer.android.com/tools/adb)。

### 注意事项

公钥仅从您的GitHub账户获取一次。要更新设备的授权密钥，您需要重新输入您的GitHub用户名。

此目录中的`id_rsa`密钥仅在设备处于未安装软件的设置状态时有效。安装后，将删除该默认密钥。

#### ssh.comma.ai代理

使用[comma prime订阅](https://comma.ai/connect)，您可以从任何地方SSH连接到您的comma设备。

使用以下SSH配置，您可以输入`ssh comma-{dongleid}`通过`ssh.comma.ai`连接到您的设备。

```
Host comma-*
  Port 22
  User comma
  IdentityFile ~/.ssh/my_github_key
  ProxyCommand ssh %h@ssh.comma.ai -W %h:%p

Host ssh.comma.ai
  Hostname ssh.comma.ai
  Port 22
  IdentityFile ~/.ssh/my_github_key
```

### 一次性连接

```
ssh -i ~/.ssh/my_github_key -o ProxyCommand="ssh -i ~/.ssh/my_github_key -W %h:%p -p %p %h@ssh.comma.ai" comma@ffffffffffffffff
```
（将`ffffffffffffffff`替换为您的dongle_id）

### ssh.comma.ai主机密钥指纹

```
Host key fingerprint is SHA256:X22GOmfjGb9J04IA2+egtdaJ7vW9Fbtmpz9/x8/W1X4
+---[RSA 4096]----+
|                 |
|                 |
|        .        |
|         +   o   |
|        S = + +..|
|         + @ = .=|
|        . B @ ++=|
|         o * B XE|
|         .o o OB/|
+----[SHA256]-----+
```