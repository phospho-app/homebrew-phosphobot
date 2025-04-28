class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.179"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.179/phosphobot-0.2.179-arm64.bin"
      sha256 "c7f9964478b408293a1d422e3e62963464968a11847022cc71d2251809980fb8"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.179/phosphobot-0.2.179-x86_64.bin"
      sha256 "81ac0f65b645d80f851bbd3123ffc0cd9a5a5c5ebe127173757668ca1736acde"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.179-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
