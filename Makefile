# ===================================================================
# ATENÇÃO:
#  Este Makefile deve ser executado DENTRO do Dev Container
#  Não funcionará no sistema host - use VS Code Remote-Containers
#
# Comandos principais:
#  make setup   - Prepara o ambiente para desenvolvimento
#  make serve   - Inicia o servidor de desenvolvimento
#  make check   - Verifica a configuração atual
# ===================================================================

# Inicializa o ambiente completo
setup:
	@echo "🚀 Iniciando configuração do ambiente..."
	hugo mod tidy
	hugo mod vendor
	@echo "✅ Ambiente configurado com sucesso!"

# Executa o servidor de desenvolvimento
serve:
	@echo "🌍 Iniciando servidor Hugo..."
	hugo server -D --bind 0.0.0.0 --port 1313 --disableFastRender

# Gera a versão de produção
build:
	@echo "📦 Gerando versão de produção..."
	hugo --minify

# Atualiza dependências do tema
vendor:
	@echo "📦 Atualizando dependências do tema..."
	hugo mod vendor

# Organiza módulos
tidy:
	@echo "🧹 Limpando e organizando módulos..."
	hugo mod tidy

# Verifica configuração básica
check:
	@echo "✅ Hugo está instalado:"
	hugo version
	@echo "\n📦 Estrutura de módulos:"
	hugo mod graph
	@echo "\n📁 Estrutura de conteúdo:"
	find content -maxdepth 2 -type d | sed 's/^/   /'