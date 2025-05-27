class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.21"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.21/phosphobot-0.3.21-arm64.bin"
      sha256 "0b4be09b2e936cf3b47c6129b34851b406a058662a1467e269bc9cbe4032c635"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.21/phosphobot-0.3.21-x86_64.bin"
      sha256 "13b96a9c1e29f7cac64640fc1362ff9eac68d9e208c89451beaf7470df4be73a"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.21-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
