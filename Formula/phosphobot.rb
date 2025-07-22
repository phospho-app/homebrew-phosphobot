class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.71"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.71/phosphobot-0.3.71-arm64.bin"
      sha256 "a1a3f79009fee36dada5b4db830e3a488e231e29be9a0c85dbb71a54c937b823"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.71/phosphobot-0.3.71-x86_64.bin"
      sha256 "7596beb7b0eff1612cc9e6d5d9527d7ab9b736abacb549698eb22bc5ecfd2eb5"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.71-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
