# 浙江大学学位论文 LaTeX 模板

[![ZJUTHESIS](https://img.shields.io/badge/zjuthesis-latex-blue.svg)](https://thenetadmin.github.io/zjuthesis)
[![GitHub release](https://img.shields.io/github/release/TheNetAdmin/zjuthesis.svg?label=version&style=popout)](https://github.com/TheNetAdmin/zjuthesis/releases/latest)
[![GitHub All Releases](https://img.shields.io/github/downloads/thenetadmin/zjuthesis/total.svg?color=blue&style=popout)](https://github.com/TheNetAdmin/zjuthesis/releases/latest)
[![Commit Since Latest Release](https://img.shields.io/github/commits-since/TheNetAdmin/zjuthesis/latest.svg)](https://github.com/TheNetAdmin/zjuthesis/commits/master)
![GithubAction](https://github.com/TheNetAdmin/zjuthesis/workflows/Build%20Tests/badge.svg)
[![Gitter](https://badges.gitter.im/zjuthesis/community.svg)](https://gitter.im/zjuthesis/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

## 简介

本项目为浙江大学学位论文的 LaTeX 模板，包含本科生、硕士生与博士生模板，以及英文硕博士模板。

This is a LaTeX template for Zhejiang University graduation thesis/design.
It provides undergraduate and graduate (master and phd) template.
It also provides an English template for graduate students.

[CC98 校内讨论贴](https://www.cc98.org/topic/4762356)

[Gitter 聊天室](https://gitter.im/zjuthesis/community)

## 使用

zjuthesis 模板有两种使用方式，Overleaf 或本地编译：
   - Overleaf 是一个线上 LaTeX 编辑器，可以在不安装任何工具的情况下编写 LaTeX 文档，同时也可以和其他人共享文档，共同编辑。
   - 本地编译比 Overleaf 更快，而且本地编译可以使用 Git 来记录版本 (Overleaf 的版本记录功能需要订阅)。推荐有能力的同学设置本地编译环境，并推荐使用 Visual Studio Code 配合 LaTeX workshop 插件 (vscode 使用方式见[FAQ](./docs/FAQ.md))。

### Overleaf

1. [下载模板代码](https://github.com/TheNetAdmin/zjuthesis/releases) 中的 `zjuthesis-v*.*.*-overleaf.zip` 文件。
1. 在 Overleaf 中上传这个 .zip 压缩文件以创建一个新 Overleaf 项目。
1. 在 Overleaf 界面左上角点击 "Menu"
   - 选择 "Compiler" 为 "XeLaTeX"
   - 选择 "TeX Live version" 为 "2019" 或者更新的版本。
1. 参照 Overleaf 项目中 `fonts/README.md` 的说明下载所需字体，并上传到 `fonts` 文件夹中。
1. 使用 Overleaf 编译。
   - 选择专业模板与毕业学位的方式参见下文 "本地编译"。

### 本地编译

1. 安装 TeXLive 工具包，编译需要 XeTeX 引擎。安装所需的镜像文件可以选用浙江大学开源镜像站提供的[镜像](https://mirrors.zju.edu.cn/CTAN/systems/texlive/Images/)以便在校内网下更快下载。
1. [下载模板代码](https://github.com/TheNetAdmin/zjuthesis/releases)，
   每个专业模板都有预览 pdf 文件，可以单独下载查看。
   模板代码请下载 `zjuthesis-v*.*.*.zip` 文件。
1. 在 `zjuthesis.tex` 中 `\documentclass[]{zjuthesis}` 部分填写个人信息，其中以下信息用于控制文档的生成：

   - `Degree` 为 `undergraduate` 时，编译本科生论文：

   | Field      | Option 1                            | Option 2                              |
   | :--------- | :-----------------------------------| :------------------------------------ |
   |Type        | thesis: 论文类                       | design: 设计类                         |
   |Period      | proposal: 开题报告                   | final: 最终论文/设计                    |
   |BlindReview | true: 生成盲审用 pdf（隐藏个人信息）   | false: 生成提交用 pdf                   |
   |MajorFormat | 默认: general                        | 与 `config/format/major/` 下目录名相同  |

   - `Degree` 为 `graduate` 时，编译硕士生/博士生论文：


   | Field      | Option 1                            | Option 2                              |
   | :--------- | :-----------------------------------| :------------------------------------ |
   | Type       | thesis: 学术论文                     | design: 专业学术论文                    |
   | BlindReview| true: 生成盲审用 pdf（隐藏个人信息）   | false: 生成提交用 pdf                   |
   | MajorFormat| 默认: general                        | 与 `config/format/major/` 下目录名相同  |
   | GradLevel  | master: 硕士                         | doctor: 博士                           |

1. 在 `body` 目录下编写内容
2. 在 `pages` 目录下填写必要的内容，如审核评语等
3. 在 `figure` 目录下保存图片，在 `body/ref.bib` 内插入文献条目
4. 在根目录下运行命令 `latexmk`（或者 `latexmk -xelatex -outdir=out zjuthesis`）即可使用 XeTeX 编译 pdf 文件到 `out` 目录（该目录不会被记录版本）
5. 如需使用 LuaTeX 编译，可运行命令 `latexmk -pdflua -outdir=out`

> 注意：
>
> - 如果你使用 Mac OS 10.15 及以上版本，并且 TexLive 中的 ctex 包版本低于 2.5，会产生[宋体字体判断问题](https://github.com/TheNetAdmin/zjuthesis/issues/79)，导致编译得到的 pdf 中字体出现误差。要解决这个问题，可以将 ctex 包升级到 2.5 以上，或者临时在 ctex 包的选项中加入 `fontset=macnew`，详见 [issue  79](https://github.com/TheNetAdmin/zjuthesis/issues/79)。
> - 本模板已经兼容 TeXLive 2020。TeXLive 2018 以及之前的版本复制伪粗体文字会产生乱码，建议单独使用 TeXLive 的同学尽快升级至 2019 或更新的版本
> - 本模板默认情况下使用 `general` 格式，如需使用其他专业格式，请修改 `zjuthesis.tex` 中 `\documentclass` 部分的 `MajorFormat`
> - 计算机专业的部分页面与学校通用格式不同，如果你是计算机专业的同学，请使用计算机专业的模板

## English Template Usage

The English zjuthesis currently only provides graduate student templates (i.e. master and PhD templates).
If you are undergraduate student and wish to use English zjuthesis, please open an new GitHub issue or chat with me on [Gitter](https://gitter.im/zjuthesis/community).

### Install TexLive and Chinese Fonts, Download zjuthesis

1. Install TexLive toolchain, zjuthesis relies on XeTeX engine provided by TexLive. You may visit [official TexLive website](https://www.tug.org/texlive/) for installation instructions, or visit TexLive mirror provided by [Zhejiang University Open Source Mirror Site](https://mirrors.zju.edu.cn/CTAN/systems/texlive/Images/) for better download speed with ZJU on-campus network.
1. Install several Chinese fonts if you are using English Windows/MacOS:
   1. For Windows: install 仿宋 font (FangSong) and 宋体 font (STSong and SimSun), or you can [install fonts for all languages](https://answers.microsoft.com/en-us/windows/forum/windows_10-start-winpc/some-fonts-are-missing-after-upgrade/95839dfa-0df2-4bc0-875a-fd6b57e61fe4) which includes all the fonts required.
   1. For MacOS: install 仿宋 font (STFangSong) and 宋体 font (Songti SC).
1. Download [zjuthesis template code](https://github.com/TheNetAdmin/zjuthesis/releases). The code is named as `zjuthesis-v*.*.*.zip`. You may also download the PDF files with `-english` in filename for preview.


### Usage

After installing TexLive and downloading zjuthesis code, you can start to write your thesis:

1. Open `zjuthesis.tex` file in template code, set `\documentclass` fields as follows (remember to set `Degree = graduate` and `Language = english`, all settings are case sensitive):

   |Field      |Value           |
   |:----------|:---------------|
   |Degree     |graduate        |
   |Type       |thesis or design|
   |MajorFormat|general         |
   |Language   |english         |
   |GradLevel  |master or doctor|

2. Update the thesis content under `body/graduate` directory, put your figures and graphs under `figure` directory, update special pages (e.g. thesis cover) under `page/graduate-eng` directory, put your biblography in `body/ref.bib`.
3. To compile the zjuthesis template, open a command prompt (Windows) or terminal (MacOS/Linux), navigate the zjuthesis root directory, execute `latexmk` command. `latexmk` can compile the whole zjuthesis template including updating contents and biblography.


## Slides 模板

这是作者用于毕业答辩的一个 Slides 模板，现在转移到 GitHub/Gitee 方便同学们连同 LaTeX 模板一起下载:

   - [GitHub 下载链接](https://github.com/TheNetAdmin/zjuthesis/releases/tag/v2.1.1-slide)
   - [Gitee （国内镜像仓库）下载链接](https://gitee.com/netadmin/zjuthesis/releases/v2.1.1-slide) 国内网络用这个链接下载比较快

## 参考文档

常见问题与解决方案请参考[FAQ](./docs/FAQ.md)，模板使用请参考[使用手册](./docs/usage.md)，模板修改与二次开发请参考[开发手册](./docs/develop.md)。

## 开源许可

本项目代码基于 MIT 协议开源

学校标志与学校文件的版权归浙江大学所有
