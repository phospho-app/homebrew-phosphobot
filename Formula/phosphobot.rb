class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.160"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.160/phosphobot-0.2.160-arm64.bin"
      sha256 "d3c27e07bf7e34a76dc73b1a734ad9829b2d4b216aace81c38a171aab06e00ea"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.160/phosphobot-0.2.160-x86_64.bin"
      sha256 "c1e93b713711f1240eec114c77bc5a26421eeb631c174db9fa142115c5bba2b2"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.160-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
