class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.89/phosphobot-arm64.bin"
      sha256 "530d6b2f7edae1584a1105e23b929d265bf0e4016e5447057e318a163e02c35e"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.89/phosphobot-x86_64.bin"
      sha256 "2163211a956fbb41141df5fd2b84204eda3bfa6e8f00c1d781187d376e7dcbe6"
    end
  end
  
  def install
    bin_name = Hardware::CPU.arm? ? "phosphobot-arm64.bin" : "phosphobot-x86_64.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
