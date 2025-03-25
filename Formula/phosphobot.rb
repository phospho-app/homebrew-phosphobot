class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.102"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.102/phosphobot-0.2.102-arm64.bin"
      sha256 "019c9a12958ef16c994177c22e01afc19dea96523322fa58880080387ad4be4e"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.102/phosphobot-0.2.102-x86_64.bin"
      sha256 "f9aedc3827735e208393352e247cbca84fd611b4bce2e6e0c921a6b8692a39ab"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.102-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
