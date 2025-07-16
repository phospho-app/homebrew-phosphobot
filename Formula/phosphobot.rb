class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.61"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.61/phosphobot-0.3.61-arm64.bin"
      sha256 "30e1f16c191616f558774bf193bde38a6d5e4c6cf56619609105019feac7cc92"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.61/phosphobot-0.3.61-x86_64.bin"
      sha256 "dbd60477d4ab5717a6a33779ae7a9b625d27f588507cac07ad62f8c8a8c8bb9c"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.61-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
