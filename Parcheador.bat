@echo off
chcp 65001 > nul
set "defaultPath=C:\Program Files (x86)\Steam\steamapps\common\Awaria\local"
echo ========================================
echo Instalador de parche en español
echo ========================================
echo La ruta por defecto es: "%defaultPath%"
set /p useDefault="¿Deseas usar esta ruta? (S/N): "
if /i "%useDefault%"=="S" (
    set "targetPath=%defaultPath%"
) else if /i "%useDefault%"=="N" (
    set /p targetPath="Introduce la ruta donde instalaste el juego: "
    echo Usando la ruta personalizada: "%targetPath%"
) else (
    echo ERROR: Opción no válida. Por favor, responde con "S" o "N".
    pause
    exit /b
)
if not exist "%targetPath%" (
    echo ERROR: La ruta especificada no existe: "%targetPath%"
    echo Verifica e intenta nuevamente.
    pause
    exit /b
)
set "patchPath=%~dp0parche"
if not exist "%patchPath%" (
    echo ERROR: No se encontraron los archivos del parche en: "%patchPath%"
    echo Asegúrate de que estén en la carpeta "parche" junto a este .bat.
    pause
    exit /b
)
echo Copiando archivos del parche...
xcopy /y /e "%patchPath%\*.json" "%targetPath%"
if errorlevel 1 (
    echo ERROR: Hubo un problema al copiar los archivos.
    pause
    exit /b
)
echo ========================================
echo El parche se instaló correctamente en: "%targetPath%"
pause
exit
