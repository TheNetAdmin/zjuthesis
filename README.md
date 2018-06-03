# 浙江大学毕业设计/论文模板

![ZJUTHESIS](https://img.shields.io/badge/ZJUTHESIS-Template-blue.svg)

## 简介

本项目为浙江大学本科生毕业设计/论文的LaTeX模板，来源于作者自行编写的计算机学院毕业设计模板。

 - 依据[2018年浙江大学本科生毕业论文（设计）编写规则](http://bksy.zju.edu.cn/attachments/2018-01/01-1517384518-1149149.pdf)编写了[通用格式](config/format/general/format.tex)
 - 根据[2018年浙江大学计算机学院本科生毕业论文（设计）文件和开题报告模板3](http://cspo.zju.edu.cn/cspo_bks/content.php?id=8640)编写了[计算机科学与技术专业专用格式](config/format/major/cs/format.tex)

## 使用

1. [下载模板代码](https://github.com/TheNetAdmin/zjuthesis/releases)
2. 安装TexLive工具包，编译需要XeTeX引擎
3. 在`config/info.tex`中填写个人信息，注意其中部分信息用于控制文档的生成：

|Type|Period|BlindReview|
|:---|:-----|:----------|
|thesis: 论文类|proposal: 开题报告|true: 生成盲审用pdf（隐藏个人信息）|
|design: 设计类|final: 最终论文/设计|false: 生成提交用pdf|

4. 在`content`目录下编写内容
5. 在`pages`目录下填写必要的内容，如审核评语等
6. 在`figure`目录下保存图片，在`reference/ref.bib`内插入文献条目
7. 在根目录下运行命令`latexmk -xelatex -outdir=out zjutheis`即可编译LaTex到`out`目录（该目录不会被记录版本）

>注意：本模板默认情况下使用计算机科学与技术专用格式，如需使用其他专业格式，请修改文件`config/format/format.tex`的引入规则

## 扩展

1. 针对每个专业的扩展格式编写请新建目录`config/format/major/专业简称`，在该目录下固定新建文件`format.tex`，引入该目录下所有格式设置文件
2. 扩展格式的`\usepackage{packagename}`尽量放在其所在子目录下的`packages.tex`内，不要放在`config/packages.tex`内，避免其他专业同学使用时产生package冲突或额外引入
3. 最后更改`config/format/format.tex`中的引入规则，引入新扩展的格式目录下的`format.tex`即可

## Q&A

1. 为何不使用`.cls`：我个人认为将所有格式写入同一文件会造成扩展与修改的困难，面对一个.cls中几百行上千行的代码，即使有注释也很难进行正确的修改和扩展。所以我将所有格式以及命令定义都放入`config`文件夹内，并以文件名区分其负责的格式内容。虽然这样带来了大量的文件引入，但相对来讲更易于定位代码和进行扩展
2. 没有我所在专业的格式：由于个人精力有限，难以查阅并编写各系具体要求的格式，如果同学们有相关需求，可以：
    - 在Github上提出issue，附上模板格式要求
    - 发送邮件到我邮箱（zxwang42 [at] gmail.com），附上模板格式要求与样例文件
    - **在Github上提出Pull Request，贡献你编写的代码**
3. 其他问题请在Github issue提出或使用邮件与我联系

## 开源许可

本项目代码部分基于MIT协议开源
学校标志与学校文件的版权归浙江大学所有
