x=0
echo "$HOME"

search="ui.virtual.whitespace"

new_text='"ui.virtual.whitespace"      = { fg = "#7c171c" }'

echo "$want"
echo "$new_text"

line=$(grep -n $search "$HOME/.helix/contrib/themes/dark_plus.toml" | cut -d':' -f 1 ) 


cmd="$line"" c ""$new_text"

echo "$cmd"

new_file=$(sed "$cmd"   "$HOME/.helix/contrib/themes/dark_plus.toml")

echo "$new_file"

printf "%s"  "$new_file" > "$HOME/.helix/contrib/themes/dark_plus.toml"



exit 0
