在提交电气工程学院毕业设计（论文）前，请**务必检查以下条目是否完成**：

- [ ] [page/undergraduate/final/eechecklist.tex](../../../../page/undergraduate/final/eechecklist.tex)：将`教师职称`和`分数`替换为相应内容
- [ ] [page/undergraduate/final/eeopinion.tex](../../../../page/undergraduate/final/eeopinion.tex)：将`【这里填职称】`和`【这里填单位】`两处替换为相应内容
- [ ] [page/undergraduate/final/eerecord.tex](../../../../page/undergraduate/final/eerecord.tex)：同上，将所有用【】包括的项目替换为相应内容。答辩记录的主体目前用空行（`~\\`）填充，如有必要请自行输入答辩记录。
- [ ] [page/undergraduate/final/job.tex](../../../../page/undergraduate/final/job.tex)：根据学院下发的模板，将这行代码
  ```latex
  \noindent 起讫日期 20 \quad 年 \quad  月 \quad  日 \quad 至 \quad 20 \quad  年 \quad  月  \quad 日
  ```
  替换成相应的起讫日期。
- [ ] [`body/undergraduate/final/abstract.tex`](../../../../body/undergraduate/final/abstract.tex)：学院要求中英文摘要后附加关键词，请使用以下语句
  ```latex
  {\noindent \textbf{关键词：} XXX、XXX、XXX、XXX}
  {\noindent \textbf{Key words:} xxx, xxx, xxx, xxx}
  ```

如果编译后发现表格的排版混乱，这是因为某些栏目的字数过多。可以考虑用`{\zihao{6}内容}`缩小字号以腾出空间，或者自己想办法调整表格列宽，如果实在无法解决，可以通过邮件联系我，我的邮箱是zj_hu \[at\] zju.edu.cn。