class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.173"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.173/phosphobot-0.2.173-arm64.bin"
      sha256 "565a8d2d7695a3b95f8922c4ad332450c1626806473ca966c06c0a4ec5637cc4"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.173/phosphobot-0.2.173-x86_64.bin"
      sha256 "86438ff904111e76d6e52fa48a10b6e05fcb27df491a8a8abb2a3f5d8c02d59d"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.173-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
