OLD_PWD=$PWD

mkdir -p ~/temp_font_install
cd ~/temp_font_install
git clone https://github.com/romkatv/powerlevel10k-media
cd powerlevel10k-media

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	if [[ "$(id -u)" == "0"* ]]; then
		mkdir -p /usr/local/share/fonts/MesloLGS\ NF
		cp ./*.ttf /usr/local/share/fonts/MesloLGS\ NF
	else
		mkdir -p ~/.fonts/MesloLGS\ NF
		cp ./*.ttf ~/.fonts/MesloLGS\ NF
	fi
	fc-cache
elif [[ "$OSTYPE" == "darwin"* ]]; then
	cp ./*.ttf ~/Library/Fonts
fi

cd $OLD_PWD
rm -rf ~/temp_font_install