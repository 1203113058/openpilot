#!/usr/bin/env python3
# 指定使用Python3解释器

import argparse  # 用于解析命令行参数
from typing import Any  # 类型注解支持
from multiprocessing import Queue  # 进程间通信队列

# 导入自定义的模拟器桥接模块
from openpilot.tools.sim.bridge.metadrive.metadrive_bridge import MetaDriveBridge

def create_bridge(dual_camera, high_quality):
  """创建并启动模拟器桥接
  Args:
    dual_camera: 是否使用双摄像头模式
    high_quality: 是否启用高质量渲染模式
  Returns:
    返回通信队列、模拟器进程和桥接实例
  """
  queue: Any = Queue()  # 创建进程间通信队列

  # 初始化MetaDrive模拟器桥接
  simulator_bridge = MetaDriveBridge(dual_camera, high_quality)
  # 启动模拟器进程
  simulator_process = simulator_bridge.run(queue)

  return queue, simulator_process, simulator_bridge

def main():
  """主运行函数（简化版）"""
  _, simulator_process, _ = create_bridge(True, False)
  simulator_process.join()  # 等待模拟器进程结束

def parse_args(add_args=None):
  """解析命令行参数
  Args:
    add_args: 可选的附加参数列表（用于测试）
  Returns:
    解析后的参数对象
  """
  parser = argparse.ArgumentParser(description='模拟器与openpilot之间的桥接程序')
  # 添加命令行参数
  parser.add_argument('--joystick', action='store_true', help='使用游戏手柄控制')
  parser.add_argument('--high_quality', action='store_true', help='启用高质量渲染模式')
  parser.add_argument('--dual_camera', action='store_true', help='使用双摄像头模式')

  return parser.parse_args(add_args)

if __name__ == "__main__":
  # 主程序入口
  args = parse_args()  # 解析命令行参数

  # 创建模拟器桥接
  queue, simulator_process, simulator_bridge = create_bridge(args.dual_camera, args.high_quality)

  if args.joystick:
    # 如果指定了游戏手柄模式
    from openpilot.tools.sim.lib.manual_ctrl import wheel_poll_thread
    wheel_poll_thread(queue)  # 启动游戏手柄控制线程
  else:
    # 默认使用键盘控制模式
    from openpilot.tools.sim.lib.keyboard_ctrl import keyboard_poll_thread
    keyboard_poll_thread(queue)  # 启动键盘控制线程

  # 关闭模拟器桥接
  simulator_bridge.shutdown()
  # 等待模拟器进程结束
  simulator_process.join()

