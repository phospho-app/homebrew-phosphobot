class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.114"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.114/phosphobot-0.3.114-arm64.bin"
      sha256 "aba7bd63ba41ab1d38350e27b8c8b569ffc9e5d9255f2b4b4c692315ed4011bd"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.114/phosphobot-0.3.114-x86_64.bin"
      sha256 "45dbdc86d5c74b7838b43439ee02f6186137ef535738e5ae57f6f0686964117b"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.114-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
