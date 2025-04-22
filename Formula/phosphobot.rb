class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.161"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.161/phosphobot-0.2.161-arm64.bin"
      sha256 "c52083ff446f8b5e57359883c274b1d8f0bcaf0a81b3cc8bc2bb430c697c9a6f"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.161/phosphobot-0.2.161-x86_64.bin"
      sha256 "3c89b1326d58cf525a559cf3cf787ef7d06ec70fa2e46a5f2ffb59466d6258d8"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.161-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
