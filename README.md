**Helix**  
  
  
 

_After a few problems... & a few scares..._  
_I switch from VSCode ide to helix-editor_  
_I need an editor, maybe less plugin...,_  
_but it does exactly what I ask it to do._  
  
  
  
Setting up Helix, I work with Linux, you will find in your distribution how to install it.  
  
https://helix-editor.com/  
  
  
  
  
  
a) install Zig https://ziglang.org/download/  
 

b) install Zls LSP https://github.com/zigtools/zls  
  
  
  
  
  
personally I put Zig in ./zig and zls in ./zls  
 

in .profile  
  
add matching paths and aliases  
 

> export PATH=/home/soleil/.zig:$PATH  
>   
> export PATH=/home/soleil/.zls:$PATH  
>   
> alias zls="/home/soleil/.zls/zls"  
>   
> alias zig="/home/soleil/.zig/zig"  
>  

\-------------------------------------

in .bashrc

add line 

> \# Helix Search  
> hxs() {  
> RG\_PREFIX="rg -i --files-with-matches"  
> local files  
> files="$(  
>  FZF\_DEFAULT\_COMMAND\_DEFAULT\_COMMAND="$RG\_PREFIX '$1'" \\  
>   fzf --multi 3 --print0 --sort --preview="\[\[ ! -z {} \]\] && rg --pretty --ignore-case --context 5 {q} {}" \\  
>    --phony -i -q "$1" \\  
>    --bind "change:reload:$RG\_PREFIX {q}" \\  
>    --preview-window="70%:wrap" \\  
>    --bind 'ctrl-a:select-all'  
> )"  
> \[\[ "$files" \]\] && hx --vsplit $(echo $files | tr \\\\0 " ")  
> }  
>  

\-------------------------------------  
  
.config/helix/  
 

my config.toml file concerns the editor settings  
 

After searching and gathering the most important and cool points  
  
I thank the various authors...  
 

tested and bug-free  
 

\-------------------------------------  
  
mytheme.toml  
 

It's a copy of onedarker and very few modifications "|" for the indentation { }...  
 

a note in config.toml  
  
I put the relationship.  
  
theme = "/home/soleil/.config/helix/mytheme"  
 

\-------------------------------------  
  
language.toml  
  
It's an example :  
  
for me: using Zig-lang, I configured it and I no longer have link errors with LSP and the language is well recognized.  
 

\-------------------------------------  
  
Now the tools to compile and a console.  
 

My compilation tools are pretty much the same as VSCODE and task.  
 

<<<<<<< HEAD
I have a ".Terminal" folder in which the procedures are located  
  
  
  
EnvZig.sh  
  
project cleaning  
  
`compile: zig build / doc .... a) debug b) production c) saft d) small d) testing e) doc`  
  
  
  
  
EnvZCPP.sh  
  
`compile: gcc... a) debug b) production c) console`   
  
the console option boots into a reworked terminal and releases the menu.  
  
The C/C++ compilation only helps me to make a VTE terminal (gtk)  
 
=======
I have a ".Terminal" folder in which the procedures are located</br>
</br>
EnvZig.sh</br>
project cleaning</br>
`compile: zig build / doc ....
a) debug
b) production
c) saft
d) small
d) testing
e) doc`
</br>
</br>
EnvZCPP.sh</br>
`compile: gcc...
a) debug
b) production
c) console
`</br>
the console option boots into a reworked terminal and releases the menu.</br>
The C/C++ compilation only helps me to make a VTE terminal (gtk)</br>
>>>>>>> 395c197 (maj_20230920_18:48)

The C/C++ compilation only helps me to make a VTE terminal (gtk)  
for use in the base with programs like Gencurs  
  
https://github.com/AS400JPLPC/zig_TermCurs  
 

\-------------------------------------  
  
Coming back to the difference between VSCODE and HELIX  
is that I had direct action from VSCODE,  
because there is no integrated terminal or possibility of communication from helix and program. RUST security.  
  
But the LSP is meaner than on vscode, so we find it.  
 

<<<<<<< HEAD
The learning curve is relatively uncomplicated than vim... on the other hand, you have to take the time to practice the tutorial.  
 
=======
-------------------------------------</br>
Coming back to the difference between VSCODE and HELIX
is that I had direct action from VSCODE,
because there is no integrated terminal or possibility of communication from helix and program. RUST security.</br>
But the LSP is meaner than on vscode, so we find it.</br>

The learning curve is relatively uncomplicated than vim... on the other hand, you have to take the time to practice the tutorial.</br>

-------------------------------------</br>
The gain: no more madness in the propagation of caches and various logs and memory extension.</br>

The gain: no more madness in the propagation of caches and various logs and memory extension.</br>

I've done quite a few tests of neovim by the way, gvim, kakoune, lite-xl, geany, codeblock, sublime, atom, builder, and a few others, I think this one is the right one, it's still missing one or two things, but not vital.</br>

my big stops on PC since 1985</br>
Metroworks CodeWarrior. trubo pacal etc.</br>
codeblock, my first more than 25 years ago,</br>
geany, has been my utility for a long time</br>
builder, my sewing machine</br>
vscode ......... in short, I keep it stanbye. (this was a serious advance on PC as a code editor)</br>
</br>
more than 50 years ago IBM was 50 years ahead and the LSP was integrated but proprietary</br>
</br>
  so HELIX is small in size, but does a good job
</br>

>>>>>>> 395c197 (maj_20230920_18:48)

\-------------------------------------  
  
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