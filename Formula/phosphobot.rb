class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.122"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.122/phosphobot-0.2.122-arm64.bin"
      sha256 "085e5726be9dac777db2c22b88922f02a1f78a91f178cd93e9145033460b42b3"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.122/phosphobot-0.2.122-x86_64.bin"
      sha256 "a1cae05ce8e4b8386136227834ecfa3534745659f38e833f6e713a3d7ef8973a"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.122-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
