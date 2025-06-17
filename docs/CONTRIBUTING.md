# How to contribute

Our software is open source so you can solve your own problems without needing help from others. And if you solve a problem and are so kind, you can upstream it for the rest of the world to use. Check out our [post about externalization](https://blog.comma.ai/a-2020-theme-externalization/).

Development is coordinated through [Discord](https://discord.comma.ai) and GitHub.

### Getting Started

* Setup your [development environment](../tools/)
* Join our [Discord](https://discord.comma.ai)
* Docs are at https://docs.comma.ai and https://blog.comma.ai

## What contributions are we looking for?

**openpilot's priorities are [safety](SAFETY.md), stability, quality, and features, in that order.**
openpilot is part of comma's mission to *solve self-driving cars while delivering shippable intermediaries*, and all development is towards that goal.

### What gets merged?

The probability of a pull request being merged is a function of its value to the project and the effort it will take us to get it merged.
If a PR offers *some* value but will take lots of time to get merged, it will be closed.
Simple, well-tested bug fixes are the easiest to merge, and new features are the hardest to get merged.

All of these are examples of good PRs:
* typo fix: https://github.com/commaai/openpilot/pull/30678
* removing unused code: https://github.com/commaai/openpilot/pull/30573
* simple car model port: https://github.com/commaai/openpilot/pull/30245
* car brand port: https://github.com/commaai/openpilot/pull/23331

### What doesn't get merged?

* **style changes**: code is art, and it's up to the author to make it beautiful
* **500+ line PRs**: clean it up, break it up into smaller PRs, or both
* **PRs without a clear goal**: every PR must have a singular and clear goal
* **UI design**: we do not have a good review process for this yet
* **New features**: We believe openpilot is mostly feature-complete, and the rest is a matter of refinement and fixing bugs. As a result of this, most feature PRs will be immediately closed, however the beauty of open source is that forks can and do offer features that upstream openpilot doesn't.
* **Negative expected value**: This a class of PRs that makes an improvement, but the risk or validation costs more than the improvement. The risk can be mitigated by first getting a failing test merged.

### First contribution

[Projects / openpilot bounties](https://github.com/orgs/commaai/projects/26/views/1?pane=info) is the best place to get started and goes in-depth on what's expected when working on a bounty.
There's lot of bounties that don't require a comma 3/3X or a car.

## Pull Requests

Pull requests should be against the master branch.

A good pull request has all of the following:
* a clearly stated purpose
* every line changed directly contributes to the stated purpose
* verification, i.e. how did you test your PR?
* justification
  * if you've optimized something, post benchmarks to prove it's better
  * if you've improved your car's tuning, post before and after plots
* passes the CI tests

## Contributing without Code

* Report bugs in GitHub issues.
* Report driving issues in the `#driving-feedback` Discord channel.
* Consider opting into driver camera uploads to improve the driver monitoring model.
* Connect your device to Wi-Fi regularly, so that we can pull data for training better driving models.
* Run the `nightly` branch and report issues. This branch is like `master` but it's built just like a release.
* Annotate images in the [comma10k dataset](https://github.com/commaai/comma10k).

## Contributing Training Data

### A guide for forks

In order for your fork's data to be eligible for the training set:
* **Your cereal messaging structs must be [compatible](../cereal#custom-forks)**
* **The definitions of all the stock messaging structs must not change**: Do not change how any of the fields are set, including everything from `selfdriveState.enabled` to `carState.steeringAngleDeg`. Instead, create your own structs and set them however you'd like.
* **Do not include cars that are not supported in upstream platforms**: Instead, create new opendbc platforms for cars that you'd like to support outside of upstream, even if it's just a trim-level difference.

# 如何贡献

我们的软件是开源的，所以你可以在不需要他人帮助的情况下解决自己的问题。如果你解决了一个问题并且愿意分享，你可以将其上游贡献给全世界使用。查看我们关于[外部化的文章](https://blog.comma.ai/a-2020-theme-externalization/)。

开发工作通过[Discord](https://discord.comma.ai)和GitHub进行协调。

### 入门指南

* 设置你的[开发环境](../tools/)
* 加入我们的[Discord](https://discord.comma.ai)
* 文档位于https://docs.comma.ai和https://blog.comma.ai

## 我们寻求什么样的贡献？

**openpilot的优先级是[安全](SAFETY.md)、稳定性、质量和功能，按此顺序排列。**
openpilot是comma使命的一部分，即*在提供可交付中间产品的同时解决自动驾驶汽车问题*，所有开发都是朝着这个目标进行的。

### 什么会被合并？

一个拉取请求被合并的概率是其对项目的价值与我们合并它所需努力的函数。
如果一个PR提供*一些*价值但需要大量时间才能合并，它将被关闭。
简单、经过良好测试的错误修复最容易合并，而新功能最难获得合并。

以下都是好的PR示例：
* 错别字修复：https://github.com/commaai/openpilot/pull/30678
* 删除未使用的代码：https://github.com/commaai/openpilot/pull/30573
* 简单的汽车模型移植：https://github.com/commaai/openpilot/pull/30245
* 汽车品牌移植：https://github.com/commaai/openpilot/pull/23331

### 什么不会被合并？

* **风格变更**：代码是艺术，由作者决定如何使其美观
* **500+行的PR**：清理它，将其分解为更小的PR，或两者兼而有之
* **没有明确目标的PR**：每个PR必须有一个单一且明确的目标
* **UI设计**：我们目前还没有一个好的审核流程
* **新功能**：我们认为openpilot在功能上已经基本完善，剩下的只是改进和修复错误。因此，大多数功能PR将立即被关闭，但开源的美妙之处在于分支可以并确实提供上游openpilot没有的功能。
* **负期望值**：这是一类PR，它做出了改进，但风险或验证成本超过了改进。通过首先合并一个失败的测试，可以减轻风险。

### 首次贡献

[Projects / openpilot bounties](https://github.com/orgs/commaai/projects/26/views/1?pane=info)是开始的最佳地方，它深入介绍了在处理悬赏任务时的期望。
有很多悬赏任务不需要comma 3/3X或汽车。

## 拉取请求

拉取请求应针对master分支。

一个好的拉取请求具有以下所有特点：
* 明确陈述的目的
* 每一行更改都直接有助于所述目的
* 验证，即你如何测试你的PR？
* 理由
  * 如果你优化了某些东西，发布基准测试以证明它更好
  * 如果你改进了汽车的调校，发布前后对比图
* 通过CI测试

## 不通过代码贡献

* 在GitHub问题中报告错误。
* 在`#driving-feedback` Discord频道中报告驾驶问题。
* 考虑选择加入驾驶员摄像头上传，以改进驾驶员监控模型。
* 定期将设备连接到Wi-Fi，以便我们可以提取数据来训练更好的驾驶模型。
* 运行`nightly`分支并报告问题。这个分支类似于`master`，但它的构建方式与发布版本相同。
* 在[comma10k数据集](https://github.com/commaai/comma10k)中标注图像。

## 贡献训练数据

### 分支指南

为了使你的分支数据有资格进入训练集：
* **你的cereal消息结构必须[兼容](../cereal#custom-forks)**
* **所有标准消息结构的定义不得更改**：不要更改任何字段的设置方式，包括从`selfdriveState.enabled`到`carState.steeringAngleDeg`的所有内容。相反，创建你自己的结构并按你喜欢的方式设置它们。
* **不要包含上游平台不支持的汽车**：相反，为你想在上游之外支持的汽车创建新的opendbc平台，即使只是装饰级别的差异。
