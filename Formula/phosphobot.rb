class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.152"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.152/phosphobot-0.2.152-arm64.bin"
      sha256 "5639b81234c85803f09095814c2f24b4729d1593a41d9046996d4146a84a3914"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.152/phosphobot-0.2.152-x86_64.bin"
      sha256 "114928f8decff0d9c13d72b7472634e770743010abd552230ee810fef72651fd"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.152-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
