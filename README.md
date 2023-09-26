**Helix**

**2003-09-25 Updated search for last source saved with "write-buffer-close" or "wbc" sorry**  
**Unable to securely access name and directory I bypassed it, please read below**

_After a few problems... & a few scares..._  
_I switch from VSCode ide to helix-editor_  
_I need an editor, maybe less plugin...,_  
_but it does exactly what I ask it to do._

Setting up Helix, I work with Linux, you will find in your distribution how to install it.

To develop, it is better to have an installation of ZIG / ZLS, in your HOME, think about changing the version, this allows you to test more easily

https://helix-editor.com/

a) install Zig https://ziglang.org/download/  

b) install Zls LSP [https://github.com/zigtools/zls](https://github.com/zigtools/zls)

c) install pacman lldb ( lldb-vscode)  Helix cherche le débogueur

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
~Allows HELIX to intuitively access either your files or your texts in your files and present you with an exhaustive list of files;~

integrated with the latest version

intégrer-------------------------------------

.config/helix/  

my config.toml file concerns the editor settings  

After searching and gathering the most important and cool points

I thank the various authors...  

tested and bug-free  

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

mytheme.toml  

It's a copy of sonokai.toml and very few modifications "|" for the indentation { }...  

a note in config.toml

I put the relationship.

theme = "/home/soleil/.config/helix/mytheme"  

copy mytheme to usr/lib/helix/theme/

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

language.toml

It's an example :

for me: using Zig-lang, I configured it and I no longer have link errors with LSP and the language is well recognized.  

Now the tools to compile and a console.  

My compilation tools are pretty much the same as VSCODE and task.  

I have a ".Terminal" folder in which the procedures are located  

_**I only use the terminal ex: xfce4-terminal**_

EnvZig.sh

```plaintext
compile: zig build / doc ....

 1. ClearProjet (cache, not source)

 2. Compile_Debug

 3. Compile_Prod

 4. Compile_Safe

 5. Compile_Small

 6. Compile_test

 7. Compile_Doc
```

EnvZCPP.sh

```plaintext
compile: gcc... c/c++

1. ClearProjet ( not source )

2. Compile_Debug

3. Compile_Prod
```

MenuDEV.sh

```plaintext
Menu Général

1) VTE terminal compile: for ZIG application (secure)

2) BUILD ZIG application

10) execute HELIX >  root directory: PROJECT

55) HELIX launch >  root directory: PROJECT

66) launch HELIX last registered file-source

77) clear helix.log

88) console

99) e__________________________________________________________xit
```

**To retrieve the latest source, you have to C-s keymap**  
**please look at the config.toml please**

**ex:**

```plaintext
        Path :/home/soleil/Zterm/src-zig
                  q -> exit
                  Name source : Gencurs.zig
```

Recording in the “archiveFile.log” f

in the form date time directory name-source "2023-09-25 20:54:12 file:///home/soleil/Zterm/src-zig/Gencurs.zig"

 this allows you to restart from the last processed source and to have follow-up

At the moment we don't have access to filename etc..

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

the console option boots into a reworked terminal and releases the menu.

The C/C++ compilation only helps me to make a VTE terminal (gtk)  

The C/C++ compilation only helps me to make a VTE terminal (gtk)  
for use in the base with programs like Gencurs

https://github.com/AS400JPLPC/zig_TermCurs  

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

Coming back to the difference between VSCODE and HELIX  
is that I had direct action from VSCODE,  
because there is no integrated terminal or possibility of communication from helix and program. RUST security.

But the LSP is meaner than on vscode, so we find it.  

The learning curve is relatively uncomplicated than vim... on the other hand, you have to take the time to practice the tutorial.  

The gain: no more madness in the propagation of caches and various logs and memory extension.  

The gain: no more madness in the propagation of caches and various logs and memory extension.  

I've done quite a few tests of neovim by the way, gvim, kakoune, lite-xl, geany, codeblock, sublime, atom, builder, and a few others, I think this one is the right one, it's still missing one or two things, but not vital.

    
start informatique 1976 middle systeme  

my big stops on PC since 1985

Metroworks CodeWarrior. trubo pacal etc.

codeblock, my first more than 25 years ago,

geany, has been my utility for a long time

builder, my sewing machine

vscode ......... in short, I keep it stanbye. (this was a serious advance on PC as a code editor)

more than 50 years ago IBM was 50 years ahead and the LSP was integrated but proprietary

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

so HELIX is small in size, but does a good job

**After working, and spending some time to find the configuration tips, "copy/paste" the most coherent theme, e.g.: brackets and adjustment of the language definition etc. It's starting to be effective**

Lorenzo Sétale and Rajasegar Chandran thank-you

I'm working with "helix" and restructuring my sources, because I encounter the end of line positions and spaces are completely inconsistent. 

We can't really do without visualizing spaces, and colors can quickly become inconsistent and unpleasant. 

*   I think that there, I will stabilize.  
    helix --health zig  
    Configured language server: zls  
    Binary for language server: /home/soleil/.zls/zls  
    Configured debug adapter: lldb-vscode  
    Binary for debug adapter: /usr/bin/lldb-vscode  
    Highlight queries: ✓  
    Textobject queries: ✓  
    Indent queries: ✓

  
  
  
2023-09-22  **After testing**

*   update config.toml
*   new mytheme  :  very close dark\_plus > vscode
*   2003-09-25 Updated search for last source saved with "write-buffer-close" or "wbc"
*   2023-09-26 menu  option 88 console  :   
    Opening a console independently  
    config.toml  # select line up  / bufferline = "multiple"  
    change Ctrl-s  C-s to Alt-q A-q free combination