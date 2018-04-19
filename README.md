# ZJUTHESIS

![ZJUTHESIS](https://img.shields.io/badge/ZJUTHESIS-Template-blue.svg)

## 简介

本项目为浙江大学本科生毕业设计/论文的LaTeX模板，来源于作者自行编写的计算机学院毕业设计模板。本模板依据2018年`浙江大学本科生毕业论文（设计）编写规则`编写了[通用格式](config/format/general/format.tex)，并根据2018年`浙江大学计算机学院毕业设计开题报告模板`编写了[计算机科学与技术专业专用格式](config/format/major/cs/format.tex)

## 使用

1. 安装TexLive工具包，编译需要XeLatex引擎
2. download/clone本代码仓库
3. 在`content`目录下编写内容
3. 在`figure`目录下保存图片，在`reference/ref.bib`内插入文献条目
5. 在根目录下运行命令`latexmk -xelatex -outdir=out zjutheis`即可编译LaTex到`out`目录（该目录不会被记录版本）

## 扩展

1. 针对每个专业的扩展格式编写请新建目录`config/format/major/专业简称`，在该目录下固定新建文件`format.tex`，引入该目录下所有格式设置文件
2. 扩展格式的`\usepackage{packagename}`尽量放在其所在子目录下的`packages.tex`内，不要放在`config/packages.tex`内，避免其他专业同学使用时产生package冲突或额外引入
3. 最后更改`config/format/format.tex`中的引入规则，引入新扩展的格式目录下的`format.tex`即可

## Q&A

1. 为何不使用`.cls`：我个人认为将所有格式写入同一文件会造成扩展与修改的困难，面对一个.cls中几百行上千行的代码，即使有注释也很难进行正确的修改和扩展。所以我将所有格式以及命令定义都放入`config`文件夹内，并以文件名区分其负责的格式内容。虽然这样带来了大量的文件引入，但相对来讲更易于定位代码和进行扩展
2. 为何只有开题报告模板：编写此模板时，计算机学院只发布了开题报告模板，无法编写后续模板，故[当前模板版本号](config/version.tex)定为`0.*.*`。待后续模板编写完成后会发布`1.*.*`版本
3. 为何只有计算机科学与技术专业模板：由于个人精力有限，难以编写完全，如果其他专业同学有相关需求，可以：
    - 在Github上提出issue，附上模板格式要求
    - 发送邮件到我邮箱（zxwang42 [at] gmail [dot] com），附上模板格式要求与样例文件
    - **在Github上提出Pull Request，贡献你编写的代码**
4. 其他问题请在Github issue提出或使用邮件与我联系

## 开源许可

本项目基于MIT协议开源
