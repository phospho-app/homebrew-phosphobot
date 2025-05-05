class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.199"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.199/phosphobot-0.2.199-arm64.bin"
      sha256 "59520323217d76e81d0b38dd797a530ad5ea723631ae0e9fa0b97af0df71af37"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.199/phosphobot-0.2.199-x86_64.bin"
      sha256 "ee2dc7e97fcd6b554727478b88afb9df96fca2cacaecd18249f8c701f0400b9c"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.199-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
