class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.50"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.50/phosphobot-0.3.50-arm64.bin"
      sha256 "fbae9c8219586d7aba35c3827876c6459bc8a4256adc2aee28be89ad374c2dde"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.50/phosphobot-0.3.50-x86_64.bin"
      sha256 "a74c8dcba8d5e857ea65d18e1faf3d1396a90c791ff8d7e13d8f5b0f67795e0e"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.50-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
