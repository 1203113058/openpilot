# 如何让速度显示变蓝
*openpilot开发入门指南*

在30分钟内，我们将在您的计算机上设置openpilot开发环境，并对openpilot的UI进行一些更改。

如果您有comma 3/3X设备，我们还将把更改部署到您的设备上进行测试。

## 1. 设置开发环境

运行以下命令克隆openpilot并安装所有依赖项：
```bash
bash <(curl -fsSL openpilot.comma.ai)
```

导航到openpilot文件夹并激活Python虚拟环境：
```bash
cd openpilot
source .venv/bin/activate
```

然后，编译openpilot：
```bash
scons -j$(nproc)
```

## 2. 运行回放

我们将使用`replay`工具和演示路线来获取数据流，以测试我们的UI更改。
```bash
# 在终端1中
tools/replay/replay --demo

# 在终端2中
selfdrive/ui/ui
```

openpilot UI应该会启动并显示演示路线的回放。

如果您有自己的comma设备，可以用comma connect中的自己的路线替换`--demo`。

## 3. 让速度显示变蓝

现在让我们更新UI中的速度显示颜色。

搜索负责渲染UI文本的函数：
```bash
git grep "drawText" selfdrive/ui/qt/onroad/hud.cc
```

您会在`selfdrive/ui/qt/onroad/hud.cc`文件中找到相关代码，在这个函数中：

```cpp
void HudRenderer::drawText(QPainter &p, int x, int y, const QString &text, int alpha) {
  QRect real_rect = p.fontMetrics().boundingRect(text);
  real_rect.moveCenter({x, y - real_rect.height() / 2});

  p.setPen(QColor(0xff, 0xff, 0xff, alpha));  // <- 这里设置速度文本颜色
  p.drawText(real_rect.x(), real_rect.bottom(), text);
}
```

更改`QColor(...)`行，使其变为**蓝色**而不是白色。一个不错的柔和蓝色是`#8080FF`，转换为：

```diff
- p.setPen(QColor(0xff, 0xff, 0xff, alpha));
+ p.setPen(QColor(0x80, 0x80, 0xFF, alpha));
```

这个更改将使所有与速度相关的UI文本变为蓝色，同时保持相同的透明度（`alpha`）。

---

## 4. 重新构建UI

更改后，重新构建openpilot，以便编译您的新UI：
```bash
scons -j$(nproc) && selfdrive/ui/ui
```
![](https://blog.comma.ai/img/blue_speed_ui.png)

现在您应该能在演示回放中看到速度以漂亮的蓝色显示。

---

## 5. 将您的分支推送到GitHub

在[Openpilot GitHub仓库](https://github.com/commaai/openpilot)上点击**"Fork"**。然后使用以下命令推送：
```bash
git remote rm origin
git remote add origin git@github.com:<您的GitHub用户名>/openpilot.git
git add .
git commit -m "让速度显示变为蓝色"
git push --set-upstream origin master
```

---

## 6. 在您的comma设备上运行您的分支

通过设备上的设置卸载Openpilot。

然后使用您自己托管在GitHub上的分支重新安装：
```
installer.comma.ai/<您的GitHub用户名>/master
```

---

## 7. 在现实中欣赏您的作品 🚗💨

您现在已经成功修改了Openpilot的UI并将其部署到您自己的汽车上！

![](https://blog.comma.ai/img/c3_blue_ui.jpg)