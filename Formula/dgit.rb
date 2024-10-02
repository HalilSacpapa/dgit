class Dgit < Formula
  desc "Shell script to manage multiple git account with different ssh key"
  homepage "https://github.com/HalilSacpapa/dual_git"
  url "https://github.com/HalilSacpapa/homebrew-dual-git/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "2cd29f83e4cb83c28d2724308ce58ff4068f5537987003a6ea77ca2228f215c6"
  license "BSD-2-Clause"

  depends_on "bash"

  def install
    libexec.install "dual_git.sh" => "dgit"
    libexec.install "setup_dual_ssh.sh"
    libexec.install "setup_clone_ssh.sh"
    libexec.install "manage_repo_origin.sh"

    (bin/"dgit").write_env_script libexec/"dgit", {
      PATH: "#{libexec}:$PATH",
    }

    chmod 0755, libexec/"dgit"
    chmod 0755, libexec/"setup_dual_ssh.sh"
    chmod 0755, libexec/"setup_clone_ssh.sh"
    chmod 0755, libexec/"manage_repo_origin.sh"
  end

  test do
    system bin/"dgit", "--help"
  end
end
