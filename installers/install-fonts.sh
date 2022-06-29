git clone https://github.com/romkatv/powerlevel10k-media
cd powerlevel10k-media

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	mkdir -p /usr/local/share/font/MesloLGS\ NF
	cp ./*.ttf /usr/local/share/font/MesloLGS\ NF
	fc-cachehe
elif [[ "$OSTYPE" == "darwin"* ]]; then
	cp ./*.ttf ~/Library/Fonts
fi