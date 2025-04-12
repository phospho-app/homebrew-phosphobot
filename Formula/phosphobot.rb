class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.127"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.127/phosphobot-0.2.127-arm64.bin"
      sha256 "8d3b999634418f02d6549a97ee233272bfb1583cdb531c1e4fcc7ec4bfece81e"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.127/phosphobot-0.2.127-x86_64.bin"
      sha256 "3e28a7d8474f3f7edbd72e0ed20392c6b88d9d3c8610a84dac986e628a690030"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.127-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
