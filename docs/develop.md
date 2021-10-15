# 开发手册

## 扩展本模板

1. 针对每个专业的扩展格式编写请新建目录 `config/format/major/专业简称` ，在该目录下固定新建文件 `format.tex`，引入该目录下所有格式设置文件
1. 扩展格式的 `\usepackage{packagename}` 尽量放在其所在子目录下的 `packages.tex` 内，不要放在 `config/packages.tex` 内。

   这样可以避免其他专业同学使用时产生 package 冲突或额外引入。
   同时由于 XeTeX 编译速度很慢，减少不必要的 package 可以提高编译效率。

1. 最后修改 `zjuthesis.tex` 中 `\documentclass` 部分的 `MajorFormat` ，使用新格式的目录名即可
1. 现在支持的专业模板如下

   | 模板名称 | 专业             |
   | :------- | :--------------- |
   | general  | 空模板           |
   | cs       | 计算机科学与技术 |
   | isee     | 信息电子         |
   | math     | 数学             |
   | physics  | 物理             |

1. 经过两年的使用，本模板的 `general` 模板可以满足大多数学院的要求。
   目前**计算机学院**的模板使用的封面和评分页与校级模板有所不同，
   使用时请注意切换。
