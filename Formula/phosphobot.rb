class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.66"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.66/phosphobot-0.3.66-arm64.bin"
      sha256 "54fefa6421408fb648ae2f091e604dca7f49f8c0123e54358d123c021737bb87"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.66/phosphobot-0.3.66-x86_64.bin"
      sha256 "a596127e48f3c3532c9ec24956cfde20967e5385bebf38b6ae2e4e48eb964388"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.66-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
