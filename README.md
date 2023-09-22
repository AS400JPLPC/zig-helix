**Helix**

_After a few problems... & a few scares..._  
_I switch from VSCode ide to helix-editor_  
_I need an editor, maybe less plugin...,_  
_but it does exactly what I ask it to do._

Setting up Helix, I work with Linux, you will find in your distribution how to install it.

https://helix-editor.com/

a) install Zig https://ziglang.org/download/  

b) install Zls LSP [https://github.com/zigtools/zls](https://github.com/zigtools/zls)

c) install lldb (pacman -S lldb) for manjaro or arch    lldb-vscode  recommend for Helix and ZIG

personally I put Zig in ./zig and zls in ./zls  

in .profile

add matching paths and aliases  

```plaintext
  export PATH=/home/soleil/.zig:$PATH  

  export PATH=/home/soleil/.zls:$PATH  

  alias zls="/home/soleil/.zls/zls"  

  alias zig="/home/soleil/.zig/zig"  
```

in .bashrc

add line   
Allows HELIX to intuitively access either your files or your texts in your files and present you with an exhaustive list of files

```plaintext
  # Helix Search  
  hxs() {  
  RG\_PREFIX="rg -i --files-with-matches"  
  local files  
  files="$(  
  &nbsp;FZF\_DEFAULT\_COMMAND\_DEFAULT\_COMMAND="$RG\_PREFIX '$1'" \\  
  &nbsp; fzf --multi 3 --print0 --sort --preview="\[\[ ! -z {} \]\] &amp;&amp; rg --pretty --ignore-case --context 5 {q} {}" \\  
  &nbsp; &nbsp;--phony -i -q "$1" \\  
  &nbsp; &nbsp;--bind "change:reload:$RG\_PREFIX {q}" \\  
  &nbsp; &nbsp;--preview-window="70%:wrap" \\  
  &nbsp; &nbsp;--bind 'ctrl-a:select-all'  
  )"  
  \[\[ "$files" \]\] &amp;&amp; hx --vsplit $(echo $files | tr \\\\0 " ")  
  }
```

.config/helix/  

my config.toml file concerns the editor settings  

After searching and gathering the most important and cool points

I thank the various authors...  

tested and bug-free  

\-------------------------------------

mytheme.toml  

It's a copy of sonokai.toml and very few modifications "|" for the indentation { }...  

a note in config.toml

I put the relationship.

theme = "/home/soleil/.config/helix/mytheme"  

\-------------------------------------

language.toml

It's an example :

for me: using Zig-lang, I configured it and I no longer have link errors with LSP and the language is well recognized.  

Now the tools to compile and a console.  

My compilation tools are pretty much the same as VSCODE and task.  

I have a ".Terminal" folder in which the procedures are located

EnvZig.sh

project cleaning

`compile: zig build / doc .... a) debug b) production c) saft d) small d) testing e) doc`

\> compile: zig build / doc ....  
\> a) debug  
\> b) production  
\> c) saft  
\> d) small  
\> d) testing  
\> e) doc

EnvZCPP.sh

`compile: gcc... a) debug b) production c) console`

\> compile: gcc...  
\> a) debug  
\> b) production  
\> c) console

the console option boots into a reworked terminal and releases the menu.

The C/C++ compilation only helps me to make a VTE terminal (gtk)  

The C/C++ compilation only helps me to make a VTE terminal (gtk)  
for use in the base with programs like Gencurs

https://github.com/AS400JPLPC/zig_TermCurs  

\-------------------------------------

Coming back to the difference between VSCODE and HELIX  
is that I had direct action from VSCODE,  
because there is no integrated terminal or possibility of communication from helix and program. RUST security.

But the LSP is meaner than on vscode, so we find it.  

The learning curve is relatively uncomplicated than vim... on the other hand, you have to take the time to practice the tutorial.  

The gain: no more madness in the propagation of caches and various logs and memory extension.  

The gain: no more madness in the propagation of caches and various logs and memory extension.  

I've done quite a few tests of neovim by the way, gvim, kakoune, lite-xl, geany, codeblock, sublime, atom, builder, and a few others, I think this one is the right one, it's still missing one or two things, but not vital.  

my big stops on PC since 1985

Metroworks CodeWarrior. trubo pacal etc.

codeblock, my first more than 25 years ago,

geany, has been my utility for a long time

builder, my sewing machine

vscode ......... in short, I keep it stanbye. (this was a serious advance on PC as a code editor)

more than 50 years ago IBM was 50 years ahead and the LSP was integrated but proprietary

so HELIX is small in size, but does a good job

**After working, and spending some time to find the configuration tips, "copy/paste" the most coherent theme, e.g.: brackets and adjustment of the language definition etc. It's starting to be effective**

Lorenzo Sétale and Rajasegar Chandran thank-you

*   2023-09-22  **After testing**
*   update config.toml
*   new mytheme  :  very close dark\_plus > vscode

I'm working with "helix" and restructuring my sources, because I encounter the end of line positions and spaces are completely inconsistent. 

We can't really do without visualizing spaces, and colors can quickly become inconsistent and unpleasant. 

> I think that there, I will stabilize.  
>   
>   
> helix --health zig  
> Configured language server: zls  
> Binary for language server: /home/soleil/.zls/zls  
> Configured debug adapter: lldb-vscode  
> Binary for debug adapter: /usr/bin/lldb-vscode  
> Highlight queries: ✓  
> Textobject queries: ✓  
> Indent queries: ✓  
>