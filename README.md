<div align="center">

```
██╗  ██╗██╗   ██╗██████╗ ██████╗ ██╗      █████╗ ███╗   ██╗██████╗ 
██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗██║     ██╔══██╗████╗  ██║██╔══██╗
███████║ ╚████╔╝ ██████╔╝██████╔╝██║     ███████║██╔██╗ ██║██║  ██║
██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗██║     ██╔══██║██║╚██╗██║██║  ██║
██║  ██║   ██║   ██║     ██║  ██║███████╗██║  ██║██║ ╚████║██████╔╝
╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ 
```

**Hyprland dotfiles** — CachyOS · Tokyo Night · Wayland

![CachyOS](https://img.shields.io/badge/CachyOS-Arch-blue?style=flat-square&logo=archlinux)
![Hyprland](https://img.shields.io/badge/WM-Hyprland-58E1FF?style=flat-square)
![Tokyo Night](https://img.shields.io/badge/Theme-Tokyo%20Night-7aa2f7?style=flat-square)
![Wayland](https://img.shields.io/badge/Display-Wayland-orange?style=flat-square)

</div>

---

## Stack

| Componente     | App                  |
|----------------|----------------------|
| WM             | Hyprland             |
| Barra          | Waybar               |
| Launcher       | Rofi-wayland         |
| Terminal       | Ghostty              |
| Notificaciones | Mako                 |
| Wallpaper      | swww                 |
| Lock           | Hyprlock             |
| Idle           | Hypridle             |
| Audio          | Pipewire + WirePlumber |
| File manager   | Yazi                 |
| Shell          | Zsh                  |
| Fuente         | JetBrainsMono Nerd Font |

## Instalación rápida

```bash
# 1. Clonar repo
git clone https://github.com/AngheloBR/hyprland-dotfiles.git ~/hyprland-dotfiles
cd ~/hyprland-dotfiles

# 2. Instalar (funciona por SSH, sin GUI necesaria)
chmod +x install.sh
./install.sh

# 3. Reiniciar y entrar a Hyprland
reboot
# En la TTY:
Hyprland
```

## Keybinds principales

| Shortcut | Acción |
|----------|--------|
| `Super+T` | Terminal (Ghostty) |
| `Super+R` | App launcher (Rofi) |
| `Super+B` | Firefox |
| `Super+E` | File manager (Yazi) |
| `Super+Q` | Cerrar ventana |
| `Super+F` | Fullscreen |
| `Super+Shift+F` | Float/tile toggle |
| `Super+H/J/K/L` | Navegar foco |
| `Super+Shift+H/J/K/L` | Mover ventana |
| `Super+Ctrl+H/J/K/L` | Resize ventana |
| `Super+1-9` | Ir a workspace |
| `Super+Shift+1-9` | Mover ventana a workspace |
| `Super+V` | Clipboard history (cliphist) |
| `Print` | Screenshot pantalla completa |
| `Shift+Print` | Screenshot región |
| `Super+Shift+E` | Logout menu |

## Material You / Wallpaper

```bash
# Cambiar wallpaper y regenerar paleta de colores
material-you.sh ~/Pictures/wallpapers/mi-wallpaper.jpg
```

## Estructura

```
hyprland-dotfiles/
├── install.sh
├── hyprland/
│   ├── hyprland.conf
│   ├── hypridle.conf
│   └── hyprlock.conf
├── waybar/
│   ├── config.jsonc
│   └── style.css
├── rofi/
│   ├── config.rasi
│   └── themes/tokyo-night.rasi
├── ghostty/
│   └── config
├── mako/
│   └── config
├── gtk/
│   ├── gtk.css
│   └── settings.ini
└── scripts/
    ├── screenshot.sh
    └── material-you.sh
```

---

<div align="center">
<sub>by AngheloBR · CachyOS + Hyprland + Tokyo Night</sub>
</div>
