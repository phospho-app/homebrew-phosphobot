class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.104"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.104/phosphobot-0.3.104-arm64.bin"
      sha256 "ec73e236fcbd27460ce0e256e7d2455113d43de732586a650a95f2904af7d251"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.104/phosphobot-0.3.104-x86_64.bin"
      sha256 "ca2081099614b8da333dc59d48ef80f370f6ede99efae94a991c1dfdc1eb289e"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.104-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
