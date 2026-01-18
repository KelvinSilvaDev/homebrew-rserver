# Homebrew Formula para RSERVER
# Para usar: brew tap KelvinSilvaDev/rserver && brew install rserver

class Rserver < Formula
  desc "Remote Server Control - CLI multiplataforma para gerenciar serviços remotos"
  homepage "https://github.com/KelvinSilvaDev/rserver"
  url "https://github.com/KelvinSilvaDev/rserver/archive/v0.0.2.tar.gz"
  sha256 "15912b4f4acecd0b6cd2bab29bb7a98449f6c2a1965016185e2b6db3e92c8e3e"
  license "Apache-2.0"
  head "https://github.com/KelvinSilvaDev/rserver.git", branch: "main"

  depends_on "python@3.9"

  def install
    # A estrutura do release 0.0.2 está correta, não precisa de correções
    cd "cli" do
      system "python3", "-m", "pip", "install", "--prefix=#{prefix}", "."
    end
  end

  test do
    system "#{bin}/rserver", "--version"
  end
end
