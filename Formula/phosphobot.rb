class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.143"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.143/phosphobot-0.2.143-arm64.bin"
      sha256 "beb8ead813f3c26a5e229146ffc5d0ce139d26d1149b2957814263c27ecf04b9"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.143/phosphobot-0.2.143-x86_64.bin"
      sha256 "7648512df01738e049961b908f59f749fd4db2baf08caff53d530a652548784b"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.143-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
