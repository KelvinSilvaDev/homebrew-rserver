# 📝 Como Criar o Repositório homebrew-rserver

Este guia explica passo a passo como criar o repositório Homebrew Tap no GitHub.

## 🎯 O que é um Homebrew Tap?

Um Tap é um repositório público no GitHub que contém fórmulas (receitas) do Homebrew. É como um repositório de pacotes personalizado.

## ✅ Passo a Passo

### 1. Criar Repositório no GitHub

1. Acesse: https://github.com/new
2. **Repository name**: `homebrew-rserver` (IMPORTANTE: deve começar com `homebrew-`)
3. **Description**: "Homebrew tap for RSERVER - Remote Server Control CLI"
4. **Visibility**: Public (deve ser público)
5. **NÃO** marque "Add a README file" (vamos fazer isso depois)
6. Clique em **Create repository**

### 2. Clonar e Configurar Localmente

```bash
# Clonar o repositório (vazio)
git clone git@github.com:KelvinSilvaDev/homebrew-rserver.git
cd homebrew-rserver

# Copiar arquivos deste diretório
# (Os arquivos já estão prontos em: rserver/homebrew-rserver/)
```

### 3. Copiar Arquivos

Os arquivos já estão prontos! Você só precisa copiá-los:

```bash
# Se você está no diretório rserver/
cp -r homebrew-rserver/* /caminho/para/homebrew-rserver/

# Ou se você já clonou o repositório:
cd /caminho/para/homebrew-rserver
# Copie os arquivos:
# - Formula/rserver.rb
# - README.md
# - .gitignore
```

### 4. Calcular SHA256 (Primeira Vez)

Antes do primeiro commit, você precisa calcular o SHA256 do release:

```bash
VERSION="1.0.0"
URL="https://github.com/KelvinSilvaDev/rserver/archive/v${VERSION}.tar.gz"
SHA=$(curl -sL "$URL" | shasum -a 256 | cut -d' ' -f1)
echo "SHA256: $SHA"
```

Depois, edite `Formula/rserver.rb` e substitua `CALCULE_O_HASH_AQUI` pelo SHA calculado.

### 5. Commit e Push

```bash
cd homebrew-rserver
git add .
git commit -m "Initial commit: Add rserver formula"
git branch -M main
git push -u origin main
```

### 6. Testar Instalação

```bash
# Testar o tap
brew tap KelvinSilvaDev/rserver

# Verificar se a fórmula está disponível
brew info rserver

# Instalar (teste)
brew install rserver

# Verificar se funciona
rserver --version
```

## 🔄 Atualizações Futuras

Depois da primeira vez, as atualizações serão automáticas via GitHub Actions! O workflow `.github/workflows/homebrew.yml` no repositório principal atualizará este tap automaticamente quando você criar uma nova release.

## ❓ Perguntas Frequentes

### Preciso fazer fork de algo?

**Não!** É um repositório completamente novo e vazio. Você só precisa criar do zero.

### Pode ser todo em branco?

**Sim!** Você pode criar o repositório vazio e depois adicionar os arquivos. Os arquivos mínimos necessários são:
- `Formula/rserver.rb` (obrigatório)
- `README.md` (recomendado, mas opcional)

### Qual a estrutura necessária?

```
homebrew-rserver/
├── Formula/
│   └── rserver.rb    # Fórmula do Homebrew
├── README.md         # Documentação (opcional)
└── .gitignore        # Git ignore (opcional)
```

### O nome precisa ser exatamente "homebrew-rserver"?

**Sim!** O Homebrew espera que taps sigam o padrão `homebrew-*`. Se você usar outro nome, os usuários precisarão especificar o caminho completo.

## 🎉 Pronto!

Depois de seguir estes passos, seu tap estará funcionando e os usuários poderão instalar o RSERVER com:

```bash
brew tap KelvinSilvaDev/rserver
brew install rserver
```
