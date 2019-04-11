# 浙江大学毕业设计/论文模板

![ZJUTHESIS](https://img.shields.io/badge/ZJUTHESIS-Template-blue.svg)

## 简介

本项目为浙江大学本科生毕业设计/论文的 LaTeX 模板，来源于作者自行编写的计算机学院毕业设计模板：

- [通用格式](config/format/general/format.tex)：[2018年浙江大学本科生毕业论文（设计）编写规则](http://bksy.zju.edu.cn/attachments/2018-01/01-1517384518-1149149.pdf)
- [计算机科学与技术专业格式](config/format/major/cs/format.tex)：[2018年浙江大学计算机学院本科生毕业论文（设计）文件和开题报告模板3](http://cspo.zju.edu.cn/cspo_bks/content.php?id=8640)

## 使用

> 注意：
> - TeX Live 套件会在每年的 4 月左右进行版本升级，但有时候新版本会有一些和旧版不兼容的问题。我在 2019 新版发布后会尽快测试兼容性，但还是推荐各位同学使用 2018 版本以确保兼容性
> - 本模板默认情况下使用计算机科学与技术专用格式，如需使用其他专业格式，请修改 `zjuthesis.tex` 中 `\documentclass` 部分的 `MajorFormat`

1. [下载模板代码](https://github.com/TheNetAdmin/zjuthesis/releases)
2. 安装 TeXLive 工具包，编译需要 XeTeX 引擎。安装所需的镜像文件可以选用浙江大学开源镜像站提供的[镜像](https://mirrors.zju.edu.cn/CTAN/systems/texlive/Images/)以便在校内网下更快下载。
3. 在 `zjuthesis.tex` 中 `\documentclass[]{zjuthesis}` 部分填写个人信息，注意以下信息用于控制文档的生成：

    | Type           | Period               | BlindReview                         | MajorFormat                          |
    | :------------- | :------------------- | :---------------------------------- | :----------------------------------- |
    | thesis: 论文类 | proposal: 开题报告   | true: 生成盲审用pdf（隐藏个人信息） | 默认: cs                             |
    | design: 设计类 | final: 最终论文/设计 | false: 生成提交用pdf                | 与 `config/format/major/` 下目录名相同 |

4. 在 `content` 目录下编写内容
5. 在 `pages` 目录下填写必要的内容，如审核评语等
6. 在 `figure` 目录下保存图片，在 `reference/ref.bib` 内插入文献条目
7. 在根目录下运行命令 `latexmk -xelatex -outdir=out zjuthesis` 即可编译 TeX 文件到 `out` 目录（该目录不会被记录版本）

## 扩展

1. 针对每个专业的扩展格式编写请新建目录 `config/format/major/专业简称` ，在该目录下固定新建文件 `format.tex`，引入该目录下所有格式设置文件
2. 扩展格式的 `\usepackage{packagename}` 尽量放在其所在子目录下的 `packages.tex` 内，不要放在 `config/packages.tex` 内，避免其他专业同学使用时产生 package 冲突或额外引入
3. 最后修改 `zjuthesis.tex` 中 `\documentclass` 部分的 `MajorFormat` ，使用新格式的目录名即可

## Slide 模板

1. 这是之前分享在浙大云盘的一个 Slide 模板，现在转移到 GitHub 方便同学们连同 LaTeX 模板一起下载:
   https://github.com/TheNetAdmin/zjuthesis/releases/tag/v2.1.1-slide

## Q & A

1. Q: 没有我所在专业的格式？

   A: 由于个人精力有限，难以查阅并编写各系具体要求的格式，如果同学们有相关需求，可以：
    - 在 Github 上提出 issue，附上模板格式要求
    - 发送邮件到我邮箱 (zxwang42 [at] gmail.com)，附上模板格式要求与样例文件
    - **在 Github 上提出 Pull Request，贡献你编写的代码**
1. Q: latexmk 编译不通过？

   A: 可以先尝试执行 `tlmgr update --self --all` 更新整个 TexLive，然后重新编译。因为直接安装的 TexLive 并不包含所有最新版本的宏包，一些旧版宏包的 BUG 可能会影响编译。

1. Q: pdf 文字复制得到乱码？

   A: 这是因为 Windows 自带的宋体没有粗体，所以在本模板中使用了伪粗体（config/zjuthesis.cls:`\PassOptionsToPackage{AutoFakeBold}{xeCJK}`），这样可以保证观感一致性。
   
   如果大家有对查重的要求，请删除这一行，并手动指定粗体字体，比如使用楷体作为本模板的‘粗体’，这也是一种常见的解决方案。
   
   要想彻底解决这个问题，只能换用有真正粗体版本的字体，目前为止我并没有找到仿宋对应的粗体版本。
   当然 Office 对字体伪粗体问题有更好的解决方式，毕竟人家是收钱的嘛……
   
   相关讨论见：https://github.com/CTeX-org/ctex-kit/issues/353

1. Q: 某些 pdf 阅读器(如 Chrome )打开看不到中文，或者中文乱码

   A: 可能是 LaTeX 没有正确嵌入字体，最简单的解决方案是用没有乱码的 pdf 阅读器打开->打印->打印成 pdf ，然后尝试用有问题的阅读器打开，看是否仍有问题。
   
   如果需要了解具体发生了什么，请查阅 zjuthesis.log ，在文件内搜索 warning 和 error ，看一下是否有字体相关的报错。

1. Q: 怎么在 Overleaf 上使用？

   A: 下载本模板并在 Overleaf 上上传 .zip 文件，选择使用 XeLatex 编译器。
      
      由于字体存在版权问题，还请大家自行设置字体。
       
      如果编译超时（不显示 pdf 也不报错），请尝试注释中文字体设置（位于 `config/format/general/font.tex` 以及 `config/foramt/major/.../font.tex`），然后重新编译，应该就可以了。编译超时可能是缺失字体导致的，请大家自行上传字体并设置字体路径。
   
1. 其他问题请在 [Github issue](./issues/) 提出，或使用邮件与我联系（邮箱见上方Q1）。

## 开源许可

本项目代码部分基于MIT协议开源

学校标志与学校文件的版权归浙江大学所有
