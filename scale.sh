#!/bin/bash
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# --- Шаг 1: DPI (читаем из системы или ставим 144 по умолчанию) ---
dpi=$(xfconf-query -c xsettings -p /Xft/DPI 2>/dev/null || echo 144)
while true; do
    clear
    echo "================================================="
    echo " Настройка: Масштаб шрифтов (DPI)"
    echo "================================================="
    echo " Текущее значение: --> [ $dpi ] <--"
    echo ""
    echo " [w] Увеличить (+12) и применить сразу"
    echo " [s] Уменьшить (-12) и применить сразу"
    echo " [Enter] Сохранить и перейти далее"
    echo "================================================="
    
    read -p "Сделайте выбор (w/s/Enter): " choice
    choice=$(echo "$choice" | tr -d '\r\n ')

    if [ "$choice" = "w" ] || [ "$choice" = "W" ]; then
        dpi=$((dpi + 12))
        xfconf-query -c xsettings -p /Xft/DPI -n -t int -s "$dpi"
    elif [ "$choice" = "s" ] || [ "$choice" = "S" ]; then
        dpi=$((dpi - 12))
        xfconf-query -c xsettings -p /Xft/DPI -n -t int -s "$dpi"
    elif [ -z "$choice" ]; then
        break
    fi
done

# --- Шаг 2: Панель (читаем из системы или ставим 38 по умолчанию) ---
panel=$(xfconf-query -c xfce4-panel -p /panels/panel-1/size 2>/dev/null || echo 38)
while true; do
    clear
    echo "================================================="
    echo " Настройка: Высота верхней панели"
    echo "================================================="
    echo " Текущее значение: --> [ $panel ] <--"
    echo ""
    echo " [w] Увеличить (+2) и применить сразу"
    echo " [s] Уменьшить (-2) и применить сразу"
    echo " [Enter] Сохранить и перейти далее"
    echo "================================================="
    
    read -p "Сделайте выбор (w/s/Enter): " choice
    choice=$(echo "$choice" | tr -d '\r\n ')

    if [ "$choice" = "w" ] || [ "$choice" = "W" ]; then
        panel=$((panel + 2))
        xfconf-query -c xfce4-panel -p /panels/panel-1/size -n -t int -s "$panel"
    elif [ "$choice" = "s" ] || [ "$choice" = "S" ]; then
        panel=$((panel - 2))
        xfconf-query -c xfce4-panel -p /panels/panel-1/size -n -t int -s "$panel"
    elif [ -z "$choice" ]; then
        break
    fi
done

# --- Шаг 3: Иконки (читаем из системы или ставим 64 по умолчанию) ---
icons=$(xfconf-query -c xfce4-desktop -p /desktop-icons/icon-size 2>/dev/null || echo 64)
while true; do
    clear
    echo "================================================="
    echo " Настройка: Размер значков на рабочем столе"
    echo "================================================="
    echo " Текущее значение: --> [ $icons ] <--"
    echo ""
    echo " [w] Увеличить (+4) и применить сразу"
    echo " [s] Уменьшить (-4) и применить сразу"
    echo " [Enter] Сохранить и перейти далее"
    echo "================================================="
    
    read -p "Сделайте выбор (w/s/Enter): " choice
    choice=$(echo "$choice" | tr -d '\r\n ')

    if [ "$choice" = "w" ] || [ "$choice" = "W" ]; then
        icons=$((icons + 4))
        xfconf-query -c xfce4-desktop -p /desktop-icons/icon-size -n -t int -s "$icons"
    elif [ "$choice" = "s" ] || [ "$choice" = "S" ]; then
        icons=$((icons - 4))
        xfconf-query -c xfce4-desktop -p /desktop-icons/icon-size -n -t int -s "$icons"
    elif [ -z "$choice" ]; then
        break
    fi
done

clear
echo "Готово! Финальные параметры:"
echo "DPI: $dpi | Панель: $panel | Иконки: $icons"
