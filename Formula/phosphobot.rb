class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.103"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.103/phosphobot-0.2.103-arm64.bin"
      sha256 "7ca01f3e69203822c7c9db470cfd5c5930a88eef0c6a3b93992fca1dfe3480e7"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.103/phosphobot-0.2.103-x86_64.bin"
      sha256 "de9fbaa193bf932b480a5bc6c4ab2134b9761f08c6469fbce9970dc248b99bd7"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.103-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
