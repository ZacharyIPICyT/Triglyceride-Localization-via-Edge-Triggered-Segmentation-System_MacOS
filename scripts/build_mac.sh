#!/bin/bash

# Script para construir ejecutable en macOS
echo "Construyendo ejecutable para macOS..."

# Crear entorno virtual
python3 -m venv venv_mac
source venv_mac/bin/activate

# Instalar dependencias
pip install --upgrade pip
pip install -r requirements.txt
pip install pyinstaller

# Crear directorio para el build
mkdir -p dist/mac

# Construir con PyInstaller
pyinstaller --name="LipidosAnalyzer" \
            --windowed \
            --onefile \
            --add-data="src:src" \
            --icon="assets/icon.icns" \
            --clean \
            --noconfirm \
            --hidden-import="matplotlib.backends.backend_agg" \
            --hidden-import="cv2" \
            --hidden-import="PIL" \
            --collect-all="cv2" \
            --collect-all="matplotlib" \
            src/main.py

# Mover a directorio final
mv dist/LipidosAnalyzer dist/mac/

echo "✅ Ejecutable creado en: dist/mac/Triglyceride Localization via Edge-Triggered Segmentation System"
echo "📦 Tamaño del ejecutable: $(du -h dist/mac/LipidosAnalyzer | cut -f1)"

# Crear DMG (opcional)
echo "Creando DMG..."
hdiutil create -volname "Lipidos Analyzer" \
              -srcfolder dist/mac/ \
              -ov -format UDZO \
              dist/LipidosAnalyzer.dmg

echo "✅ DMG creado en: dist/Triglyceride Localization via Edge-Triggered Segmentation System.dmg"

deactivate
