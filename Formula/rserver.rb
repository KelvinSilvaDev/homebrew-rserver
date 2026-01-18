# Homebrew Formula para RSERVER
# Para usar: brew tap KelvinSilvaDev/rserver && brew install rserver

class Rserver < Formula
  desc "Remote Server Control - CLI multiplataforma para gerenciar serviços remotos"
  homepage "https://github.com/KelvinSilvaDev/rserver"
  url "https://github.com/KelvinSilvaDev/rserver/archive/0.0.1.tar.gz"
  sha256 "45d92546765d937b9cdee55408fd765bc2831a0ca19fe808cdcfd3eac5017d80"
  license "Apache-2.0"
  head "https://github.com/KelvinSilvaDev/rserver.git", branch: "main"

  depends_on "python@3.9"

  def install
    # O release 0.0.1 tem setup.py quebrado: procura rsctl mas estrutura é src/cli, src/core, etc
    cd "cli" do
      # Corrigir entry point: rsctl.cli.commands -> cli.cli.commands (porque package_dir mapeia "" para "src")
      # Mas na verdade, com package_dir={"": "src"}, o import seria direto
      # Vamos usar a estrutura correta: cli está em src/cli, então entry point deve ser cli.cli.commands
      inreplace "setup.py", 'rserver=rsctl.cli.commands:main', 'rserver=cli.cli.commands:main'
      # Remover package_data que referencia rsctl inexistente
      inreplace "setup.py", /"rsctl":\s*\[.*?\],/, ''
      system "python3", "-m", "pip", "install", "--prefix=#{prefix}", "."
    end
  end

  test do
    system "#{bin}/rserver", "--version"
  end
end
