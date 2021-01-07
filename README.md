# 中国传媒大学学位论文 LaTeX 模板

## 使用

zjuthesis 模板有两种使用方式，Overleaf 或本地编译：
   - Overleaf 是一个线上 LaTeX 编辑器，可以在不安装任何工具的情况下编写 LaTeX 文档，同时也可以和其他人共享文档，共同编辑。
   - 本地编译比 Overleaf 更快，而且本地编译可以使用 Git 来记录版本 (Overleaf 的版本记录功能需要订阅)。推荐有能力的同学设置本地编译环境，并推荐使用 Visual Studio Code 配合 LaTeX workshop 插件 (vscode 使用方式见[FAQ](./docs/FAQ.md))。

### Overleaf

1. [下载模板代码](https://github.com/TheNetAdmin/zjuthesis/releases) 中的 `zjuthesis-v*.*.*-overleaf.zip` 文件
1. 在 Overleaf 中上传这个 .zip 压缩文件以创建一个新 Overleaf 项目
1. 在 Overleaf 界面左上角点击 "Menu"
   - 选择 "Compiler" 为 "XeLaTeX"
   - 选择 "TeX Live version" 为 "2019" 或者更新的版本
1. 参照 Overleaf 项目中 `fonts/README.md` 的说明下载所需字体，并上传到 `fonts` 文件夹中
1. 使用 Overleaf 编译
   - 选择专业模板与毕业学位的方式参见下文 "本地编译"

### 本地编译

1. 安装 TeXLive 工具包，编译需要 XeTeX 引擎
1. [下载模板代码](https://github.com/TheNetAdmin/zjuthesis/releases)，
   每个专业模板都有预览 pdf 文件，可以单独下载查看。
   模板代码请下载 `zjuthesis-v*.*.*.zip` 文件
   （如果你在用 Clone 或者 Fork 得到的代码，请切换到最新的 release tag，避免 master 分支上的不稳定更新破环你的论文的样式）
1. 在 `zjuthesis.tex` 中 `\documentclass[]{zjuthesis}` 部分填写个人信息，其中以下信息用于控制文档的生成：

   - `Degree` 为 `undergraduate` 时，编译本科生论文：

   | Field      | Option 1                            | Option 2                              |
   | :--------- | :-----------------------------------| :------------------------------------ |
   |Type        | thesis: 论文类                       | design: 设计类                         |
   |Period      | proposal: 开题报告                   | final: 最终论文/设计                    |
   |BlindReview | true: 生成盲审用 pdf（隐藏个人信息）   | false: 生成提交用 pdf                   |
   |MajorFormat | general: 默认模板                    | 与 `config/format/major/` 下目录名相同  |

   - `Degree` 为 `graduate` 时，编译硕士生/博士生论文：


   | Field      | Option 1                            | Option 2                              |
   | :--------- | :-----------------------------------| :------------------------------------ |
   | Type       | thesis: 学术论文                     | design: 专业学术论文                    |
   | BlindReview| true: 生成盲审用 pdf（隐藏个人信息）   | false: 生成提交用 pdf                   |
   | MajorFormat| general: 默认模板                    | 与 `config/format/major/` 下目录名相同  |
   | GradLevel  | master: 硕士                         | doctor: 博士                           |

   - Debug 相关设置

   | Field         | Option 1                              | Option 2                              |
   | :------------ | :------------------------------------ | :------------------------------------ |
   | PrintFilePath | true: 在每页侧边打印该页对应 TeX 文件路径 | false: 不打印此输出                    |

1. 在 `body` 目录下编写内容
1. 在 `pages` 目录下填写必要的内容，如审核评语等
1. 在 `figure` 目录下保存图片，在 `body/ref.bib` 内插入文献条目
1. 在根目录下运行命令 `latexmk`（或者 `latexmk -xelatex -outdir=out zjuthesis`）即可使用 XeTeX 编译 pdf 文件到 `out` 目录（该目录不会被记录版本）。**请务必使用此 `latexmk` 命令进行编译（除非你已经了解 LaTeX 的工作机制），否则你可能遇到参考文献无法显示等问题**
1. 如需使用 LuaTeX 编译，可运行命令 `latexmk -pdflua -outdir=out`

> 注意：
>
> - 如果你使用 Mac OS 10.15 及以上版本，并且 TexLive 中的 ctex 包版本低于 2.5，会产生[宋体字体判断问题](https://github.com/TheNetAdmin/zjuthesis/issues/79)，导致编译得到的 pdf 中字体出现误差。要解决这个问题，可以将 ctex 包升级到 2.5 以上，或者临时在 ctex 包的选项中加入 `fontset=macnew`，详见 [issue  79](https://github.com/TheNetAdmin/zjuthesis/issues/79)。
> - 本模板已经兼容 TeXLive 2020。TeXLive 2018 以及之前的版本复制伪粗体文字会产生乱码，建议单独使用 TeXLive 的同学尽快升级至 2019 或更新的版本
> - 计算机专业的部分页面与学校通用格式不同，如果你是计算机专业的同学，请使用计算机专业的模板


## 参考文档

常见问题与解决方案请参考[FAQ](./docs/FAQ.md)，模板使用请参考[使用手册](./docs/usage.md)，模板修改与二次开发请参考[开发手册](./docs/develop.md)。


## 开源许可

本项目代码参考与浙江传媒大学开源代码
学校标志与学校文件的版权归中国传媒大学所有
