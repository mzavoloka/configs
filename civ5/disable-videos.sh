# https://rtfm.co.ua/en/steam-civilization-v-arch-linux-and-errorinvalid-resolutions-constraints-0x0-must-not-be-greater-than-0x0/
cd ~/.local/share/Steam/steamapps/common/Sid\ Meier\'s\ Civilization\ V
for m in `find . -name \*.mov -type f`; do mv "$m" "$m"_bak; done
find . -name *_bak
