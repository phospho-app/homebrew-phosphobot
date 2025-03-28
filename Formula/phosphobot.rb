class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.106"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.106/phosphobot-0.2.106-arm64.bin"
      sha256 "52b21535ef7d7e371718130903f14b38840e6bdddf028b58aa39c6a8a30242e2"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.106/phosphobot-0.2.106-x86_64.bin"
      sha256 "ea5954ee40cc4ce0f6a661fe8ca7917876ea5e94276da7f93dbaf8ee5940b07e"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.106-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
