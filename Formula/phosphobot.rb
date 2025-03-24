class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.99"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.99/phosphobot-0.2.99-arm64.bin"
      sha256 "fc4e3165711513d215788df286cf6b46cfa8a08a062442e2f4eb54d3ab8bb3e5"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.99/phosphobot-0.2.99-x86_64.bin"
      sha256 "128a48abda20bcd63adb6a8599ff4f9e5d50f4d00b8b3ee423415a7dd01ca901"
    end
  end
  
  def install
    bin_name = Hardware::CPU.arm? ? "phosphobot-/home/runner/work/_temp/eea897d3-debc-4168-a760-c76383608bbc.sh.2.99-arm64.bin" : "phosphobot-/home/runner/work/_temp/eea897d3-debc-4168-a760-c76383608bbc.sh.2.99-x86_64.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
