class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.10"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.10/phosphobot-0.3.10-arm64.bin"
      sha256 "78bd2432a6648355d305e5de23755bebc2b81a3d54e25bea28f23fed593a2006"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.10/phosphobot-0.3.10-x86_64.bin"
      sha256 "01a86a7ee555fb91a2dcebc374f964bdc5f4ef864ac409058c7279e13d250b10"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.10-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
