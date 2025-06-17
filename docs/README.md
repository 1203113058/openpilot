# openpilot docs

This is the source for [docs.comma.ai](https://docs.comma.ai).
The site is updated on pushes to master by this [workflow](../.github/workflows/docs.yaml).

# openpilot文档

这是[docs.comma.ai](https://docs.comma.ai)的源代码。
网站通过这个[工作流](../.github/workflows/docs.yaml)在推送到master分支时更新。

## Development

NOTE: Those commands must be run in the root directory of openpilot, **not /docs**

## 开发

注意：这些命令必须在openpilot的根目录下运行，**而不是在/docs目录下**

**1. Install the docs dependencies**

**1. 安装文档依赖**
``` bash
pip install .[docs]
```

**2. Build the new site**

**2. 构建新站点**
``` bash
mkdocs build
```

**3. Run the new site locally**

**3. 在本地运行新站点**
``` bash
mkdocs serve
```

References:

参考资料：
* https://www.mkdocs.org/getting-started/
* https://github.com/ntno/mkdocs-terminal
