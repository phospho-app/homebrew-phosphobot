class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.132"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.132/phosphobot-0.2.132-arm64.bin"
      sha256 "ad2e2dde6dcdf6495e30dd8373217aa97f9f0dc457dea0e1027230f4a117df13"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.132/phosphobot-0.2.132-x86_64.bin"
      sha256 "c30cc7a03572b8a0088536515f4b6bce26aa391c2806b71a8ff51124ef7870a3"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.132-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
