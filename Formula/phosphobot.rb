class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.126"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.126/phosphobot-0.2.126-arm64.bin"
      sha256 "89678aeb4d017de7261fbb303f346179a12cc22e9c3416718c13d49c1adfc6a1"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.126/phosphobot-0.2.126-x86_64.bin"
      sha256 "e8eeaccbf188ca3e80d53ba574f39e9c1f8d3897b71faf30748c4b026d19f49b"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.126-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
