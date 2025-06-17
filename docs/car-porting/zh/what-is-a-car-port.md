# 什么是车型适配？

车型适配使openpilot能够支持特定的汽车。openpilot支持的每种车型都需要单独进行适配。车型适配的复杂性取决于多种因素，包括：

* openpilot对类似车型的现有支持
* 汽车中可用的架构和API


# 车型适配的结构

几乎所有特定车型的代码都包含在两个其他仓库中：[opendbc](https://github.com/commaai/opendbc)和[panda](https://github.com/commaai/panda)。

## opendbc

每个汽车品牌都通过`opendbc/car/[brand]`中的标准接口结构支持：

* `interface.py`：汽车的接口，定义CarInterface类
* `carstate.py`：从汽车读取CAN消息并构建openpilot CarState消息
* `carcontroller.py`：控制逻辑，用于在汽车上执行openpilot CarControl操作
* `[brand]can.py`：组合CAN消息供carcontroller发送
* `values.py`：执行器的限制，汽车的一般常量，以及支持的汽车文档
* `radar_interface.py`：用于解析汽车雷达点的接口（如适用）

## panda

* `board/safety/safety_[brand].h`：特定品牌的安全逻辑
* `tests/safety/test_[brand].py`：特定品牌的安全CI测试

## openpilot

由于历史原因，openpilot仍然包含少量特定车型的逻辑。这些最终将迁移到opendbc或以其他方式移除。

* `selfdrive/car/car_specific.py`：特定品牌的事件逻辑

# 概述

[Jason Young](https://github.com/jyoung8607)在COMMA_CON上做了一个关于车型适配过程的演讲。该演讲可在YouTube上观看：

https://www.youtube.com/watch?v=XxPS5TpTUnI