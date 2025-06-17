<div align="center" style="text-align: center;">

<h1>openpilot</h1>

<p>
  <b>openpilot is an operating system for robotics.</b>
  <br>
  Currently, it upgrades the driver assistance system in 300+ supported cars.
</p>

<p>
  <b>openpilot是一个机器人操作系统。</b>
  <br>
  目前，它可以升级300多种支持车型的驾驶辅助系统。
</p>

<h3>
  <a href="https://docs.comma.ai">Docs</a>
  <span> · </span>
  <a href="https://docs.comma.ai/contributing/roadmap/">Roadmap</a>
  <span> · </span>
  <a href="https://github.com/commaai/openpilot/blob/master/docs/CONTRIBUTING.md">Contribute</a>
  <span> · </span>
  <a href="https://discord.comma.ai">Community</a>
  <span> · </span>
  <a href="https://comma.ai/shop">Try it on a comma 3X</a>
</h3>

<h3>
  <a href="https://docs.comma.ai">文档</a>
  <span> · </span>
  <a href="https://docs.comma.ai/contributing/roadmap/">路线图</a>
  <span> · </span>
  <a href="https://github.com/commaai/openpilot/blob/master/docs/CONTRIBUTING.md">贡献</a>
  <span> · </span>
  <a href="https://discord.comma.ai">社区</a>
  <span> · </span>
  <a href="https://comma.ai/shop">在comma 3X上试用</a>
</h3>

Quick start: `bash <(curl -fsSL openpilot.comma.ai)`

快速开始：`bash <(curl -fsSL openpilot.comma.ai)`

[![openpilot tests](https://github.com/commaai/openpilot/actions/workflows/selfdrive_tests.yaml/badge.svg)](https://github.com/commaai/openpilot/actions/workflows/selfdrive_tests.yaml)
[![codecov](https://codecov.io/gh/commaai/openpilot/branch/master/graph/badge.svg)](https://codecov.io/gh/commaai/openpilot)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![X Follow](https://img.shields.io/twitter/follow/comma_ai)](https://x.com/comma_ai)
[![Discord](https://img.shields.io/discord/469524606043160576)](https://discord.comma.ai)

</div>

<table>
  <tr>
    <td><a href="https://youtu.be/NmBfgOanCyk" title="Video By Greer Viau"><img src="https://github.com/commaai/openpilot/assets/8762862/2f7112ae-f748-4f39-b617-fabd689c3772"></a></td>
    <td><a href="https://youtu.be/VHKyqZ7t8Gw" title="Video By Logan LeGrand"><img src="https://github.com/commaai/openpilot/assets/8762862/92351544-2833-40d7-9e0b-7ef7ae37ec4c"></a></td>
    <td><a href="https://youtu.be/SUIZYzxtMQs" title="A drive to Taco Bell"><img src="https://github.com/commaai/openpilot/assets/8762862/05ceefc5-2628-439c-a9b2-89ce77dc6f63"></a></td>
  </tr>
</table>


Using openpilot in a car
------

To use openpilot in a car, you need four things:
1. **Supported Device:** a comma 3/3X, available at [comma.ai/shop](https://comma.ai/shop/comma-3x).
2. **Software:** The setup procedure for the comma 3/3X allows users to enter a URL for custom software. Use the URL `openpilot.comma.ai` to install the release version.
3. **Supported Car:** Ensure that you have one of [the 275+ supported cars](docs/CARS.md).
4. **Car Harness:** You will also need a [car harness](https://comma.ai/shop/car-harness) to connect your comma 3/3X to your car.

在车中使用openpilot
------

要在车中使用openpilot，你需要四样东西：
1. **支持的设备：** comma 3/3X，可在[comma.ai/shop](https://comma.ai/shop/comma-3x)购买。
2. **软件：** comma 3/3X的设置程序允许用户输入自定义软件的URL。使用URL `openpilot.comma.ai`来安装发布版本。
3. **支持的车型：** 确保你拥有[275+支持车型](docs/CARS.md)中的一款。
4. **车辆连接线束：** 你还需要一个[车辆连接线束](https://comma.ai/shop/car-harness)来将你的comma 3/3X连接到你的车辆。

We have detailed instructions for [how to install the harness and device in a car](https://comma.ai/setup). Note that it's possible to run openpilot on [other hardware](https://blog.comma.ai/self-driving-car-for-free/), although it's not plug-and-play.

我们有关于[如何在车中安装线束和设备](https://comma.ai/setup)的详细说明。请注意，虽然可以在[其他硬件](https://blog.comma.ai/self-driving-car-for-free/)上运行openpilot，但它不是即插即用的。

### Branches
| branch           | URL                                    | description                                                                         |
|------------------|----------------------------------------|-------------------------------------------------------------------------------------|
| `release3`         | openpilot.comma.ai                      | This is openpilot's release branch.                                                 |
| `release3-staging` | openpilot-test.comma.ai                | This is the staging branch for releases. Use it to get new releases slightly early. |
| `nightly`          | openpilot-nightly.comma.ai             | This is the bleeding edge development branch. Do not expect this to be stable.      |
| `nightly-dev`      | installer.comma.ai/commaai/nightly-dev | Same as nightly, but includes experimental development features for some cars.      |
| `secretgoodopenpilot` | installer.comma.ai/commaai/secretgoodopenpilot | This is a preview branch from the autonomy team where new driving models get merged earlier than master. |

### 分支
| 分支           | URL                                    | 描述                                                                         |
|------------------|----------------------------------------|-------------------------------------------------------------------------------------|
| `release3`         | openpilot.comma.ai                      | 这是openpilot的发布分支。                                                 |
| `release3-staging` | openpilot-test.comma.ai                | 这是发布的预发布分支。使用它可以稍早获得新版本。 |
| `nightly`          | openpilot-nightly.comma.ai             | 这是前沿开发分支。不要期望它是稳定的。      |
| `nightly-dev`      | installer.comma.ai/commaai/nightly-dev | 与nightly相同，但包括一些车型的实验性开发功能。      |
| `secretgoodopenpilot` | installer.comma.ai/commaai/secretgoodopenpilot | 这是自动驾驶团队的预览分支，新的驾驶模型会比主分支更早合并到这里。 |

To start developing openpilot
------

开始开发openpilot
------

openpilot由[comma](https://comma.ai/)和像你这样的用户开发。我们欢迎在[GitHub](http://github.com/commaai/openpilot)上提交拉取请求和问题。

* Join the [community Discord](https://discord.comma.ai)
* Check out [the contributing docs](docs/CONTRIBUTING.md)
* Check out the [openpilot tools](tools/)
* Code documentation lives at https://docs.comma.ai
* Information about running openpilot lives on the [community wiki](https://github.com/commaai/openpilot/wiki)

* 加入[社区Discord](https://discord.comma.ai)
* 查看[贡献文档](docs/CONTRIBUTING.md)
* 查看[openpilot工具](tools/)
* 代码文档位于https://docs.comma.ai
* 关于运行openpilot的信息位于[社区wiki](https://github.com/commaai/openpilot/wiki)

Want to get paid to work on openpilot? [comma is hiring](https://comma.ai/jobs#open-positions) and offers lots of [bounties](https://comma.ai/bounties) for external contributors.

想要获得报酬来开发openpilot吗？[comma正在招聘](https://comma.ai/jobs#open-positions)，并为外部贡献者提供许多[赏金任务](https://comma.ai/bounties)。

Safety and Testing
----

* openpilot observes [ISO26262](https://en.wikipedia.org/wiki/ISO_26262) guidelines, see [SAFETY.md](docs/SAFETY.md) for more details.
* openpilot has software-in-the-loop [tests](.github/workflows/selfdrive_tests.yaml) that run on every commit.
* The code enforcing the safety model lives in panda and is written in C, see [code rigor](https://github.com/commaai/panda#code-rigor) for more details.
* panda has software-in-the-loop [safety tests](https://github.com/commaai/panda/tree/master/tests/safety).
* Internally, we have a hardware-in-the-loop Jenkins test suite that builds and unit tests the various processes.
* panda has additional hardware-in-the-loop [tests](https://github.com/commaai/panda/blob/master/Jenkinsfile).
* We run the latest openpilot in a testing closet containing 10 comma devices continuously replaying routes.

安全和测试
----

* openpilot遵循[ISO26262](https://en.wikipedia.org/wiki/ISO_26262)指南，更多详情请参阅[SAFETY.md](docs/SAFETY.md)。
* openpilot有软件在环[测试](.github/workflows/selfdrive_tests.yaml)，在每次提交时运行。
* 实施安全模型的代码位于panda中，并用C语言编写，更多详情请参阅[代码严谨性](https://github.com/commaai/panda#code-rigor)。
* panda有软件在环[安全测试](https://github.com/commaai/panda/tree/master/tests/safety)。
* 在内部，我们有一个硬件在环Jenkins测试套件，用于构建和单元测试各种进程。
* panda有额外的硬件在环[测试](https://github.com/commaai/panda/blob/master/Jenkinsfile)。
* 我们在一个测试机柜中运行最新的openpilot，其中包含10个comma设备，不断重放路线。

<details>
<summary>MIT Licensed</summary>

openpilot is released under the MIT license. Some parts of the software are released under other licenses as specified.

Any user of this software shall indemnify and hold harmless Comma.ai, Inc. and its directors, officers, employees, agents, stockholders, affiliates, subcontractors and customers from and against all allegations, claims, actions, suits, demands, damages, liabilities, obligations, losses, settlements, judgments, costs and expenses (including without limitation attorneys' fees and costs) which arise out of, relate to or result from any use of this software by user.

**THIS IS ALPHA QUALITY SOFTWARE FOR RESEARCH PURPOSES ONLY. THIS IS NOT A PRODUCT.
YOU ARE RESPONSIBLE FOR COMPLYING WITH LOCAL LAWS AND REGULATIONS.
NO WARRANTY EXPRESSED OR IMPLIED.**
</details>

<details>
<summary>MIT许可证</summary>

openpilot根据MIT许可证发布。软件的某些部分根据指定的其他许可证发布。

本软件的任何用户应当赔偿并使Comma.ai, Inc.及其董事、高管、员工、代理人、股东、附属机构、分包商和客户免受因用户使用本软件而产生的、与之相关的或由此导致的所有指控、索赔、行动、诉讼、要求、损害、责任、义务、损失、和解、判决、成本和费用（包括但不限于律师费和成本）。

**这是仅用于研究目的的ALPHA质量软件。这不是产品。
您有责任遵守当地法律和法规。
不提供明示或暗示的保证。**
</details>

<details>
<summary>User Data and comma Account</summary>

By default, openpilot uploads the driving data to our servers. You can also access your data through [comma connect](https://connect.comma.ai/). We use your data to train better models and improve openpilot for everyone.

openpilot is open source software: the user is free to disable data collection if they wish to do so.

openpilot logs the road-facing cameras, CAN, GPS, IMU, magnetometer, thermal sensors, crashes, and operating system logs.
The driver-facing camera is only logged if you explicitly opt-in in settings. The microphone is not recorded.

By using openpilot, you agree to [our Privacy Policy](https://comma.ai/privacy). You understand that use of this software or its related services will generate certain types of user data, which may be logged and stored at the sole discretion of comma. By accepting this agreement, you grant an irrevocable, perpetual, worldwide right to comma for the use of this data.
</details>

<details>
<summary>用户数据和comma账户</summary>

默认情况下，openpilot会将驾驶数据上传到我们的服务器。你也可以通过[comma connect](https://connect.comma.ai/)访问你的数据。我们使用你的数据来训练更好的模型，并为所有人改进openpilot。

openpilot是开源软件：如果用户希望，可以自由禁用数据收集。

openpilot记录面向道路的摄像头、CAN总线、GPS、IMU、磁力计、热传感器、崩溃和操作系统日志。
只有在设置中明确选择加入时，才会记录面向驾驶员的摄像头。不会录制麦克风。

通过使用openpilot，你同意[我们的隐私政策](https://comma.ai/privacy)。你理解使用本软件或其相关服务将产生某些类型的用户数据，这些数据可能会由comma自行决定记录和存储。接受本协议即表示你授予comma对这些数据使用的不可撤销、永久、全球性权利。
</details>
