function render-md {
  if [[ $1 = '' ]]; then
    echo 'ERROR: No file specified' >&2
    return 1
  fi

  if [[ ! -f $1 ]]; then
    echo "ERROR: File doesn't exist" >&2
    return 1
  fi

  if [[ $2 = '' ]]; then
    2=$1.pdf
  fi
  #sed "s/\[toc\]/\<nav\>\n\n\[toc\]\n\<\/nav\>/g" $1 | sed "s/\[toc\]/$(markdown-toc --bullets '1.' $1 | sed 's/$/\\n/g' | tr -d '\n')/g" | pandoc ${@:3} -s -f commonmark_x -o $2 --css=$(realpath ~/.dotfiles/pandoc/pandoc.css) --katex --pdf-engine=pagedjs-cli
  sed "s/\[toc\]/\<nav\>\n\n\[toc\]\n\<\/nav\>\n\n/g" $1 | sed "s/\[toc\]/$(cat $1 | node ~/.dotfiles/pandoc/toc.js | sed 's/$/\\n/g' | tr -d '\n')/g" | pandoc ${@:3} -s -f markdown -o $2 --css=$(realpath ~/.dotfiles/pandoc/pandoc.css) --katex --pdf-engine=pagedjs-cli
}
