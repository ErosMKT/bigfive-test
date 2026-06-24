#!/bin/bash

# Script de Sincronização - Big Five Test e Big Five Flash
# Garante que os arquivos de fácil acesso na raiz e os arquivos de deploy estejam sempre sincronizados.

# Diretório base
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$BASE_DIR"

# 1. Sincronizar Versão Normal
if [ "index_normal.html" -nt "index.html" ]; then
    echo "🔄 index_normal.html é mais recente. Copiando para index.html..."
    cp -p index_normal.html index.html
elif [ "index.html" -nt "index_normal.html" ]; then
    echo "🔄 index.html é mais recente. Copiando para index_normal.html..."
    cp -p index.html index_normal.html
else
    echo "✓ Versão Normal já está sincronizada."
fi

# 2. Sincronizar Versão Flash
# Garante que a pasta flash existe
mkdir -p flash

if [ "index_flash.html" -nt "flash/index.html" ]; then
    echo "🔄 index_flash.html é mais recente. Copiando para flash/index.html..."
    cp -p index_flash.html flash/index.html
elif [ "flash/index.html" -nt "index_flash.html" ]; then
    echo "🔄 flash/index.html é mais recente. Copiando para index_flash.html..."
    cp -p flash/index.html index_flash.html
else
    echo "✓ Versão Flash já está sincronizada."
fi
