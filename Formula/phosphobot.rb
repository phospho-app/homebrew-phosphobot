class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.102"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.102/phosphobot-0.2.102-arm64.bin"
      sha256 "b12df5b814ba282a8688ff3e3da2b361882ce2d4a3979639dd7339d4593db687"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.102/phosphobot-0.2.102-x86_64.bin"
      sha256 "4abdee8f8a69cdc39aa5242ac1ada28d95a952c79c8f3c1d3da2e71948bf679d"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.102-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
