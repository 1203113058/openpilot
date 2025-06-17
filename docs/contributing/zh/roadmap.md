# 路线图

这是下一个主要openpilot版本的路线图。也可以查看

* [里程碑](https://github.com/commaai/openpilot/milestones) 了解次要版本
* [项目](https://github.com/commaai/openpilot/projects?query=is%3Aopen) 了解不与发布相关的短期项目
* [赏金任务](https://comma.ai/bounties) 了解有偿个人任务
* Discord中的[#current-projects](https://discord.com/channels/469524606043160576/1249579909739708446) 讨论正在进行的项目

## openpilot 0.10

openpilot 0.10将是第一个在[学习模拟器](https://youtu.be/EqQNZXqzFSI)中训练驾驶策略的版本。

* 在学习模拟器中训练的驾驶模型
* 始终开启的驾驶员监控（通过开关控制）
* 从驾驶栈中移除GPS
* 100KB的qlogs
* 经过1000小时硬件在环测试后推送`nightly`版本
* 汽车接口代码移至[opendbc](https://github.com/commaai/opendbc)
* openpilot在PC上支持Linux x86、Linux arm64和Mac（Apple Silicon）

## openpilot 1.0

openpilot 1.0将具有完全端到端的驾驶策略。

* 在Chill模式下端到端纵向控制
* 自动紧急制动(AEB)
* 带睡眠检测的驾驶员监控
* 由CI推送的滚动更新/发布
* [panda安全1.0](https://github.com/orgs/commaai/projects/27)