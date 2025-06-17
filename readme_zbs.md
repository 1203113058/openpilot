# openpilot框架逻辑与运行指南
包括自适应巡航控制(ACC)
自动车道居中(ALC)、
前方碰撞警告(FCW)
车道偏离警告(LDW)
## 系统架构

openpilot采用进程管理器架构，由多个独立进程组成，每个进程负责特定功能。主要组件包括：

### 1. 系统管理器(system/manager)
- 负责启动和监控所有进程
- 管理系统状态转换(onroad/offroad)
- 处理系统参数和配置

### 2. 传感器处理
- **camerad**: 处理摄像头数据 - `system/camerad/`
  - 主程序: `system/camerad/main.cc`
  - 摄像头传感器: `system/camerad/sensors/`
- **sensord**: 处理车辆传感器数据 - `system/sensord/sensord.py`
- **ubloxd/pigeond**: 处理GPS数据
  - ubloxd: `system/ubloxd/ubloxd.cc` - 处理Ublox GPS模块
  - pigeond: `system/ubloxd/pigeond.py` - 处理Pigeon GPS模块

### 3. 车辆控制
- **controlsd**: 主控制进程，协调各个控制模块 - `selfdrive/controls/controlsd.py`
- **plannerd**: 路径规划 - `selfdrive/controls/plannerd.py`
  - 规划逻辑: `selfdrive/controls/lib/planner.py`
  - 纵向控制: `selfdrive/controls/lib/longitudinal_planner.py`
  - 横向控制: `selfdrive/controls/lib/lateral_planner.py`
- **radard**: 雷达处理 - `selfdrive/controls/radard.py`
  - 雷达状态: `selfdrive/controls/lib/radar_helpers.py`
- **selfdrive**: 自动驾驶核心功能 - `selfdrive/`
  - 车辆接口: `selfdrive/car/`
  - 控制系统: `selfdrive/controls/`
  - 定位系统: `selfdrive/locationd/`

### 4. 模型推理
- **modeld**: 视觉模型推理 - `selfdrive/modeld/modeld.py`
  - 模型定义: `selfdrive/modeld/models/`
  - 模型运行器: `selfdrive/modeld/runners/`
  - 图像变换: `selfdrive/modeld/transforms/`
- **dmonitoringmodeld**: 驾驶员监控模型 - `selfdrive/modeld/dmonitoringmodeld.py`
  - 驾驶员监控模型: `selfdrive/modeld/models/dmonitoring.cc`

#### 神经网络模型详解

##### 驾驶模型（视觉模型 + 时序策略模型）
###### 视觉输入 (总大小: 799906 x float32)
* **图像流**
  * 以20Hz记录的两个连续图像 (256 * 512 * 3 RGB格式) : 393216 = 2 * 6 * 128 * 256
    * 每个256 * 512图像以YUV420格式表示，包含6个通道 : 6 * 128 * 256
      * 通道0,1,2,3代表全分辨率Y通道，在numpy中表示为Y[::2, ::2], Y[::2, 1::2], Y[1::2, ::2], Y[1::2, 1::2]
      * 通道4代表半分辨率U通道
      * 通道5代表半分辨率V通道
* **广角图像流**
  * 同样的格式，提供更宽视野的图像输入

###### 策略输入
* **期望行为**
  * 一个热编码缓冲区，用于命令模型执行特定动作，需要发送过去5秒的数据(20FPS) : 100 * 8
* **交通规则**
  * 一个热编码向量，告诉模型是靠右行驶还是靠左行驶 : 2
* **横向控制参数**
  * 速度和转向延迟，用于预测所需曲率 : 2
* **先前期望的曲率**
  * 先前预测的期望曲率向量 : 100 * 1
* **特征缓冲区**
  * 包含当前特征在内的中间特征缓冲区，形成5秒的时间上下文(20FPS) : 100 * 512

##### 驾驶员监控模型
###### 输入格式
* 单一图像 W = 1440 H = 960 亮度通道(Y)，来自平面YUV420格式:
  * 完整输入大小为 1440 * 960 = 1382400
  * 归一化范围从0.0到1.0的float32(onnx运行器)或从0到255的uint8(snpe运行器)
* 相机校准角度(横滚、俯仰、偏航)来自liveCalibration: 3 x float32输入

###### 输出格式
* 84 x float32输出 = 2 + 41 * 2
  * 对于前排座位的每个人(2 * 41)
    * 面部姿势: 12 = 6 + 6
      * 面部方向[俯仰、偏航、横滚]在相机坐标系中: 3
      * 面部位置[dx, dy]相对于图像中心: 2
      * 归一化面部大小: 1
      * 以上输出的标准偏差: 6
    * 面部可见概率: 1
    * 眼睛: 20 = (8 + 1) + (8 + 1) + 1 + 1
      * 眼睛位置和大小，及其标准偏差: 8
      * 眼睛可见概率: 1
      * 眼睛闭合概率: 1
    * 佩戴太阳镜概率: 1
    * 面部遮挡概率: 1
    * 接触方向盘概率: 1
    * 注意力集中概率: 1
    * (已弃用)分心概率: 2
    * 使用手机概率: 1
    * 分心概率: 1
  * 通用输出 2
    * 相机视觉不良概率: 1
    * 左侧驾驶概率: 1

### 5. UI和用户交互
- **ui**: 用户界面 - `selfdrive/ui/`
  - 主程序: `selfdrive/ui/main.cc`
  - UI组件: `selfdrive/ui/qt/`
  - 屏幕显示: `selfdrive/ui/qt/onroad.cc`
- **soundd**: 声音提示 - `selfdrive/ui/soundd.py`
  - 声音资源: `selfdrive/assets/sounds/`

## 通信机制

各进程间通过cereal库实现的消息队列(msgq)进行通信，这是一个基于ZeroMQ的高性能消息传递系统。进程间通信采用发布-订阅模式，确保数据流的高效传输。

## 硬件抽象

openpilot支持不同硬件平台，主要是comma设备(如comma 3X)和一些PC环境。硬件抽象层使系统能够在不同平台上运行。

## 如何运行openpilot

### 在comma设备上运行

1. **硬件需求**:
   - comma 3X设备
   - 适配你车型的连接线束
   - 支持的车型(参见docs/CARS.md)

2. **安装步骤**:
   - 购买并安装硬件
   - 在设备设置过程中，输入`openpilot.comma.ai`作为软件URL
   - 系统会自动下载并安装openpilot

3. **启动系统**:
   - 安装完成后，系统会自动启动
   - 主要启动流程是通过`launch_openpilot.sh`脚本，它会调用`launch_chffrplus.sh`
   - 最终启动`system/manager/manager.py`，这是系统的主进程管理器

### 在PC上运行(开发环境)

1. **环境设置**:
   ```bash
   git clone https://github.com/commaai/openpilot.git
   cd openpilot
   tools/op.sh setup
   source .venv/bin/activate
   scons -u -j$(nproc)
   ```

2. **运行模拟器**:
   - 可以使用内置的模拟器进行测试：`tools/sim/run_sim.sh`

3. **使用网络摄像头**:
   - 如果要使用网络摄像头模拟真实驾驶场景：
   ```bash
   USE_WEBCAM=1 system/manager/manager.py
   ```

4. **回放数据**:
   - 可以使用replay工具回放真实驾驶数据：
   ```bash
   tools/replay/replay --demo
   ```

## 系统启动流程

1. **manager.py初始化**:
   - 注册设备
   - 初始化参数
   - 设置日志系统

2. **进程管理**:
   - 根据`process_config.py`中的配置启动各个进程
   - 监控进程状态，必要时重启

3. **状态管理**:
   - 系统区分onroad(行驶中)和offroad(停车)两种状态
   - 不同状态下启动不同的进程集

## 核心功能实现

1. **视觉处理**:
   - 使用深度学习模型处理摄像头图像
   - 模型位于`selfdrive/modeld/models/`目录

2. **车道保持和自适应巡航**:
   - 通过`controlsd`进程协调控制
   - 结合视觉模型输出和车辆传感器数据

3. **驾驶员监控**:
   - 通过`dmonitoringd`进程实现
   - 使用专用的驾驶员监控模型检测注意力分散

4. **车辆接口**:
   - 通过`car`模块与不同品牌和型号的车辆通信
   - 使用标准化的CAN总线接口

## 总结

openpilot的设计哲学是模块化和可扩展性，使其能够适应不同的车型和驾驶场景。系统的核心是进程管理器，它协调各个功能模块的运行，确保系统的稳定性和响应性。通过开源社区的贡献，openpilot不断改进和扩展，为更多车型提供高级驾驶辅助功能。

## export ZMQ=1 环境变量的用途

### 主要功能

`export ZMQ=1` 命令设置了一个名为 `ZMQ` 的环境变量，值为 `1`，告诉 openpilot 使用 ZeroMQ (ZMQ) 作为进程间通信机制，而不是默认的 MSGQ（Message Queue）系统。

### 为什么需要这个设置

1. **macOS 兼容性**：
   - openpilot 的默认消息队列系统 MSGQ 不兼容 macOS
   - 在 macOS 上必须使用 ZMQ 替代
   - 在 `tools/install_python_dependencies.sh` 中，当检测到 macOS 系统时，会自动添加此环境变量

2. **进程间通信**：
   - ZeroMQ 是一个高性能的异步消息传递库
   - 在 openpilot 中，不同的进程（如摄像头处理、控制逻辑、UI 等）需要相互通信
   - 设置 `ZMQ=1` 后，所有这些进程会使用 ZeroMQ 协议进行通信

3. **模拟环境**：
   - 在使用 replay 工具进行模拟时，特别需要这个设置
   - 从 `tools/replay/README.md` 中可以看到，回放命令示例中明确包含了 `ZMQ=1`

### 应用场景

这个环境变量在多个工具和场景中被使用：

1. **回放工具**：`tools/replay/`
2. **可视化工具**：`tools/plotjuggler/`
3. **摄像头流处理**：`tools/camerastream/`
4. **转向精度测量**：`tools/tuning/measure_steering_accuracy.py`
5. **日志读取器**：`tools/lib/live_logreader.py`

### 使用方法

在运行 openpilot 相关命令前设置此环境变量：

```bash
# 方法1：临时设置（仅对当前终端会话有效）
export ZMQ=1
tools/replay/replay --demo

# 方法2：在命令前直接设置（仅对该命令有效）
ZMQ=1 tools/replay/replay --demo

# 方法3：永久设置（对所有终端会话有效）
echo 'export ZMQ=1' >> ~/.bash_profile  # 或 ~/.zshrc
source ~/.bash_profile  # 或 source ~/.zshrc
```

### 总结

`export ZMQ=1` 是在 macOS 上开发或使用 openpilot 时的关键环境变量设置。它告诉系统使用 ZeroMQ 作为通信机制，这对于在 macOS 上运行模拟、回放和其他开发工具至关重要，因为 macOS 不支持 openpilot 的默认 MSGQ 系统。
