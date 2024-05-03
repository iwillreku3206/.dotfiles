#!/bin/bash

missing=()
warnings=()

check_dep() {
    if ! command -v $1 &> /dev/null
    then
	missing=("${foo[@]}" $1)
	return 0
    fi
    return 1
}

install_npm() {
	if check_dep "npm"
	then
		return 1
	fi
	npm install -g \
		dockerfile-language-server-nodejs \
		vscode-langservers-extracted \
		@astrojs/language-server \
		cssmodules-language-server \
		emmet-ls \
		graphql-language-service-cli \
		vscode-langservers-extracted \
		@fsouza/prettierd \
		prettier \
		@prisma/language-server \
		sql-language-server \
		svelte-language-server \
		@tailwindcss/language-server \
		typescript \
		typescript-language-server \
		vls \
		bash-language-server \
		vim-language-server \
		@ansible/ansible-language-server
}

install_go() {
	if check_dep "go"
	then
		return 1
	fi
	go install github.com/a-h/templ/cmd/templ@latest
	go install github.com/arduino/arduino-language-server@latest
	go install golang.org/x/tools/gopls@latest

}

install_composer() {
	if check_dep "composer"
	then
		return 1
	fi
	composer require phan/phan
}

install_pip() {
	if command -v pip3 &> /dev/null
	then
		PIP=pip3
	elif command -v pip &> /dev/null
	then
		PIP=pip
	else
		warnings=("${warnings[@]}" "Please install manually: pip")
		return
	fi
	$PIP install cmake-language-server \
		pyright
}

install_pkgman() {
	if [ $(uname) == "Darwin" ]
	then
	    if check_dep "brew"
	    then
		    return 1
	    fi
	fi

	if [ -f /etc/arch-release ]
	then
	    if check_dep "yay"
	    then
		    return 1
	    fi
	fi
	# If macOS
	if [ $(uname) == "Darwin" ]
	then
		brew tap omnisharp/omnisharp-roslyn
		brew update
		brew install \
			ltex-ls \
			texlab \
			llvm \
			rust-analyzer \
			jdtls \
			omnisharp-mono \
			lua-language-server \
      ansible-lint
		return
	fi

	# If Arch
	if [ -f /etc/arch-release ]
	then
		yay -Sy \
			ltex-ls-bin \
			texlab \
			clang \
			rust-analyzer \
			jdtls \
			omnisharp-roslyn-bin \
			lua-language-server \
      ansible-lint

		return
	fi

	# If Ubuntu/Debian
	if [ -f /etc/debian_version ]
	then
		sudo apt-get install clangd-12
		sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100
		warnings=("${warnings[@]}" "Please install manually: ltex-ls")
		warnings=("${warnings[@]}" "Please install manually: texlab")
		warnings=("${warnings[@]}" "Please install manually: rust-analyzer")
		warnings=("${warnings[@]}" "Please install manually: jdtls")
		warnings=("${warnings[@]}" "Please install manually: omnisharp-roslyn")
		warnings=("${warnings[@]}" "Please install manually: lua-language-server")
		return
	fi
	
	warnings=("${warnings[@]}" "Please install manually: dart")
	warnings=("${warnings[@]}" "Please install manually: godot")
}

if [ "$1" == "npm" ] || [ "$1" == "" ]
then
	install_npm
fi

if [ "$1" == "go" ] || [ "$1" == "" ]
then
	install_go
fi

if [ "$1" == "composer" ] || [ "$1" == "" ]
then
	install_composer
fi

if [ "$1" == "pip" ] || [ "$1" == "" ]
then
	install_pip
fi

if [ "$1" == "pkgman" ] || [ "$1" == "" ]
then
	install_pkgman
fi

for dep in "${missing[@]}"
do
	echo "Missing dependency: $dep"
done

for warning in "${warnings[@]}"
do
	echo "Warning: $warning"
done
