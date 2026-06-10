# Comandos exactos para ejecutar por SSH

## Paso 1 – Crear repo en GitHub
Crea el repo vacío en: https://github.com/new
Nombre: hyprland-dotfiles (público, sin README)

## Paso 2 – En tu máquina LOCAL (donde tienes el repo clonado)
# Nada, Claude ya creó los archivos, tú solo los subes desde aquí.

## Paso 3 – En la VM por SSH (copiar y pegar)

### Primero clona el repo cuando lo subas a GitHub:
git clone https://github.com/AngheloBR/hyprland-dotfiles.git ~/hyprland-dotfiles
cd ~/hyprland-dotfiles
chmod +x install.sh
./install.sh

### Si quieres probar Hyprland sin reboot (desde TTY en la VM):
Hyprland

## Post-instalación (ya dentro de Hyprland):
# Cambiar wallpaper + Material You:
material-you.sh ~/Pictures/wallpapers/tu-wallpaper.jpg
