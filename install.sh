#!/bin/bash
set -e
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'
info()    { echo -e "${CYAN}[INFO]${NC}  $1"; }
ok()      { echo -e "${GREEN}[OK]${NC}    $1"; }
warn()    { echo -e "${YELLOW}[WARN]${NC}  $1"; }
section() { echo -e "\n${BOLD}${CYAN}══════════════════════════════${NC}\n${BOLD}  $1${NC}\n${BOLD}${CYAN}══════════════════════════════${NC}\n"; }
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

section "1/5 Actualizando sistema"
sudo pacman -Syu --noconfirm

section "2/5 Instalando paquetes"
PKGS=(hyprland hyprpaper hypridle hyprlock
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
  waybar mako rofi-wayland ghostty
  wl-clipboard cliphist grim slurp swappy
  pipewire pipewire-pulse wireplumber
  ttf-jetbrains-mono-nerd ttf-font-awesome noto-fonts noto-fonts-emoji
  nwg-look brightnessctl networkmanager network-manager-applet
  btop fastfetch zsh git base-devel polkit-gnome yazi matugen firefox)
sudo pacman -S --noconfirm --needed "${PKGS[@]}" || warn "Algunos paquetes fallaron"

AUR_PKGS=(wlogout swww)
yay -S --noconfirm --needed "${AUR_PKGS[@]}" || warn "Algunos AUR fallaron"
ok "Paquetes instalados"

section "3/5 Symlinks de configuración"
CONFIG_DIR="$HOME/.config"; mkdir -p "$CONFIG_DIR"
link_config() {
  local src="$DOTFILES_DIR/$1" dst="$CONFIG_DIR/$2"
  [ -e "$dst" ] && [ ! -L "$dst" ] && mv "$dst" "${dst}.bak" && warn "Backup: ${dst}.bak"
  ln -sfn "$src" "$dst" && ok "Linked: ~/.config/$2"
}
link_config "hyprland" "hypr"
link_config "waybar"   "waybar"
link_config "rofi"     "rofi"
link_config "ghostty"  "ghostty"
link_config "mako"     "mako"
link_config "gtk"      "gtk-3.0"
mkdir -p "$HOME/.local/bin"
for s in "$DOTFILES_DIR"/scripts/*.sh; do
  name=$(basename "$s" .sh)
  ln -sfn "$s" "$HOME/.local/bin/$name" && chmod +x "$s"
done
ok "Scripts en ~/.local/bin"

section "4/5 Servicios"
sudo systemctl enable NetworkManager --now && ok "NetworkManager OK"
systemctl --user enable pipewire pipewire-pulse wireplumber 2>/dev/null && ok "Pipewire OK"

section "5/5 Carpeta de wallpapers"
mkdir -p "$HOME/Pictures/wallpapers"
warn "Agrega un wallpaper en ~/Pictures/wallpapers/default.jpg"

echo -e "\n${GREEN}${BOLD}"
echo "  ╔═══════════════════════════════╗"
echo "  ║  hyprland-dotfiles  ✓ done   ║"
echo "  ╠═══════════════════════════════╣"
echo "  ║  1. Reinicia la VM            ║"
echo "  ║  2. En TTY:  Hyprland         ║"
echo "  ║  3. Super+T  → Ghostty        ║"
echo "  ║  4. Super+R  → Rofi           ║"
echo "  ╚═══════════════════════════════╝"
echo -e "${NC}"
