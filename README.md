# 浙江大学毕业设计/论文模板

![ZJUTHESIS](https://img.shields.io/badge/ZJUTHESIS-Template-blue.svg)

## 简介

本项目为浙江大学本科生毕业设计/论文的LaTeX模板，来源于作者自行编写的计算机学院毕业设计模板。

 - 依据[2018年浙江大学本科生毕业论文（设计）编写规则](http://bksy.zju.edu.cn/attachments/2018-01/01-1517384518-1149149.pdf)编写了[通用格式](config/format/general/format.tex)
 - 根据[2018年浙江大学计算机学院本科生毕业论文（设计）文件和开题报告模板3](http://cspo.zju.edu.cn/cspo_bks/content.php?id=8640)编写了[计算机科学与技术专业专用格式](config/format/major/cs/format.tex)

## 使用

1. [下载模板代码](https://github.com/TheNetAdmin/zjuthesis/releases)
2. 安装TexLive工具包，编译需要XeTeX引擎
3. 在`zjuthesis.tex`中`\documentclass[]{zjuthesis}`部分填写个人信息，注意以下信息用于控制文档的生成：

|Type|Period|BlindReview|MajorFormat|
|:---|:-----|:----------|:----------|
|thesis: 论文类|proposal: 开题报告|true: 生成盲审用pdf（隐藏个人信息）|默认: cs|
|design: 设计类|final: 最终论文/设计|false: 生成提交用pdf|与`config/format/major/`下目录名相同|

4. 在`content`目录下编写内容
5. 在`pages`目录下填写必要的内容，如审核评语等
6. 在`figure`目录下保存图片，在`reference/ref.bib`内插入文献条目
7. 在根目录下运行命令`latexmk -xelatex -outdir=out zjutheis`即可编译LaTex到`out`目录（该目录不会被记录版本）

>注意：本模板默认情况下使用计算机科学与技术专用格式，如需使用其他专业格式，请修改`zjuthesis.tex`中`\documentclass`部分的`\MajorFormat`

## 扩展

1. 针对每个专业的扩展格式编写请新建目录`config/format/major/专业简称`，在该目录下固定新建文件`format.tex`，引入该目录下所有格式设置文件
2. 扩展格式的`\usepackage{packagename}`尽量放在其所在子目录下的`packages.tex`内，不要放在`config/packages.tex`内，避免其他专业同学使用时产生package冲突或额外引入
3. 最后修改`zjuthesis.tex`中`\documentclass`部分的`\MajorFormat`，使用新格式的目录名即可

## Q&A

1. 没有我所在专业的格式：由于个人精力有限，难以查阅并编写各系具体要求的格式，如果同学们有相关需求，可以：
    - 在Github上提出issue，附上模板格式要求
    - 发送邮件到我邮箱（zxwang42 [at] gmail.com），附上模板格式要求与样例文件
    - **在Github上提出Pull Request，贡献你编写的代码**
2. 其他问题请在Github issue提出或使用邮件与我联系

## 开源许可

本项目代码部分基于MIT协议开源

学校标志与学校文件的版权归浙江大学所有
