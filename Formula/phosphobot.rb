class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.87"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.87/phosphobot-0.3.87-arm64.bin"
      sha256 "10fbaa53bca2122158726529b2b35723be8acaed6c723631fa58c548d0408a27"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.87/phosphobot-0.3.87-x86_64.bin"
      sha256 "b359c71e1913404158be7ae9aef59c81fc0e87d11cc0c58ed4a6362fcc331a7a"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.87-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
