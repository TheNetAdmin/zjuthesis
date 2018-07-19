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
\DeclareStringOption[cs]{MajorFormat}
\DeclareStringOption[thesis]{Type}
\DeclareStringOption[proposal]{Period}
\DeclareStringOption[false]{BlindReview}

\ProcessKeyvalOptions*

\PassOptionsToPackage{AutoFakeBold}{xeCJK}
\LoadClass[
    zihao=-4,
    heading=true,
    UTF8,
    twoside
]{ctexrep}

\input{config/packages}
\input{config/path}
\input{config/format/format}
\input{config/commands}
\input{config/version}
