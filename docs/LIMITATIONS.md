# Limitations
## Limitations of openpilot ALC and LDW

openpilot ALC and openpilot LDW do not automatically drive the vehicle or reduce the amount of attention that must be paid to operate your vehicle. The driver must always keep control of the steering wheel and be ready to correct the openpilot ALC action at all times.

While changing lanes, openpilot is not capable of looking next to you or checking your blind spot. Only nudge the wheel to initiate a lane change after you have confirmed it's safe to do so.

Many factors can impact the performance of openpilot ALC and openpilot LDW, causing them to be unable to function as intended. These include, but are not limited to:

* Poor visibility (heavy rain, snow, fog, etc.) or weather conditions that may interfere with sensor operation.
* The road facing camera is obstructed, covered or damaged by mud, ice, snow, etc.
* Obstruction caused by applying excessive paint or adhesive products (such as wraps, stickers, rubber coating, etc.) onto the vehicle.
* The device is mounted incorrectly.
* When in sharp curves, like on-off ramps, intersections etc...; openpilot is designed to be limited in the amount of steering torque it can produce.
* In the presence of restricted lanes or construction zones.
* When driving on highly banked roads or in presence of strong cross-wind.
* Extremely hot or cold temperatures.
* Bright light (due to oncoming headlights, direct sunlight, etc.).
* Driving on hills, narrow, or winding roads.

The list above does not represent an exhaustive list of situations that may interfere with proper operation of openpilot components. It is the driver's responsibility to be in control of the vehicle at all times.

## Limitations of openpilot ACC and FCW

openpilot ACC and openpilot FCW are not systems that allow careless or inattentive driving. It is still necessary for the driver to pay close attention to the vehicle's surroundings and to be ready to re-take control of the gas and the brake at all times.

Many factors can impact the performance of openpilot ACC and openpilot FCW, causing them to be unable to function as intended. These include, but are not limited to:

* Poor visibility (heavy rain, snow, fog, etc.) or weather conditions that may interfere with sensor operation.
* The road facing camera or radar are obstructed, covered, or damaged by mud, ice, snow, etc.
* Obstruction caused by applying excessive paint or adhesive products (such as wraps, stickers, rubber coating, etc.) onto the vehicle.
* The device is mounted incorrectly.
* Approaching a toll booth, a bridge or a large metal plate.
* When driving on roads with pedestrians, cyclists, etc...
* In presence of traffic signs or stop lights, which are not detected by openpilot at this time.
* When the posted speed limit is below the user selected set speed. openpilot does not detect speed limits at this time.
* In presence of vehicles in the same lane that are not moving.
* When abrupt braking maneuvers are required. openpilot is designed to be limited in the amount of deceleration and acceleration that it can produce.
* When surrounding vehicles perform close cut-ins from neighbor lanes.
* Driving on hills, narrow, or winding roads.
* Extremely hot or cold temperatures.
* Bright light (due to oncoming headlights, direct sunlight, etc.).
* Interference from other equipment that generates radar waves.

The list above does not represent an exhaustive list of situations that may interfere with proper operation of openpilot components. It is the driver's responsibility to be in control of the vehicle at all times.

## Limitations of openpilot DM

openpilot DM should not be considered an exact measurement of the alertness of the driver.

Many factors can impact the performance of openpilot DM, causing it to be unable to function as intended. These include, but are not limited to:

* Low light conditions, such as driving at night or in dark tunnels.
* Bright light (due to oncoming headlights, direct sunlight, etc.).
* The driver's face is partially or completely outside field of view of the driver facing camera.
* The driver facing camera is obstructed, covered, or damaged.

The list above does not represent an exhaustive list of situations that may interfere with proper operation of openpilot components. A driver should not rely on openpilot DM to assess their level of attention.

# 局限性
## openpilot自动车道居中(ALC)和车道偏离警告(LDW)的局限性

openpilot的ALC和LDW不会自动驾驶车辆或减少操作车辆所需的注意力。驾驶员必须始终保持对方向盘的控制，并随时准备纠正openpilot ALC的动作。

在变道时，openpilot无法查看你旁边的情况或检查你的盲点。只有在确认安全的情况下，才能轻推方向盘启动变道。

许多因素可能影响openpilot ALC和openpilot LDW的性能，导致它们无法按预期运行。这些因素包括但不限于：

* 能见度差（大雨、雪、雾等）或可能干扰传感器操作的天气条件。
* 面向道路的摄像头被泥、冰、雪等阻挡、覆盖或损坏。
* 在车辆上使用过多的油漆或粘合产品（如车贴、贴纸、橡胶涂层等）导致的阻碍。
* 设备安装不正确。
* 在急转弯处，如匝道、交叉路口等；openpilot的转向力矩输出是有限制的。
* 在有限制车道或施工区域。
* 在高度倾斜的道路上行驶或存在强横风。
* 极热或极冷的温度。
* 强光（由于迎面车灯、直射阳光等）。
* 在山路、狭窄或蜿蜒的道路上行驶。

上述列表并不代表可能干扰openpilot组件正常运行的所有情况。驾驶员有责任始终控制车辆。

## openpilot自适应巡航控制(ACC)和前方碰撞警告(FCW)的局限性

openpilot ACC和openpilot FCW不是允许粗心或不注意驾驶的系统。驾驶员仍然需要密切关注车辆周围环境，并随时准备重新控制油门和刹车。

许多因素可能影响openpilot ACC和openpilot FCW的性能，导致它们无法按预期运行。这些因素包括但不限于：

* 能见度差（大雨、雪、雾等）或可能干扰传感器操作的天气条件。
* 面向道路的摄像头或雷达被泥、冰、雪等阻挡、覆盖或损坏。
* 在车辆上使用过多的油漆或粘合产品（如车贴、贴纸、橡胶涂层等）导致的阻碍。
* 设备安装不正确。
* 接近收费站、桥梁或大型金属板。
* 在有行人、骑自行车者等的道路上行驶。
* 存在交通标志或红绿灯，目前openpilot无法检测这些。
* 当道路限速低于用户选择的设定速度时。openpilot目前不检测限速。
* 同车道中存在不移动的车辆。
* 需要紧急制动时。openpilot的减速和加速能力是有限制的。
* 当周围车辆从相邻车道突然切入时。
* 在山路、狭窄或蜿蜒的道路上行驶。
* 极热或极冷的温度。
* 强光（由于迎面车灯、直射阳光等）。
* 其他产生雷达波的设备干扰。

上述列表并不代表可能干扰openpilot组件正常运行的所有情况。驾驶员有责任始终控制车辆。

## openpilot驾驶员监控(DM)的局限性

openpilot DM不应被视为对驾驶员警觉性的精确测量。

许多因素可能影响openpilot DM的性能，导致它无法按预期运行。这些因素包括但不限于：

* 低光照条件，如夜间驾驶或在黑暗隧道中行驶。
* 强光（由于迎面车灯、直射阳光等）。
* 驾驶员的脸部部分或完全超出驾驶员朝向摄像头的视野。
* 驾驶员朝向摄像头被阻挡、覆盖或损坏。

上述列表并不代表可能干扰openpilot组件正常运行的所有情况。驾驶员不应依赖openpilot DM来评估其注意力水平。
