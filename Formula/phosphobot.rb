class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.37"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.37/phosphobot-0.3.37-arm64.bin"
      sha256 "e05c9146c7258ed35edf5467303f3f04f9729e56306bccfcfff2b1e82f5c7e86"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.37/phosphobot-0.3.37-x86_64.bin"
      sha256 "2174c72fe007be72a942a5b1a5c7f2014b11e896f50d7b495bd9921195dcbcde"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.37-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
