class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.196"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.196/phosphobot-0.2.196-arm64.bin"
      sha256 "f585fdd996e0efe3b0a611dddf527fc7c5a5332dd307bf5c821a5c1193c86b66"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.196/phosphobot-0.2.196-x86_64.bin"
      sha256 "63122b816d9af96819908aebee0f64b6be61042a13d161c2c16d7e5e41c30713"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.196-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
