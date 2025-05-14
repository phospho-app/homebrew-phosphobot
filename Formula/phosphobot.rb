class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.212"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.212/phosphobot-0.2.212-arm64.bin"
      sha256 "51fc7e895907f02fb6aa5033311a419c340e7d9ec5c8c91934fa20d95b893fd7"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.212/phosphobot-0.2.212-x86_64.bin"
      sha256 "b3d30cbf02229fbdbdb38f9456013aeaf9c384c5a54f6ea87b90609d0b5711a4"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.212-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
