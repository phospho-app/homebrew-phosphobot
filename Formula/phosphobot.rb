class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.55"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.55/phosphobot-0.3.55-arm64.bin"
      sha256 "a453dbf68c1d1e8f0c39e26518d089fed880976006b0af306fffaf350cf9d747"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.55/phosphobot-0.3.55-x86_64.bin"
      sha256 "274ea802302c6817be56b50e089a85021da4fc99c314f1e5c93ffe93435cbc21"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.55-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
