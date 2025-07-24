class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.76"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.76/phosphobot-0.3.76-arm64.bin"
      sha256 "b088e5a487a3b20c26c96b8678c20a5465b4c19a21f17ff7d2d6a2ca82fa7a21"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.76/phosphobot-0.3.76-x86_64.bin"
      sha256 "92a1e66df468ab1aa1c186ec757ecd87c0352682e2faf3f72aeddad37d10201f"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.76-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
