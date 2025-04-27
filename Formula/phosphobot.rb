class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.174"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.174/phosphobot-0.2.174-arm64.bin"
      sha256 "ce05590098939bc547d1fa563998d76e748bc287bc119a6fce80cbb15e5daeb0"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.174/phosphobot-0.2.174-x86_64.bin"
      sha256 "3199ca4a1897e15d4abddf0fc3d047ffc52947b716729be34559920571e7aecb"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.174-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
