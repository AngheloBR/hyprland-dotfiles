#!/bin/bash
# material-you.sh – Genera paleta de colores desde wallpaper
# Uso: material-you.sh /ruta/wallpaper.jpg
# Requiere: matugen

WALLPAPER="${1:-$HOME/Pictures/wallpapers/default.jpg}"

if [ ! -f "$WALLPAPER" ]; then
  echo "Error: Wallpaper no encontrado: $WALLPAPER"
  exit 1
fi

echo "[material-you] Generando paleta desde $WALLPAPER..."
matugen image "$WALLPAPER" --mode dark

# Cambiar wallpaper con swww (animación fade)
swww img "$WALLPAPER" \
  --transition-type fade \
  --transition-duration 1.5 \
  --transition-fps 60

echo "[material-you] Done ✓"
