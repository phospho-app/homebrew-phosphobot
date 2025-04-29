class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.183"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.183/phosphobot-0.2.183-arm64.bin"
      sha256 "ab2dc81bdc5dee7f0c8e80c975019432e6d06c078382c6f709b36a3c9c02bdef"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.183/phosphobot-0.2.183-x86_64.bin"
      sha256 "1cfd29d9580e2bf48fe374b60d7b6e6e1876e815ed0128b5eca0eeed7ea7251c"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.183-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
