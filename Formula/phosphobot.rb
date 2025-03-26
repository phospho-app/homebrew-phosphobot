class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.104"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.104/phosphobot-0.2.104-arm64.bin"
      sha256 "ed35092998c3472b14b8d2fd197b3bbafe3e8182e7638256af7e517a5250015e"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.104/phosphobot-0.2.104-x86_64.bin"
      sha256 "ef07fbfbf0ca89874832feb8c4a5d6bdf37e06096171b25e33163e020938b331"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.104-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
