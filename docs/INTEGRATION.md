# Integration with Stock Features

In all supported cars:
* Stock Lane Keep Assist (LKA) and stock ALC are replaced by openpilot ALC, which only functions when openpilot is engaged by the user.
* Stock LDW is replaced by openpilot LDW.

Additionally, on specific supported cars (see ACC column in [supported cars](CARS.md)):
* Stock ACC is replaced by openpilot ACC.
* openpilot FCW operates in addition to stock FCW.

openpilot should preserve all other vehicle's stock features, including, but not limited to: FCW, Automatic Emergency Braking (AEB), auto high-beam, blind spot warning, and side collision warning.

# 与原厂功能的集成

在所有支持的车型中：
* 原厂车道保持辅助(LKA)和原厂自动车道居中(ALC)被openpilot的ALC所替代，openpilot的ALC仅在用户启用openpilot时才会工作。
* 原厂车道偏离警告(LDW)被openpilot的LDW所替代。

此外，在特定支持的车型上（参见[支持的车型](CARS.md)中的ACC列）：
* 原厂自适应巡航控制(ACC)被openpilot的ACC所替代。
* openpilot的前方碰撞警告(FCW)与原厂FCW一起工作。

openpilot应保留车辆的所有其他原厂功能，包括但不限于：前方碰撞警告(FCW)、自动紧急制动(AEB)、自动远光灯、盲点警告和侧面碰撞警告。
