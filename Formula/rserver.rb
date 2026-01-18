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
    # Instalar via pip do diretório cli
    cd "cli" do
      # O setup.py procura rsctl/ no diretório atual (cli/)
      # Garantir que o PYTHONPATH inclui o diretório cli
      ENV["PYTHONPATH"] = buildpath/"cli"
      system "python3", "-m", "pip", "install", "--prefix=#{prefix}", "."
    end
  end

  test do
    system "#{bin}/rserver", "--version"
  end
end
