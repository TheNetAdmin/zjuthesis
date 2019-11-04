---
name: Bug report
about: Create a report to help us improve
title: "[BUG]"
labels: bug
assignees: ''

---

**自检一下**
在提出issue之前，我建议你先通过以下步骤自检一下：

  1. 下载安装最新版的 TexLive
  2. 使用 `tlmgr update --self --all` 升级所有宏包
  3. 查阅过去的issue，看是否有类似的问题已经被解决
  
如果以上步骤没有帮助，那么请**删除这段**，并继续提出issue

---

**遇到的问题**
请简要描述你遇到的问题

**重现步骤**
如何重现你遇到的问题：

1. Go to '...'
2. Click on '....'
3. Scroll down to '....'
4. See error

**预期结果**
经过以上步骤，预期得到的结果

**截图**
重现步骤与预期结果的截图
如果方便的话，也请附上其他有帮助的截图

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
