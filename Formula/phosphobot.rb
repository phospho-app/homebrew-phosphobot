class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.112"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.112/phosphobot-0.2.112-arm64.bin"
      sha256 "ce49376e9d29952697c6ce6cebf6493abd0f03313a37217b5725ff8be1a0b259"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.112/phosphobot-0.2.112-x86_64.bin"
      sha256 "a879f53f2c2548a3a9ca3370d0c993b409776556f7534969982a95184484bf24"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.112-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
