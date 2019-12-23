---
name: I need help
about: Having some trouble using the template
title: ''
labels: help wanted
assignees: ''

---

请务必按照这个模板报告问题，否则我很难帮助你找到问题。

**遇到的问题**
请简要描述你遇到的问题

**重现步骤**
如何重现你遇到的问题：

1. 修改了哪里
2. 使用什么命令编译
3. 产生了什么错误/输出结果哪里不对
4.

请附上修改过的文件/工程

如果无法编译，请额外附上 log 文件，位于 out/zjuthesis.log

**截图**

- 重现步骤的截图
- 输出结果的截图
- 如果方便的话，也请附上其他有帮助的截图

**环境**
 - zjuthesis版本: [e.g. v3.0.0 或 3c8a471(commit id)]
- zjuthesis基础设置 **请将如下代码替换为你的`\documentclass`代码，注意隐藏个人信息**
```
\documentclass[
    StudentName = 姓名,
    StudentID   = 学号,
    AdvisorName = 指导教师,
    Grade       = 2014,
    Major       = 专业,
    Department  = 学院,
    Title       = 毕业论文/设计题目,
    SubmitDate  = 递交日期,
    MajorFormat = general,
    Degree      = undergraduate,
    Type        = thesis,
    Period      = final,
    BlindReview = false,
    Topic           = 研究方向,
    ColaboratorName = 合作导师
]{config/zjuthesis}
```
 - OS: [e.g. Linux/Windows/MacOS]
 - Tex套件: [e.g. Texlive/Miktex]
 - Tex套件版本: [e.g. 2019]
 - XeLaTex版本: (请附上`xelatex --version`命令的所有输出)
``` shell
XeTeX 3.14159265-2.6-0.999991 (TeX Live 2019)
kpathsea version 6.3.1
Copyright 2019 SIL International, Jonathan Kew and Khaled Hosny.
```

**其他信息**
其他你认为有帮助的信息
