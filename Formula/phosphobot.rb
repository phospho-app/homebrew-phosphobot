class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.192"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.192/phosphobot-0.2.192-arm64.bin"
      sha256 "29584df0c37b435ca66c8097e3bfc73f779546b6b9cc325b77e03298532d2e6b"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.192/phosphobot-0.2.192-x86_64.bin"
      sha256 "0e5854283fc9433d93239396453500293575072a5b164aeb9d17d076ac67b577"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.192-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
