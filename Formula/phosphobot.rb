class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.20"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.20/phosphobot-0.3.20-arm64.bin"
      sha256 "994b39be66ca3717d673f981c76d227a314b2419b555fdf98026137845344129"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.20/phosphobot-0.3.20-x86_64.bin"
      sha256 "d659c43d7087a5d5f7911ec368c4bc6c8300a0d1cee4794f2f47c3b0dd8fe9cd"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.20-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
