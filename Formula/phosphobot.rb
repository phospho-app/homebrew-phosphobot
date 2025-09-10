class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.117"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.117/phosphobot-0.3.117-arm64.bin"
      sha256 "b7173a612d6b9ee23ff9b45690510dd426176b1998258425acc1287249980ff2"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.117/phosphobot-0.3.117-x86_64.bin"
      sha256 "407185b54e7cb85f7a44c7361ee1f14265a43368ad834773d904f21375088a40"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.117-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
