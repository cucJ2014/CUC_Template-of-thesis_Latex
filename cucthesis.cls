\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cucthesis}
    [Communication University of China Thesis and Design Template]
\input{config/version}
\wlog{cucthesis version: \cucthesisversion}

\RequirePackage{kvoptions}

\SetupKeyvalOptions{
    family=cucthesis,
    prefix=
}
\DeclareStringOption{StudentName}
\DeclareStringOption{StudentID}
\DeclareStringOption{AdvisorName}
\DeclareStringOption{Grade}
\DeclareStringOption{Major}
\DeclareStringOption{Department}
\DeclareStringOption{Topic}
\DeclareStringOption{Title}
\DeclareStringOption{TitleEng}
\DeclareStringOption{SubmitDate}
\DeclareStringOption[undergraduate]{Degree}
\DeclareStringOption[general]{MajorFormat}
\DeclareStringOption[thesis]{Type}
\DeclareStringOption[proposal]{Period}
\DeclareStringOption[chinese]{Language}
\DeclareStringOption[doctor]{GradLevel}
\DeclareStringOption{ColaboratorName}
\DeclareStringOption[false]{BlindReview}
\DeclareStringOption[false]{PrintFilePath}

\ProcessKeyvalOptions*

\wlog{Degree: {\Degree}}
\wlog{MajorFormat: {\MajorFormat}}
\wlog{Type: {\Type}}
\wlog{Period: {\Period}}
\wlog{BlindReview: {\BlindReview}}
\wlog{Language: {\Language}}
\wlog{GradLevel: {\GradLevel}}
\wlog{PrintFilePath: {\PrintFilePath}}

\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{AutoFakeBold}{xeCJK}
\LoadClass[
    zihao=-4,
    UTF8,
    oneside
]{ctexrep}

\input{config/packages}

\ifthenelse{\equal{\Degree}{undergraduate}}
{
    % undergraduate
    \ifthenelse{\equal{\Type}{thesis}}
    {
        \newcommand{\TitleTypeName}{中国传媒大学本科生毕业论文}
    }
    {
        \newcommand{\TitleTypeName}{中国传媒大学本科生毕业设计}
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
            \newcommand{\TitleTypeName}{中国传媒大学博士学位论文}
            \newcommand{\TitleTypeNameCover}{博士学位论文}
        }
        {}
    }
    {
        % master
        \ifthenelse{\equal{\Type}{thesis}}
        {
            % thesis
            \newcommand{\TitleTypeName}{中国传媒大学硕士学位论文}
            \newcommand{\TitleTypeNameCover}{硕士学位论文}
        }
        {
            % design
            \newcommand{\TitleTypeName}{中国传媒大学硕士专业学位论文}
            \newcommand{\TitleTypeNameCover}{硕士专业学位论文}
        }
    }
}

\input{config/path}
\input{config/commands}
\input{config/format/format}
