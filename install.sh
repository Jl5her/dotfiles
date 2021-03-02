for file in .{path,bash_prompt,aliases,extra,bashrc,vimrc,bash_profile}; do
  if [ -r "$file" ] && [ -f "$file" ];
  then
    printf "Creating symlink for '$file'...";
    if ln -s "`pwd`/$file" "$HOME";
    then
      printf "Done\n";
    fi
  fi
done;
