class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.14"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.14/phosphobot-0.3.14-arm64.bin"
      sha256 "00a28dfbf255785d4db88a40fed7874db9efdc528b9dc54f0c55b40b3530234d"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.14/phosphobot-0.3.14-x86_64.bin"
      sha256 "54d6fcfd4d8b9f2bc7ffcb01c6d7c6303243bd75586a5642d1af14e3120a9631"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.14-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
