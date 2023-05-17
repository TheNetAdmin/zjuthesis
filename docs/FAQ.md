# FAQ


## 常见问题

1. Q: 没有我所在专业的格式？

   A: 由于个人精力有限，难以查阅并编写各系具体要求的格式，如果同学们有相关需求，可以：

   - **在 GitHub 上提出 Pull Request，贡献你编写的代码**
   - 在 GitHub 上提出 issue，附上模板格式要求

1. Q: 如何配合查重？

   A: 详情见[issue 讨论](https://github.com/TheNetAdmin/zjuthesis/issues/14)

   目前查重工具对 LaTeX 生成的 pdf 支持比较差，主要有两点：

   1. XeTeX 伪粗体会导致复制时得到乱码；
   2. LaTeX 生成的 pdf 默认采用了 UTF-8 的编码，而查重工具对这种编码支持不好，可能会认为是 GBK 之类的编码，无法读取正确的中文字符；

   第一点可以通过升级到 TeXLive 2019 解决。

   第二点暂时没有特别好的解决方法。
   如果有同学有相关经验的话，可以 issue 留言或者邮件告知我，我会更新 README。

1. Q: pdf 文字复制得到乱码？

   A: 最新的解决方法是升级 TeXLive 2019 版本，此版本似乎不会产生中文复制乱码的问题

   > 如果你在用 TeXLive 2018 及以前的版本：
   >
   > 这是因为 Windows 自带的仿宋没有粗体，所以本模板使用了伪粗体：
   > `config/zjuthesis.cls` => `\PassOptionsToPackage{AutoFakeBold}{xeCJK}`
   >
   > 如果大家有对查重的要求，可以删除这一行，并手动指定粗体字体，比如使用楷体作为本模板的‘粗体’，这也是一种常见的解决方案。
   >
   > 要想彻底解决这个问题，只能换用有真正粗体版本的字体，目前为止我并没有找到仿宋对应的粗体版本。
   > Office 对字体伪粗体问题有更好的解决方式，毕竟人家是收钱的嘛……
   >
   > 相关讨论见：[CTeX GitHub Issue](https://github.com/CTeX-org/ctex-kit/issues/353)

1. Q: 某些 pdf 阅读器(如 Chrome )打开看不到中文，或者中文乱码

   A: 可能是 LaTeX 没有正确嵌入字体，最简单的解决方案是用没有乱码的 pdf 阅读器打开->打印->打印成 pdf ，然后尝试用有问题的阅读器打开，看是否仍有问题。

   如果需要了解具体发生了什么，请查阅 zjuthesis.log ，在文件内搜索 warning 和 error ，看一下是否有字体相关的报错。

## 编译

1. Q: latexmk 编译不通过？

   A: 可以先尝试执行 `tlmgr update --self --all` 更新整个 TeXLive，然后重新编译。因为直接安装的 TeXLive 并不包含所有最新版本的宏包，一些旧版宏包的 BUG 可能会影响编译。

## 格式

### 封面

1. Q: 封面的标题太长，无法居中/无法换行/垂直间距有问题 [#52](https://github.com/TheNetAdmin/zjuthesis/issues/52) [#161](https://github.com/TheNetAdmin/zjuthesis/issues/161)

   A: 封面的标题都位于表格环境，无法在换行的同时保证表格对齐。
   解决方法是手动换行：在标题页的 TeX 文件内，在标题表格内手动加几行，在每一行输入相应标题的一部分。

### 参考文献与引用

1. Q: 参考文献编译有问题？

   A: 如果你的参考文献没有出现在 pdf 中，请尝试使用 `latexmk` 命令编译，或者使用 `biber` 命令编译参考文献。
   LaTeX 的参考文献需要额外编译一次，单独的 `xelatex` 并不会编译参考文献。
   不过 `latexmk` 会追踪参考文献内容变化，并自动编译参考文献，所以建议大家使用 `latexmk` 来编译文档。
   
1. Q: 非上标引用？

   A: 使用 `\parencite{}` 而非 `\cite{}`，参考 [GitHub Issue](https://github.com/TheNetAdmin/zjuthesis/issues/34) 讨论。
   
1. Q: 参考文献作者姓名为何是全大写的？

   A: 这是 `gb7714-2015` 标准规定的，参考 [GitHub Issue](https://github.com/TheNetAdmin/zjuthesis/issues/23) 讨论。
   
   如果需要“非全大写”姓名格式，请在引用 `biblatex` 包时指定 `gbnamefmt=lowercase`，详见 [GitHub Issue](https://github.com/TheNetAdmin/zjuthesis/issues/23#issuecomment-602129192) 讨论。

1. Q: 怎样在文中引用文献作者?

   A: 使用 `\citeauthor{tikz}~\cite{tikz}` 即可。

   如果需要对英文文献使用 `et al.` 的省略词，可以注释 `config/package.tex` 的 `biblatex` 包的 `gbcitelocal=chinese,` 一行。详见 [GitHub Pull Requests](https://github.com/TheNetAdmin/zjuthesis/pull/324)。

### 页眉与页脚

1. Q: 如何定制页眉页脚（包括页码）？

   A: 页眉页脚的设定主要位于 `config/format/***/layout.tex` 下，请参考 `fancyhdr` 宏包文档修改如下设定
      - `\fancypagestyle{common}`：正文页眉页脚设定
      - `\fancypagestyle{previous}`：前置页面页眉页脚设定
      - 同时如有必要请修改 `\prevstyle`，`\bodystyle` 和 `\poststyle` 命令的设定

## 工具使用

1. Q: 怎么在 Overleaf 上使用？

   A: 下载本模板并在 Overleaf 上上传 .zip 文件，选择使用 XeLatex 编译器。

   上传后请删除 `.latexmkrc` 文件，否则编译会失败而且不报任何错误。

   由于字体存在版权问题，还请大家自行上传字体，并修改中文字体设置（位于 `config/format/general/font.tex` 以及 `config/foramt/major/.../font.tex`）。修改过程可参考本仓库中的 `script/ci/setup.sh` 脚本。

   如果编译超时（不显示 pdf 也不报错），请尝试注释中文字体设置（代码位置见上一段），然后重新编译。编译超时可能是缺失字体导致的，请大家自行上传字体并设置字体路径。

   我会不定期更新一下 [Overleaf 模板](https://www.overleaf.com/latex/templates/zhe-jiang-da-xue-bi-ye-she-ji-slash-lun-wen-mo-ban-zjuthesis/kzcgmdyvkjxj)，但想用最新模板的同学请自行上传并设置。

   **注意：Overleaf 默认使用 TeXLive 2017，但前文提到的乱码问题在 2019 版才得以解决，所以请同学们务必切换到 Overleaf 的 TeXLive 2019 版本 进行最终提交版的编译（Menu -> TeX Live version -> 2019）。**

1. Q: 怎么配合 vscode 使用？

   A: 用 vscode 打开根目录下的 zjuthesis.tex 文件，Ctrl+Shift+P 打开命令窗口，`LaTeX Workshop: Build with recipe` => `latexmk (latexmkrc)`

## 其他

1. 其他问题请在 [GitHub issue](https://github.com/TheNetAdmin/zjuthesis/issues/) 提出。

   请各位同学遇到问题尽量在 GitHub issue 里提出，这样方便有同样问题的同学查询。
