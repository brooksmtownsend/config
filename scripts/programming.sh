echo "~~~ Installing Rust ~~~"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env\n

echo "~~~ Installing ASDF for Erlang/Elixir ~~~"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1
echo ". $HOME/.asdf/asdf.sh" >> ~/.zshrc
. $HOME/.asdf/asdf.sh

echo "~~~ Installing Erlang ~~~"
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf install erlang 24.0.5
asdf global erlang 24.0.5

echo "~~~ Installing Elixir ~~~"
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install elixir 1.12.2-otp-24
asdf global elixir 1.12.2-otp-24

echo "~~~ Installing Docker (x86 only) ~~~"
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

echo "~~~ Installing NodeJS/NPM/Yarn ~~~"
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm i -g yarn

echo "~~~ Aliasing Python ~~~"
echo "alias python=python3" >> ~/.zshrc

echo "~~~ Installing programming tools ~~~"
cargo install alacritty
sudo sh -c "$(curl -fsSL https://starship.rs/install.sh)"
echo 'eval "$(starship init zsh)"' >> ~/.zshrc

