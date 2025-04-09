class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.118"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.118/phosphobot-0.2.118-arm64.bin"
      sha256 "6dfa792982a5e3523c28faf560daeb517cd3318e006cc8c20d5e0216935d27ce"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.118/phosphobot-0.2.118-x86_64.bin"
      sha256 "6eaa8e6c6183aa08cb8f55dbd113b4beab3b6767e12cd6c89f9b823a925bd91c"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.118-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
