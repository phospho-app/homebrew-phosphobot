class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.17"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.17/phosphobot-0.3.17-arm64.bin"
      sha256 "8324f6e8e2d4d564356803a285cc178d6bcb02cd03761f099d1588ea2bbfa1b8"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.17/phosphobot-0.3.17-x86_64.bin"
      sha256 "5d9795161b34422b003ff85e146f62a25b16ccda2e3a2f56e761207826e8b7fa"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.17-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
