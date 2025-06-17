# 安全

openpilot是一个自适应巡航控制(ACC)和自动车道居中(ALC)系统。
与其他ACC和ALC系统一样，openpilot是一个故障安全的被动系统，它要求
驾驶员时刻保持警觉和注意力。

为了确保驾驶员保持警觉，openpilot包含一个驾驶员监控功能，
当驾驶员分心时会发出警告。

然而，即使有一个注意力集中的驾驶员，我们仍然必须做出进一步的努力使系统
安全。我们再次强调，**驾驶员的警觉是必要的，但不足以确保
openpilot的安全使用**，并且openpilot不提供任何适用于任何目的的保证。

openpilot的开发遵循FMVSS要求并遵循
2级驾驶辅助系统的行业安全标准。特别是，我们遵守
ISO26262指南，包括来自NHTSA发布的[相关文件](https://www.nhtsa.gov/sites/nhtsa.dot.gov/files/documents/13498a_812_573_alcsystemreport.pdf)中的指南。此外，我们对openpilot中与安全相关的部分实施严格的编码指南（如[MISRA C : 2012](https://www.misra.org.uk/what-is-misra/)）。
我们还在每次软件发布前进行软件在环、
硬件在环和车辆测试。

根据危害和风险分析以及FMEA，在非常高的层面上，我们设计openpilot
确保两个主要安全要求。

1. 驾驶员必须始终能够通过踩下刹车踏板或按下取消按钮立即重新控制车辆。

2. 车辆不得过快地改变其轨迹，以便驾驶员能够安全
   反应。这意味着当系统启用时，执行器被限制
   在合理范围内运行[^1]。

有关其他安全实施细节，请参阅[panda安全模型](https://github.com/commaai/panda#safety-model)。有关车辆特定的安全概念实施，请参阅[opendbc/safety/safety](https://github.com/commaai/opendbc/tree/master/opendbc/safety/safety)。

**额外说明**：comma.ai强烈反对使用安全代码缺失或
  不完全满足上述要求的openpilot分支。

[^1]: 对于这些执行器限制，我们遵守ISO11270和ISO15622。那里描述的横向限制转换为最多0.9秒的最大执行时间，以达到1米的横向偏差。