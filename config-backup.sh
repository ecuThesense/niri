cp -r ~/.config/niri/ ~/niri/
cp -r ~/.local/state/noctalia/ ~/niri/ExportNoctalia/noctalia-settings/
cp -r ~/.config/noctalia ~/niri/ExportNoctalia/noctalia-config/
cp -r ~/.config/yazi/ ~/niri/
cp -r ~/.config/xdg-desktop-portal/ ~/niri/

git rm --cached -f -- \
  ExportNoctalia/noctalia-settings/noctalia/plugins/sources/community/repo \
  ExportNoctalia/noctalia-settings/noctalia/plugins/sources/official/repo \
  ExportNoctalia/noctalia-settings/plugins/sources/community/repo \
  ExportNoctalia/noctalia-settings/plugins/sources/official/repo
