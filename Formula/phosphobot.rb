class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.113"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.113/phosphobot-0.3.113-arm64.bin"
      sha256 "fde3b18617d440f693880760329531dab8c0c8b2897aa1470e4df8d1ff48b60a"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.113/phosphobot-0.3.113-x86_64.bin"
      sha256 "5f6ae3c11ecd50f38b643bbc1ab58c18cd2419bf08cb90cf81894d788dd1a449"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.113-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
