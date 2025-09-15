class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.121"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.121/phosphobot-0.3.121-arm64.bin"
      sha256 "028a0277df2a441e803a832d6c4730e3c5b0a5002ebf718ff126a3b1aa2a5f86"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.121/phosphobot-0.3.121-x86_64.bin"
      sha256 "3f4df5cf6316c5b775b53eec80db4f2a3013f31e7cf0539fcd5f4c6c4f37faa1"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.121-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
