# 日志

openpilot以一分钟为单位记录行车路线，这些单位称为段（segments）。一条路线从点火开始，到熄火结束。

查看我们的[Python库](https://github.com/commaai/openpilot/blob/master/tools/lib/logreader.py)，了解如何读取openpilot日志。还可以查看我们的[工具](https://github.com/commaai/openpilot/tree/master/tools)，用于回放和查看您的数据。这些都是我们用来调试和开发openpilot的相同工具。

对于每个段，openpilot记录以下类型的日志：

## rlog.bz2

rlog包含openpilot进程之间传递的所有消息。查看[cereal/services.py](https://github.com/commaai/cereal/blob/master/services.py)获取所有记录服务的列表。它们是序列化的capnproto消息的bzip2压缩文件。

## {f,e,d}camera.hevc

每个摄像头流都经过H.265编码并写入其各自的文件。

* `fcamera.hevc`是道路摄像头
* `ecamera.hevc`是广角道路摄像头
* `dcamera.hevc`是驾驶员摄像头

## qlog.bz2 & qcamera.ts

qlog是rlog的抽样子集。查看[cereal/services.py](https://github.com/commaai/cereal/blob/master/services.py)了解抽样方式。

qcamera是fcamera.hevc的H.264编码、低分辨率版本。[comma connect](https://connect.comma.ai/)中显示的视频来自qcamera。

qlog和qcamera的设计目的是体积小到足以在慢速互联网上即时上传并永久存储，同时又足够有用，可用于大多数分析和调试工作。