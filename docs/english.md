# English Template Usage

The English zjuthesis currently only provides graduate student templates (i.e. master and PhD templates).
If you are undergraduate student and wish to use English zjuthesis, please open an new GitHub issue or chat with me on [Gitter](https://gitter.im/zjuthesis/community).

## Install TexLive and Chinese Fonts, Download zjuthesis

1. Install TexLive toolchain, zjuthesis relies on XeTeX engine provided by TexLive. You may visit [official TexLive website](https://www.tug.org/texlive/) for installation instructions, or visit TexLive mirror provided by [Zhejiang University Open Source Mirror Site](https://mirrors.zju.edu.cn/CTAN/systems/texlive/Images/) for better download speed with ZJU on-campus network.
1. Install several Chinese fonts if you are using English Windows/MacOS:
   1. For Windows: install 仿宋 font (FangSong) and 宋体 font (STSong and SimSun), or you can [install fonts for all languages](https://answers.microsoft.com/en-us/windows/forum/windows_10-start-winpc/some-fonts-are-missing-after-upgrade/95839dfa-0df2-4bc0-875a-fd6b57e61fe4) which includes all the fonts required.
   1. For MacOS: install 仿宋 font (STFangSong) and 宋体 font (Songti SC).
1. Download [zjuthesis template code](https://github.com/TheNetAdmin/zjuthesis/releases). The code is named as `zjuthesis-v*.*.*.zip`. You may also download the PDF files with `-english` in filename for preview.


## Usage

After installing TexLive and downloading zjuthesis code, you can start to write your thesis:

1. Open `zjuthesis.tex` file in template code, set `\documentclass` fields as follows (remember to set `Degree = graduate` and `Language = english`, all settings are case sensitive):

   |Field      |Value           |
   |:----------|:---------------|
   |Degree     |graduate        |
   |Type       |thesis or design|
   |MajorFormat|general         |
   |Language   |english         |
   |GradLevel  |master or doctor|

1. Update the thesis content under `body/graduate` directory, put your figures and graphs under `figure` directory, update special pages (e.g. thesis cover) under `page/graduate-eng` directory, put your biblography in `body/ref.bib`.
1. To compile the zjuthesis template, open a command prompt (Windows) or terminal (MacOS/Linux), navigate the zjuthesis root directory, execute `latexmk` command.