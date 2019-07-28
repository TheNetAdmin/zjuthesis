\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zjuthesis}
    [Zhejiang University Thesis and Design Template, Zixuan Wang zxwang42@gmail.com]

\RequirePackage{kvoptions}

\SetupKeyvalOptions{
    family=zjuthesis,
    prefix=
}
\DeclareStringOption{StudentName}
\DeclareStringOption{StudentID}
\DeclareStringOption{AdvisorName}
\DeclareStringOption{Grade}
\DeclareStringOption{Major}
\DeclareStringOption{Department}
\DeclareStringOption{Title}
\DeclareStringOption{SubmitDate}
\DeclareStringOption[undergraduate]{Degree}
\DeclareStringOption[general]{MajorFormat}
\DeclareStringOption[thesis]{Type}
\DeclareStringOption[proposal]{Period}
\DeclareStringOption[false]{BlindReview}

\DeclareStringOption{ColaboratorName}
\DeclareStringOption{Topic}

\ProcessKeyvalOptions*

\PassOptionsToPackage{AutoFakeBold}{xeCJK}
\LoadClass[
    zihao=-4,
    heading=true,
    UTF8,
    twoside
]{ctexrep}

\input{config/packages}

\ifthenelse{\equal{\Degree}{undergraduate}}
{
    \newcommand{\TitleTypeName}{浙江大学本科生毕业论文（设计）}
}
{
    \ifthenelse{\equal{\Type}{thesis}}
    {%
        \newcommand{\TitleTypeName}{浙江大学博（硕）士学位论文}
    }
    {
    \ifthenelse{\equal{\Type}{design}}
    {%
        \newcommand{\TitleTypeName}{浙江大学博（硕）士专业学位论文}
    }
    {%
        \newcommand{\TitleTypeName}{同等学力申请浙江大学博（硕）士学位论文}
    }
    }
}

\input{config/path}
\input{config/format/format}
\input{config/commands}
\input{config/version}
