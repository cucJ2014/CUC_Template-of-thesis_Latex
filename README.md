# 中国传媒大学硕士论文 LaTeX 模板

## 1 前言

### 1.1 在哪里添加内容

1. 个人信息：在 `cucthesis.tex` 中 `\documentclass[]{cucthesis}` 部分按照注释填写
2. 封面： 在 `./page/graduate/cover-chn.tex`中修改封面内容
3. 中文/英文摘要：在 `./page/graduate/abstract.tex`中写摘要内容
4. 致谢：在 `./page/graduate/thanksto.tex`中写致谢部分
5. 正文Body部分：在 `./body/graduate/content.tex` 中编写
6. 存放图片： 在 `figure` 目录下保存图片
7. 参考文献： 在 `./body/ref.bib` 内插入文献条目，在在 `./body/graduate/content.tex` 中引用
8. 攻读硕士学位期间取得的学术成果：`./body/graduate/post/cv.tex`中加入学术成果
9. 引用包：`./config/packages.tex`中增加引用的包文件
10. 其余包含：勘误表、序言等内容

### 1.2 编译方式

~~~ 
xelatex -> biber -> xelatex -> xelatex
~~~



## 2 LaTex安装使用教程（MacOS）

### 2.1 TeX 、LaTeX、MiKTeX、teTeX、MacTeX

#### 2.1.1 TeX和LaTex

其实世界上只有一个TeX程序，叫做 "tex"，由 [Donald.E.Knuth](http://www-cs-faculty.stanford.edu/~knuth) 设计并且实现的。

这两者其实是**同一个程序**，但是层次上不同：TeX 是 LaTeX 的基石，LaTeX 建立在 TeX 之上。

- TeX ：排版程序、程序语言
- LaTeX ：用TeX语言写成的一个“TeX 宏包”，它扩展了 TeX 的功能，使我们很方便的逻辑的进行创作而不是专心于字体

> 如果你想搞清楚他们具体是怎样的关系，参考[LaTeX+CJK是怎样工作的](https://docs.huihoo.com/homepage/shredderyin/tex/tex_cjk.html)。

#### 2.1.2 MiKTeX、teTeX、MacTeX……

- 来源

  Knuth 创造了 TeX 之后，免费公布了 TeX 程序的源代码。所以任何人都可以在保证不修改那个文件的情况下把它编译成程序，然后跟其它很多程序一起打包发行。

- 不同的操作系统有不同的发行版本
  - Windows ： MiKTeX，fpTeX……
  - Linux 、 UNIX ： teTeX……
  - MacOS：MacTex……

### 2.2 MacTeX的安装与使用

#### 2.2.1 [安装MacTeX](http://www.tug.org/mactex/index.html)

- 查看安装结果

  ~~~ 
  tex -v
  ~~~

##### 2.2.1.1 TeXShop

- 编辑器、TeX预览器

##### 2.2.2.2  LaTeXit

- 数学公式编辑器

#### 2.2.2 TeXShop编译

- 使用模板

  ![](https://tva1.sinaimg.cn/large/008eGmZEgy1gpig9yzfsvj31560au0y3.jpg)

#### 2.2.3 命令行编译

- 编辑 **.tex** 文件

  ~~~ 
  vim test.tex
  ~~~

- 编译

  ~~~ 
  xelatex test.tex
  ~~~

- 查看pdf文件

  ~~~ 
  open test.pdf
  ~~~

### 2.3 MacTeX + Visual Studio Code

#### 2.3.1 [安装VS Code](https://code.visualstudio.com/download)

- 安装扩展应用：LaTeX Workshop、vscode-pdf

#### 2.3.2 使用VS Code 编译

- 打开毕业论文模板文件夹

- 使用命令运行论文模板（设置快捷方式见“增加命令的快捷方式”）

  ~~~ 
  xelatex [filename]
  ~~~

  ~~~ 
  biber [filename]
  ~~~

  ~~~ 
  xelatex [filename]
  ~~~

  ~~~ 
  xelatex [filename]
  ~~~

- 使用pdf预览

  <img src="https://tva1.sinaimg.cn/large/008eGmZEgy1gpik05dvrmj30mi0nqtba.jpg" style="zoom:47%;" />

- 增加命令的快捷方式

  1. 打开setting.json配置文件/latex-workshop.latex.recipes

     ![](https://tva1.sinaimg.cn/large/008eGmZEgy1gpika7tjdpj31p00u0dyk.jpg)

     ![](https://tva1.sinaimg.cn/large/008eGmZEgy1gpikniyasdj30zr0u0kez.jpg)

  2. 在setting.json文件中配置如下：

     - 增加自定义命令：·`xelatex->biber->xelatex->xelatex`
     - 设置在运行失败时，删除生成的多余文件
     - 每次更改，都会自动运行**上一次**运行的命令

     ~~~ json
     {
         "latex-workshop.latex.recipes": [
             {
                 "name": "xelatex ➞ biber ➞ xelatex`×2",
                 "tools": [
                     "xelatex",
                     "biber",
                     "xelatex",
                     "xelatex"
                 ]
             },
             {
                 "name": "xelatex ➞ bibtex ➞ xelatex`×2",
                 "tools": [
                     "xelatex",
                     "bibtex",
                     "xelatex",
                     "xelatex"
                 ]
             },
             {
                 "name": "latexmk",
                 "tools": [
                     "latexmk"
                 ]
             }
         ],
         "latex-workshop.latex.tools": [
             {
                 "name": "latexmk",
                 "command": "latexmk",
                 "args": [
                     "-synctex=1",
                     "-interaction=nonstopmode",
                     "-file-line-error",
                     "-pdf",
                     "-outdir=%DIR%",
                     "%DOC%"
                 ],
                 "env": {}
             },
             {
                 "name": "xelatex",
                 "command": "xelatex",
                 "args": [
                     "-synctex=1",
                     "-interaction=nonstopmode",
                     "-file-line-error",
                     "%DOC%"
                 ],
                 "env": {}
             },
             {
                 "name": "bibtex",
                 "command": "bibtex",
                 "args": [
                     "%DOCFILE%"
                 ],
                 "env": {}
             },
             {
                 "name": "biber",
                 "command": "biber",
                 "args": [
                     "%DOCFILE%"
                 ],
                 "env": {}
             }
         ],
         "latex-workshop.latex.clean.fileTypes": [
             "*.aux",
             "*.bbl",
             "*.blg",
             "*.idx",
             "*.ind",
             "*.lof",
             "*.lot",
             "*.out",
             "*.toc",
             "*.acn",
             "*.acr",
             "*.alg",
             "*.glg",
             "*.glo",
             "*.gls",
             "*.ist",
             "*.fls",
             "*.log",
             "*.fdb_latexmk"
         ],
         "latex-workshop.latex.autoClean.run": "onFailed",
         "latex-workshop.latex.recipe.default": "lastUsed"
     }
     ~~~

  3. 重启程序。

  4. 点击命令，运行该文件。

     ![](https://tva1.sinaimg.cn/large/008eGmZEgy1gpjfjpt22ej31d90u0wqs.jpg)



## 3 开源许可

**本项目代码参考与浙江传媒大学开源代码**

**学校标志与学校文件的版权归中国传媒大学所有**