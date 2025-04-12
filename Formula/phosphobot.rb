class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.128"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.128/phosphobot-0.2.128-arm64.bin"
      sha256 "dd403145ad45ef407b6ea3e3dee03ce73358f623917f7c68bc95be657bb3a12f"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.128/phosphobot-0.2.128-x86_64.bin"
      sha256 "2eac1f163d8f512ecfdcc4ddc8961ca4db78896ce3cb8f3448e3c4747c829fad"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.128-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
