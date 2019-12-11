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
\DeclareStringOption[chinese]{Language}

\DeclareStringOption[doctor]{GradLevel}
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
    % undergraduate
    \ifthenelse{\equal{\Type}{thesis}}
    {
        \newcommand{\TitleTypeName}{浙江大学本科生毕业论文}
    }
    {
        \newcommand{\TitleTypeName}{浙江大学本科生毕业设计}
    }
}
{
    % graduate
    \ifthenelse{\equal{\GradLevel}{doctor}}
    {
        % doctor
        \ifthenelse{\equal{\Type}{thesis} \OR \equal{\Type}{design}}
        {
            % thesis or design
            \newcommand{\TitleTypeName}{浙江大学博士学位论文}
            \newcommand{\TitleTypeNameCover}{博士学位论文}
        }
        {
            % equal
            \newcommand{\TitleTypeName}{同等学力申请浙江大学博士学位论文}
        }
    }
    {
        % master
        \ifthenelse{\equal{\Type}{thesis} \OR \equal{\Type}{design}}
        {
            % thesis or design
            \newcommand{\TitleTypeName}{浙江大学硕士学位论文}
            \newcommand{\TitleTypeNameCover}{硕士学位论文}
        }
        {
            % equal
            \newcommand{\TitleTypeName}{同等学力申请浙江大学硕士学位论文}
        }
    }
}

\input{config/path}
\input{config/commands}
\input{config/format/format}
\input{config/version}
