class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.132"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.132/phosphobot-0.3.132-arm64.bin"
      sha256 "3901bcd719ffef07587275fc87d86aa9bfe2251931313a012505dc8fc34f7562"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.132/phosphobot-0.3.132-x86_64.bin"
      sha256 "cb94a211410c8147f643595a17be93035428751a10336afed6ef241dc8c97b71"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.132-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
