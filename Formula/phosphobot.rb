class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.146"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.146/phosphobot-0.2.146-arm64.bin"
      sha256 "271288d73f73392ab5e6cd1310d1d59592f6a9297427304a94334120b1f6676f"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.146/phosphobot-0.2.146-x86_64.bin"
      sha256 "1f12a3cb0ece18b62eb531853678bc13f827c5b07fcdb37d6e18095ed7a5fbf0"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.146-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
