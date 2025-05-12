class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.209"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.209/phosphobot-0.2.209-arm64.bin"
      sha256 "135d557c00edfee5a10f964ceebf0b099aec3155f0c908bc1849c86313e59021"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.209/phosphobot-0.2.209-x86_64.bin"
      sha256 "310b3cbcab56bcd7f8cc615d151b09e8572629e436c46a94cfc516c7dcbf935e"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.209-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
