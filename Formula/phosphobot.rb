class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.140"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.140/phosphobot-0.2.140-arm64.bin"
      sha256 "0a50cac03151801aba2fd84c6d8d4cc12411a8635900be53ab61377080d7f27e"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.140/phosphobot-0.2.140-x86_64.bin"
      sha256 "e6c31ac1891bc3e48b1742b0c81499168fc2f6745ee4a06983d7bbdd549eb439"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.140-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
