**请务必对照学院下发的Word模板校对格式！！！**

**注意**：在`zjuthesis.tex`中，如果`Period`选为`final`，将会编译出毕业论文**和**开题报告（以part的形式组织），如果仅需要打印毕业论文，可以将`Period`选为`paper`。

**注意**：本模板仅在Ubuntu下编译成功，Windows和MacOS下编译可能会由于新加入的华文行楷字体而出现问题。华文行楷的字体下载地址是https://github.com/chengda/popular-fonts/raw/master/%E5%8D%8E%E6%96%87%E8%A1%8C%E6%A5%B7.ttf，请自行下载安装（Windows和MacOS**可能**自带了华文行楷）。如果你在其他平台下编译失败，请删去[config/format/major/ee/fonts.tex](../ee/fonts.tex)这个文件，并将[page/undergraduate/final/major/ee/job.tex](../../../../page/undergraduate/final/major/ee/job.tex)中第四行的

```latex
  {\bfseries\hwxk\zihao{2} 本科生毕业论文（设计）任务书}
```

改为

```latex
  {\bfseries\zihao{2} 本科生毕业论文（设计）任务书}
```

---
在提交电气工程学院毕业设计（论文）前，请**检查以下条目是否完成**：

- [ ] [page/undergraduate/final/major/ee/eechecklist.tex](../../../../page/undergraduate/final/major/ee/eechecklist.tex)：将`教师职称`和`分数`替换为相应内容
- [ ] [page/undergraduate/final/major/ee/eeopinion.tex](../../../../page/undergraduate/final/major/ee/eeopinion.tex)：将`【这里填职称】`和`【这里填单位】`两处替换为相应内容
- [ ] [page/undergraduate/final/major/ee/eerecord.tex](../../../../page/undergraduate/final/major/ee/eerecord.tex)：同上，将所有用【】包括的项目替换为相应内容。答辩记录的主体目前用空行（`~\\`）填充，如有必要请自行输入答辩记录。
- [ ] [page/undergraduate/final/major/ee/job.tex](../../../../page/undergraduate/final/major/ee/job.tex)：根据学院下发的模板，将这行代码

  ```latex
  \noindent 起讫日期 20 \quad 年 \quad  月 \quad  日 \quad 至 \quad 20 \quad  年 \quad  月  \quad 日
  ```

  替换成相应的起讫日期。
- [ ] [`body/undergraduate/final/abstract.tex`](../../../../body/undergraduate/final/abstract.tex)：学院要求中英文摘要后附加关键词，请使用以下语句

  ```latex
  {\noindent \textbf{关键词：} XXX、XXX、XXX、XXX}
  {\noindent \textbf{Key words:} xxx, xxx, xxx, xxx}
  ```

如果编译后发现表格的排版混乱，这是因为某些栏目的字数过多。可以考虑用`{\zihao{6}内容}`缩小字号以腾出空间，或者自行调整表格列宽。