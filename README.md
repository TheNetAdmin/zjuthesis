# 浙江大学毕业设计/论文 LaTeX 模板

[![ZJUTHESIS](https://img.shields.io/badge/zjuthesis-latex-blue.svg)](https://thenetadmin.github.io/zjuthesis)
[![GitHub release](https://img.shields.io/github/release/TheNetAdmin/zjuthesis.svg?label=version&style=popout)](https://github.com/TheNetAdmin/zjuthesis/releases/latest)
[![GitHub All Releases](https://img.shields.io/github/downloads/thenetadmin/zjuthesis/total.svg?color=blue&style=popout)](https://github.com/TheNetAdmin/zjuthesis/releases/latest)
[![Commit Since Latest Release](https://img.shields.io/github/commits-since/TheNetAdmin/zjuthesis/latest.svg)](https://github.com/TheNetAdmin/zjuthesis/commits/master)
![GithubAction](https://github.com/TheNetAdmin/zjuthesis/workflows/Build%20Tests/badge.svg)
[![Gitter](https://badges.gitter.im/zjuthesis/community.svg)](https://gitter.im/zjuthesis/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

## 简介

本项目为浙江大学毕业设计/论文的 LaTeX 模板，包含本科生、硕士生与博士生模板，以及英文硕博士模板。

This is a LaTeX template for Zhejiang University graduation thesis/design.
It provides undergraduate and graduate (master and phd) template.
It also provides an English template for graduate students.

[CC98 校内讨论贴](https://www.cc98.org/topic/4762356)

## 使用

1. [下载模板代码](https://github.com/TheNetAdmin/zjuthesis/releases)，
   每个专业模板都有预览 pdf 文件，可以单独下载查看。
   模板代码请下载 `zjuthesis-vx.x.x.zip` 文件。
1. 安装 TeXLive 工具包，编译需要 XeTeX 引擎。安装所需的镜像文件可以选用浙江大学开源镜像站提供的[镜像](https://mirrors.zju.edu.cn/CTAN/systems/texlive/Images/)以便在校内网下更快下载。
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

Set `\documentclass` fields:

|Field|Value|
|:----|:----|
|Degree|graduate|
|Type|thesis or design|
|MajorFormat|general|
|Language|english|
|GradLevel|master or doctor|

This template only comes with English graduate student template,
if you are interested in English undergraduate template,
please open a new issue and discuss the details and requirements.


## Slides 模板

这是作者用于毕业答辩的一个 Slide 模板，现在转移到 GitHub/Gitee 方便同学们连同 LaTeX 模板一起下载:

   - [GitHub 下载链接](https://github.com/TheNetAdmin/zjuthesis/releases/tag/v2.1.1-slide)
   - [Gitee （国内镜像仓库）下载链接](https://gitee.com/netadmin/zjuthesis/releases/v2.1.1-slide)（国内网络用这个链接下载比较快）

## 参考文档

常见问题与解决方案请参考[FAQ](./docs/FAQ.md)，模板使用请参考[使用手册](./docs/usage.md)，模板修改与二次开发请参考[开发手册](./docs/develop.md)。

## 开源许可

本项目代码部分基于 MIT 协议开源

学校标志与学校文件的版权归浙江大学所有
