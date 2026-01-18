#!/bin/bash
# Script para configurar o repositório homebrew-rserver

set -e

VERSION="${1:-1.0.0}"
REPO_NAME="homebrew-rserver"
GITHUB_USER="KelvinSilvaDev"

echo "🍺 Configurando Homebrew Tap para RSERVER"
echo ""

# Calcular SHA256
echo "📦 Calculando SHA256 para versão v${VERSION}..."
URL="https://github.com/${GITHUB_USER}/rserver/archive/v${VERSION}.tar.gz"
SHA=$(curl -sL "$URL" | shasum -a 256 | cut -d' ' -f1)

if [ -z "$SHA" ]; then
    echo "❌ Erro: Não foi possível calcular SHA256. Verifique se a versão ${VERSION} existe."
    exit 1
fi

echo "✅ SHA256: $SHA"
echo ""

# Atualizar formula
echo "📝 Atualizando Formula/rserver.rb..."
sed -i.bak "s|url \".*\"|url \"https://github.com/${GITHUB_USER}/rserver/archive/v${VERSION}.tar.gz\"|" Formula/rserver.rb
sed -i.bak "s|sha256 \".*\"|sha256 \"${SHA}\"|" Formula/rserver.rb
rm -f Formula/rserver.rb.bak

echo "✅ Formula atualizada!"
echo ""
echo "📋 Próximos passos:"
echo ""
echo "1. Criar repositório no GitHub:"
echo "   https://github.com/new"
echo "   Nome: ${REPO_NAME}"
echo "   Público: Sim"
echo "   NÃO adicione README, .gitignore ou licença"
echo ""
echo "2. Inicializar e fazer push:"
echo "   git init"
echo "   git add ."
echo "   git commit -m 'Initial commit: Add rserver formula'"
echo "   git branch -M main"
echo "   git remote add origin git@github.com:${GITHUB_USER}/${REPO_NAME}.git"
echo "   git push -u origin main"
echo ""
echo "3. Testar:"
echo "   brew tap ${GITHUB_USER}/rserver"
echo "   brew install rserver"
echo ""
