class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.126"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.126/phosphobot-0.3.126-arm64.bin"
      sha256 "d2ef821a328c646348dfef59196033ede0d953a8a8cb0711a53d4e48a4649e31"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.126/phosphobot-0.3.126-x86_64.bin"
      sha256 "d32e924caaa607e0a513d18361dee62348ef04568db720978ee0387b8b27a38c"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.126-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
