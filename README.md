# 浙江大学毕业设计/论文 LaTeX 模板

![ZJUTHESIS](https://img.shields.io/badge/zjuthesis-latex-blue.svg)
![GitHub release](https://img.shields.io/github/release/TheNetAdmin/zjuthesis.svg?label=version&style=popout)
![GitHub All Releases](https://img.shields.io/github/downloads/thenetadmin/zjuthesis/total.svg?color=blue&style=popout)
![TravisCI](https://travis-ci.org/TheNetAdmin/zjuthesis.svg?branch=master)

## 简介

本项目为浙江大学毕业设计/论文的 LaTeX 模板，包含本科生、硕士生与博士生模板，以及英文硕博士模板。

This is a LaTeX template for Zhejiang University graduation thesis/design.
It comes with undergraduate and graduate (master and phd) template.
It also comes with an English template for graduate students.

[CC98校内讨论贴](http://cc98.org/topic/4762356)

## 使用

1. [下载模板代码](https://github.com/TheNetAdmin/zjuthesis/releases)，
   每个专业模板都有预览 pdf 文件，可以单独下载查看。
   模板代码请下载 `zjuthesis-vx.x.x.zip` 文件。
1. 安装 TeXLive 工具包，编译需要 XeTeX 引擎。安装所需的镜像文件可以选用浙江大学开源镜像站提供的[镜像](https://mirrors.zju.edu.cn/CTAN/systems/texlive/Images/)以便在校内网下更快下载。
1. 在 `zjuthesis.tex` 中 `\documentclass[]{zjuthesis}` 部分填写个人信息，注意以下信息用于控制文档的生成：

   - `Degree` 为 `undergraduate` 时，编译本科生论文：

    | Type           | Period               | BlindReview                         | MajorFormat                          |
    | :------------- | :------------------- | :---------------------------------- | :----------------------------------- |
    | thesis: 论文类  | proposal: 开题报告   | true: 生成盲审用pdf（隐藏个人信息）    | 默认: general                        |
    | design: 设计类  | final: 最终论文/设计 | false: 生成提交用pdf                  | 与 `config/format/major/` 下目录名相同 |
   
   - `Degree` 为 `graduate` 时，编译硕士生/博士生论文：

    | Type               | BlindReview                         | MajorFormat                           | GradLevel |
    | :-------------     | :---------------------------------- | :------------------------------------ | :-------- |
    | thesis: 学术论文    |true: 生成盲审用pdf（隐藏个人信息）    | 默认: general                         | master: 硕士|
    | design: 专业学术论文| false: 生成提交用pdf                 | 与 `config/format/major/` 下目录名相同 | doctor: 博士|
    | equal: 同等学力论文 | | |

1. 在 `body` 目录下编写内容
1. 在 `pages` 目录下填写必要的内容，如审核评语等
1. 在 `figure` 目录下保存图片，在 `body/ref.bib` 内插入文献条目
1. 在根目录下运行命令 `latexmk`（或者 `latexmk -xelatex -outdir=out zjuthesis`）即可编译 pdf 文件到 `out` 目录（该目录不会被记录版本）

> 注意：
>
> - 本模板已经兼容 TeXLive 2019，并且这个版本复制伪粗体文字不会产生乱码，建议单独使用 TeXLive 的同学尽快升级 2019 版本
> - 本模板默认情况下使用 `general` 格式，如需使用其他专业格式，请修改 `zjuthesis.tex` 中 `\documentclass` 部分的 `MajorFormat`
> - 计算机专业的部分页面与学校通用格式不同，如果你是计算机专业的同学，请使用计算机专业的模板

## For English graduate template user

Set `\documentclass` fields:
  - Degree = graduate
  - Type = thesis/design
  - MajorFormat = general
  - Language = english
  - GradLevel = master/doctor

This template only comes with English graduate student template,
if you are interested in English undergraduate template,
please open a new issue and discuss the details and requirements.

## 扩展

1. 针对每个专业的扩展格式编写请新建目录 `config/format/major/专业简称` ，在该目录下固定新建文件 `format.tex`，引入该目录下所有格式设置文件
1. 扩展格式的 `\usepackage{packagename}` 尽量放在其所在子目录下的 `packages.tex` 内，不要放在 `config/packages.tex` 内。
   
   这样可以避免其他专业同学使用时产生 package 冲突或额外引入。
   同时由于 XeTeX 编译速度很慢，减少不必要的 package 可以提高编译效率。样例模板使用了 Tikz package，如果大家写论文时不需要这个包，可以将其删除。
1. 最后修改 `zjuthesis.tex` 中 `\documentclass` 部分的 `MajorFormat` ，使用新格式的目录名即可
1. 现在支持的专业模板如下

   | 模板名称 | 专业           |
   | :------ | :------------ |
   | general | 空模板         |
   | cs      | 计算机科学与技术 |
   | isee    | 信息电子        |
   | math    | 数学           |
   | physics | 物理           |

1. 经过两年的使用，本模板的 `general` 模板可以满足大多数学院的要求。
   目前只有**计算机学院**的模板使用的封面和评分页与校级模板有所不同，
   使用时请注意切换；
   其他的专业模板只是提供了方便各专业使用的宏，没有额外的版面设置。

## Slide 模板

1. 这是之前分享在浙大云盘的一个 Slide 模板，现在转移到 GitHub 方便同学们连同 LaTeX 模板一起下载:

   - [GitHub 下载链接](https://github.com/TheNetAdmin/zjuthesis/releases/tag/v2.1.1-slide)
   - [Gitee （国内镜像仓库）下载链接](https://gitee.com/netadmin/zjuthesis/releases/v2.1.1-slide)（国内网络用这个链接下载比较快）

## 高级使用教程

如果你熟悉 git 的用法，希望用 git 来管理自己的论文，并且保持最新的样式，可以采用如下方法：

1. fork 本 repo，必要的话可以设置为 private
    >如果你不想使用 GitHub，可以直接 git clone 本 repo 并同步到其他的 git repo 中。
    >但一定要保持原有的 commit，并且设置好指向原始 repo 的 remote url，这样才能进行后续的样式更新。
1. 新开 branch，在这个 branch 上编写论文内容
1. 需要与最新样式同步时：
    1. 先 commit 论文分支
    1. 切换到 master 分支，从原始 repo 执行 git pull
    1. 然后切换到论文分支，将其 rebase 到 master 分支最新的 commit，并逐步修复 conflict
    1. git push 到你的 repo 中
1. 然后在论文分支继续编写内容

这样你的论文内容总是与样式分离，可以分别更新

## Q & A

1. Q: 没有我所在专业的格式？

   A: 由于个人精力有限，难以查阅并编写各系具体要求的格式，如果同学们有相关需求，可以：
    - **在 GitHub 上提出 Pull Request，贡献你编写的代码**
    - 在 GitHub 上提出 issue，附上模板格式要求

1. Q: latexmk 编译不通过？

   A: 可以先尝试执行 `tlmgr update --self --all` 更新整个 TeXLive，然后重新编译。因为直接安装的 TeXLive 并不包含所有最新版本的宏包，一些旧版宏包的 BUG 可能会影响编译。

2. Q: 参考文献编译有问题？

   A: 如果你的参考文献没有出现在 pdf 中，请尝试使用 `latexmk` 命令编译，或者使用 `biber` 命令编译参考文献。
   LaTeX 的参考文献需要额外编译一次，单独的 `xelatex` 并不会编译参考文献。
   不过 `latexmk` 会追踪参考文献内容变化，并自动编译参考文献，所以建议大家使用 `latexmk` 来编译文档。

1. Q: 如何配合查重？

   A: 详情见[issue讨论](https://github.com/TheNetAdmin/zjuthesis/issues/14)

      目前查重工具对 LaTeX 生成的 pdf 支持比较差，主要有两点：

      1) XeTeX 伪粗体会导致复制时得到乱码；
      2) LaTeX 生成的 pdf 默认采用了 UTF-8 的编码，而查重工具对这种编码支持不好，可能会认为是 GBK 之类的编码，无法读取正确的中文字符；

      第一点可以通过升级到 TeXLive 2019 解决。

      第二点暂时没有特别好的解决方法。
      如果有同学有相关经验的话，可以 issue 留言或者邮件告知我，我会更新 README。

1. Q: pdf 文字复制得到乱码？

   A: 最新的解决方法是升级 TeXLive 2019 版本，此版本似乎不会产生中文复制乱码的问题

   > 如果你在用 TeXLive 2018 及以前的版本：
   >
   > 这是因为 Windows 自带的仿宋没有粗体，所以本模板使用了伪粗体：
   >`config/zjuthesis.cls` => `\PassOptionsToPackage{AutoFakeBold}{xeCJK}`
   >
   > 如果大家有对查重的要求，可以删除这一行，并手动指定粗体字体，比如使用楷体作为本模板的‘粗体’，这也是一种常见的解决方案。
   >
   > 要想彻底解决这个问题，只能换用有真正粗体版本的字体，目前为止我并没有找到仿宋对应的粗体版本。
   > Office 对字体伪粗体问题有更好的解决方式，毕竟人家是收钱的嘛……
   >
   > 相关讨论见：[CTeX GitHub Issue](https://github.com/CTeX-org/ctex-kit/issues/353)

1. Q: 某些 pdf 阅读器(如 Chrome )打开看不到中文，或者中文乱码

   A: 可能是 LaTeX 没有正确嵌入字体，最简单的解决方案是用没有乱码的 pdf 阅读器打开->打印->打印成 pdf ，然后尝试用有问题的阅读器打开，看是否仍有问题。

   如果需要了解具体发生了什么，请查阅 zjuthesis.log ，在文件内搜索 warning 和 error ，看一下是否有字体相关的报错。

1. Q: 怎么在 Overleaf 上使用？

   A: 下载本模板并在 Overleaf 上上传 .zip 文件，选择使用 XeLatex 编译器。
   
      上传后请删除 `.latexmkrc` 文件，否则编译会失败而且不报任何错误。

      由于字体存在版权问题，还请大家自行上传字体，并修改中文字体设置（位于 `config/format/general/font.tex` 以及 `config/foramt/major/.../font.tex`）。修改过程可参考本仓库中的 `script/ci/setup.sh` 脚本。

      如果编译超时（不显示 pdf 也不报错），请尝试注释中文字体设置（代码位置见上一段），然后重新编译。编译超时可能是缺失字体导致的，请大家自行上传字体并设置字体路径。
      
      我会不定期更新一下 [Overleaf 模板](https://www.overleaf.com/latex/templates/zhe-jiang-da-xue-bi-ye-she-ji-slash-lun-wen-mo-ban-zjuthesis/kzcgmdyvkjxj)，但想用最新模板的同学请自行上传并设置。
      
      **注意：Overleaf 还在使用 TeXLive 2017，但前文提到的乱码问题在 2019 版才得以解决，所以请同学们务必使用 TeXLive 2019 进行最终提交版的编译。**

1. Q: 怎么配合 vscode 使用？

   A: 有两种方式
     1. 用 vscode 打开根目录下的 zjuthesis.tex 文件，Ctrl+Shift+P 打开命令窗口，`LaTeX Workshop: Build with recipe` => `latexmk (latexmkrc)`
     2. 参见[这里](https://github.com/TheNetAdmin/zjuthesis/issues/11)


1. 其他问题请在 [GitHub issue](https://github.com/TheNetAdmin/zjuthesis/issues/) 提出。

   请各位同学遇到问题尽量在 GitHub issue 里提出，这样方便有同样问题的同学查询。

## 开源许可

本项目代码部分基于MIT协议开源

学校标志与学校文件的版权归浙江大学所有
