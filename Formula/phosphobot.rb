class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.19"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.19/phosphobot-0.3.19-arm64.bin"
      sha256 "0dcb8a89867685233f4e3abbae8e43cebb8a63fb30d5ea155625e2c58c447eaf"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.19/phosphobot-0.3.19-x86_64.bin"
      sha256 "dcec930120bffa559c4cd687b860a6c8af4d5d119269a70eaa82ad41b22b7dd3"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.19-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
