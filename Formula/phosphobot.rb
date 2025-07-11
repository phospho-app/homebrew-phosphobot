class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.56"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.56/phosphobot-0.3.56-arm64.bin"
      sha256 "783e2b555332da2ff3e270334e1ee7f3c7e68173c34f941725a9a09a93f1a918"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.56/phosphobot-0.3.56-x86_64.bin"
      sha256 "17483af4ca04e2116b2c64466123b75d74391cb0b6441c660decb69ddc7b8533"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.56-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
