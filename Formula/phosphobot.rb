class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.22"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.22/phosphobot-0.3.22-arm64.bin"
      sha256 "c6903b2631591665e4fb7459a8572f897236203b261adef3a64bef4be3681186"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.22/phosphobot-0.3.22-x86_64.bin"
      sha256 "d6c055522f58469d6137de673063d783dba717641ef469b1213a76fcb36b822c"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.22-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
