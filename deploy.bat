@echo off
setlocal
cd /d "%~dp0"

echo ============================================
echo   DEPLOY -- Metodo Dermo Strit -- Vercel
echo ============================================
echo.

where node >nul 2>nul
if errorlevel 1 (
  echo [ERRO] Node.js nao encontrado.
  echo Instale em: https://nodejs.org  (versao LTS)
  echo Depois rode este script de novo.
  pause
  exit /b 1
)

where vercel >nul 2>nul
if errorlevel 1 (
  echo Vercel CLI nao encontrado. Instalando...
  call npm install -g vercel
  if errorlevel 1 (
    echo [ERRO] Falha ao instalar Vercel CLI.
    pause
    exit /b 1
  )
)

echo.
echo ^> Iniciando deploy em PRODUCAO...
echo ^> Se for a primeira vez, o navegador vai abrir para login.
echo.
call vercel --prod

echo.
echo ============================================
echo Deploy finalizado. Copie a URL acima.
echo ============================================
pause
endlocal
