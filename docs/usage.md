# 使用手册

## 使用

1. 安装 TeXLive 工具包，编译需要 XeTeX 引擎。安装过程可以参考[浙江大学镜像站提供的文档](https://mirrors.zju.edu.cn/docs/CTAN)，以便在校内网下更快下载。
1. [下载模板代码](https://github.com/TheNetAdmin/zjuthesis/releases)，
   每个专业模板都有预览 pdf 文件，可以单独下载查看。
   模板代码请下载 `zjuthesis-vx.x.x.zip` 文件。
1. 在 `zjuthesis.tex` 中 `\documentclass[]{zjuthesis}` 部分填写个人信息，注意以下信息用于控制文档的生成：

   - `Degree` 为 `undergraduate` 时，编译本科生论文：

   | Type           | Period               | BlindReview                          | MajorFormat                            |
   | :------------- | :------------------- | :----------------------------------- | :------------------------------------- |
   | thesis: 论文类 | proposal: 开题报告   | true: 生成盲审用 pdf（隐藏个人信息） | 默认: general                          |
   | design: 设计类 | final: 最终论文/设计 | false: 生成提交用 pdf                | 与 `config/format/major/` 下目录名相同 |

   - `Degree` 为 `graduate` 时，编译硕士生/博士生论文：

   | Type                 | BlindReview                          | MajorFormat                            | GradLevel    |
   | :------------------- | :----------------------------------- | :------------------------------------- | :----------- |
   | thesis: 学术论文     | true: 生成盲审用 pdf（隐藏个人信息） | 默认: general                          | master: 硕士 |
   | design: 专业学术论文 | false: 生成提交用 pdf                | 与 `config/format/major/` 下目录名相同 | doctor: 博士 |

1. 在 `body` 目录下编写内容
1. 在 `pages` 目录下填写必要的内容，如审核评语等
1. 在 `figure` 目录下保存图片，在 `body/ref.bib` 内插入文献条目
1. 在根目录下运行命令 `latexmk`（或者 `latexmk -xelatex -outdir=out zjuthesis`）即可编译 pdf 文件到 `out` 目录（该目录不会被记录版本）

> 注意：
>
> - 本模板已经兼容 TeXLive 2019，并且这个版本复制伪粗体文字不会产生乱码，建议单独使用 TeXLive 的同学尽快升级 2019 版本
> - 本模板默认情况下使用 `general` 格式，如需使用其他专业格式，请修改 `zjuthesis.tex` 中 `\documentclass` 部分的 `MajorFormat`
> - 计算机专业的部分页面与学校通用格式不同，如果你是计算机专业的同学，请使用计算机专业的模板

## English Template Usage

See [English template user manual](./english.md)


## Slides 模板

1. 这是之前分享在浙大云盘的一个 Slide 模板，现在转移到 GitHub 方便同学们连同 LaTeX 模板一起下载:

   - [GitHub 下载链接](https://github.com/TheNetAdmin/zjuthesis/releases/tag/v2.1.1-slide)
   - [Gitee （国内镜像仓库）下载链接](https://gitee.com/netadmin/zjuthesis/releases/v2.1.1-slide)（国内网络用这个链接下载比较快）

## 高级使用教程

如果你熟悉 git 的用法，希望用 git 来管理自己的论文，并且保持最新的样式，可以采用如下方法：

1. fork 本 repo，必要的话可以设置为 private
   > 如果你不想使用 GitHub，可以直接 git clone 本 repo 并同步到其他的 git repo 中。
   > 但一定要保持原有的 commit，并且设置好指向原始 repo 的 remote url，这样才能进行后续的样式更新。
1. 新开 branch，在这个 branch 上编写论文内容
1. 需要与最新样式同步时：
   1. 先 commit 论文分支
   1. 切换到 master 分支，从原始 repo 执行 git pull
   1. 然后切换到论文分支，将其 rebase 到 master 分支最新的 commit，并逐步修复 conflict
   1. git push 到你的 repo 中
1. 然后在论文分支继续编写内容

这样你的论文内容总是与样式分离，可以分别更新
