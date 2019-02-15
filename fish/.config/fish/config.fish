#
#       My Fish Shell Config
# -----------------------------------

## let me get my stuff
[ -f ~/.config/fish/aliases.fish ]; and source ~/.config/fish/aliases.fish
#. ~/.config/fish/security.fish
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

## let's setup path variable
set --universal FONTCONFIG_PATH /etc/fonts/

set -U fish_prompt_pwd_dir_length 3

# ??? to blame
if status --is-interactive
	tmux ^ /dev/null; and exec true
end

# systems update
if test (uname) = Darwin
	abbr -a -U p echo "what r you tring to do?"
	abbr -a -U up brew update
	abbr -a -U update brew update
	abbr -a -U upgrade brew upgrade
	abbr -a -U o open
else
	if [ -e /usr/bin/apt ]
		# ubuntu systems
		set -U fish_user_abbreviations $fish_user_abbreviations 'p=sudo apt'
		set -U fish_user_abbreviations $fish_user_abbreviations 'up=sudo apt update; and sudo apt list --upgradable'

		#set -U fish_user_abbreviations $fish_user_abbreviations 'o=xdg-open'
		function upgrade
			echo (pass x1c/jethros) | sudo -S apt -y upgrade
end
else if [ -e /usr/bin/yaourt ]
	# arch systems w/ yaourt
	set -U fish_user_abbreviations $fish_user_abbreviations 'p=yaourt'
	#complete --command yaourt --wraps pacman

	set -U fish_user_abbreviations $fish_user_abbreviations 'up=yaourt -Syu --aur'
else if [ -e /usr/bin/pacman]
	# native arch systems
	set -U fish_user_abbreviations $fish_user_abbreviations 'p=sudo pacman'
	#set -U fish_user_abbreviations $fish_user_abbreviations 'up=sudo pacman -Syu'
else if [ -e /usr/bin/pacaur ]
	# arch systems w/ pacaur
	#complete --command pacaur --wraps pacman
	set -U fish_user_abbreviations $fish_user_abbreviations 'p=pacaur'
	set -U fish_user_abbreviations $fish_user_abbreviations 'up=pacaur -Syu'
else
	echo "you are not running a recognizable system!"
end
end

if [ -e ~/.cargo/bin/exa ]
	abbr -a -U ls exa
	abbr -a -U ll exa -l
	abbr -a -U lll exa -la
else
	set -U fish_user_abbreviations $fish_user_abbreviations 'l=ls'
	set -U fish_user_abbreviations $fish_user_abbreviations 'll=ls -l'
	set -U fish_user_abbreviations $fish_user_abbreviations 'lll=ls -la'
end

# Load fishmarks (http://github.com/techwizrd/fishmarks)
if [ -e $HOME/.fishmarks/marks.fish ]; and status --is-interactive
	. $HOME/.fishmarks/marks.fish
end

## fzf
#if [ -e $HOME/.fzf/shell/key-bindings.fish ]; and status --is-interactive
if [ -e $HOME/.fzf/shell/key-bindings.fish ]
	. $HOME/.fzf/shell/key-bindings.fish
end

set FORTUNES computers debian linux magic
set FORTUNES futurama hitchhiker $FORTUNES
set FORTUNES firefly calvin perl $FORTUNES
set FORTUNES science wisdom miscellaneous $FORTUNES
set FORTUNES off/atheism off/debian off/linux off/privates $FORTUNES
set FORTUNES off/religion off/vulgarity $FORTUNES

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'

if test (uname) = Darwin
	## PATH variables
	set PATH /usr/local/bin/ $PATH
	set PATH $PATH /Applications/MATLAB_R2018b.app/bin
	set PATH $PATH ~/bin
	set PATH $PATH $HOME/.cargo/bin
else
	## PATH variables
	set PATH /usr/local/bin/ $PATH
	set PATH $PATH ~/bin
	set PATH $PATH ~/.local/bin
	#set PATH $PATH ~/.local/share/umake/rust/rust-lang/rustc/bin
	set PATH $PATH ~/.cargo/bin
	set PATH $PATH /home/linuxbrew/.linuxbrew/bin
	set PATH $PATH $NPM_PACKAGES/bin
	set PATH $PATH ~/.local/share/umake/bin
	set PATH $PATH ~/dev/r/bin


end

## Other PATH variables
#setenv GOPATH "$HOME/dev/r:$HOME/dev/projects/cuckood:$HOME/dev/projects/hasmail"

## Variables setting
setenv EDITOR nvim
setenv BROWSER firefox-developer-edition
setenv EMAIL sun.shuw@northeastern.edu
setenv NAME "Jethro S. Sun"
setenv GOPATH "$HOME/dev/r"
setenv RUST_BACKTRACE 1
setenv CARGO_INCREMENTAL 1
setenv RUSTFLAGS "-C target-cpu=native"
setenv WINEDEBUG fixme-all
setenv FZF_DEFAULT_OPTS '--height 20%'
if test -e ~/data/cargo-target
	setenv CARGO_TARGET_DIR ~/data/cargo-target
end
set PATH $PATH ~/.cargo/bin

if test (uname) = Darwin
	#setenv FZF_DEFAULT_COMMAND 'ag -g ""'
	#setenv FZF_CTRL_T_COMMAND 'ag -g ""'
	setenv FZF_DEFAULT_COMMAND 'fd --type file --follow'
	setenv FZF_CTRL_T_COMMAND 'fd --type file --follow'
end

# For RLS
# https://github.com/fish-shell/fish-shell/issues/2456
setenv LD_LIBRARY_PATH (rustc +nightly --print sysroot)"/lib:$LD_LIBRARY_PATH"
setenv RUST_SRC_PATH (rustc --print sysroot)"/lib/rustlib/src/rust/src"

# Npm
setenv NPM_PACKAGES "$HOME/.npm-packages"
#PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
#unset MANPATH # delete if you already modified MANPATH elsewhere in your config
#export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# https://blog.packagecloud.io/eng/2017/02/21/set-environment-variable-save-thousands-of-system-calls/
setenv TZ ":/etc/localtime"
#setenv QT_DEVICE_PIXEL_RATIO 2
#setenv GDK_SCALE 2
#setenv GDK_DPI_SCALE 0.5
#setenv _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=lcd -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
#setenv JAVA_FONTS /usr/share/fonts/TTF
#setenv MATLAB_JAVA /usr/lib/jvm/default-runtime
#setenv J2D_D3D false

# Fish should not add things to clipboard when killing
# See https://github.com/fish-shell/fish-shell/issues/772
set FISH_CLIPBOARD_CMD "cat"

# Base16 Shell
if status --is-interactive
	set BASE16_SHELL "$HOME/dev/others/base16/shell"
	source "$BASE16_SHELL/profile_helper.fish"
end

## pyenv
#set -x PATH "/home/jethros/.pyenv/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
set PYENV_VERSION system
status --is-interactive; and . (pyenv virtualenv-init -|psub)

# Pretty ls colors
if test -e $HOME/.dircolors
	if test (uname) = Darwin
		setenv LS_COLORS (bash --noprofile -c 'eval "$(gdircolors -b $HOME/.dircolors)"; echo $LS_COLORS')
else
	setenv LS_COLORS (bash --noprofile -c 'eval "$(dircolors -b $HOME/.dircolors)"; echo $LS_COLORS')
end
end
function fish_user_key_bindings
	bind \cz 'fg>/dev/null ^/dev/null'
	if functions -q fzf_key_bindings
		fzf_key_bindings
end
end
function fish_greeting
	echo
	if test (uname) = Darwin
		echo -e (uname -sr | awk '{print " \\\\e[1mOS:  \\\\e[0;32m"$0"\\\\e[0m"}')
		echo -e (uptime  | sed 's/^up //' | awk '{print " \\\\e[1mUptime:  \\\\e[0;32m"$0"\\\\e[0m"}')
else
	echo -e (uname -ro | awk '{print " \\\\e[1mOS: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo -e (uptime -p | sed 's/^up //' | awk '{print " \\\\e[1mUptime: \\\\e[0;32m"$0"\\\\e[0m"}')
end
echo -e (uname -n | awk '{print " \\\\e[1mHostname:  \\\\e[0;32m"$0"\\\\e[0m"}')

# Disk usage
echo -e " \\e[1mDisk usage:\\e[0m"
echo
if test (uname) = Darwin
	echo -ne (\
	df -l -h | grep -E 'dev' | \
	awk '{printf "\\\\t%s\\\\t%4s / %4s  %s\\\\n\n", $1, $3, $2, $5}' | \
	sed -e 's/^\(.*\([8][5-9]\|[9][0-9]\)%.*\)$/\\\\e[0;31m\1\\\\e[0m/' -e 's/^\(.*\([7][5-9]\|[8][0-4]\)%.*\)$/\\\\e[0;33m\1\\\\e[0m/' | \
	paste -sd\\ - \
	)
else
	echo -ne (\
	df -l -h | grep -E 'dev/(xvda|sd|mapper)' | \
	awk '{printf "\\\\t%s\\\\t%4s / %4s  %s\\\\n\n", $6, $3, $2, $5}' | \
	sed -e 's/^\(.*\([8][5-9]\|[9][0-9]\)%.*\)$/\\\\e[0;31m\1\\\\e[0m/' -e 's/^\(.*\([7][5-9]\|[8][0-4]\)%.*\)$/\\\\e[0;33m\1\\\\e[0m/' | \
	paste -sd ''\
	)
end
echo

# Network
echo -e " \\e[1mNetwork:\\e[0m"
echo
if test (uname) = Darwin
	echo -ne "       "
	echo -ne (\
	networksetup -listallhardwareports | awk '/Hardware Port: Wi-Fi/{getline; print $2}' \
	)
	echo -ne ": "
	echo -ne (\
	ipconfig  getifaddr (networksetup -listallhardwareports | awk '/Hardware Port: Wi-Fi/{getline; print $2}') \
	)
	echo
else
	echo
	# http://tdt.rocks/linux_network_interface_naming.html
	echo -ne (\
	ip addr show up scope global | \
	grep -E ': <|inet' | \
	sed \
	-e 's/^[[:digit:]]\+: //' \
	-e 's/: <.*//' \
	-e 's/.*inet[[:digit:]]* //' \
	-e 's/\/.*//'| \
	awk 'BEGIN {i=""} /\.|:/ {print i" "$0"\\\n"; next} // {i = $0}' | \
	sort | \
	#column -t -R1 | \
	# public addresses are underlined for visibility \
	sed 's/ \([^ ]\+\)$/ \\\e[4m\1/' | \
	# private addresses are not \
	sed 's/m\(\(10\.\|172\.\(1[6-9]\|2[0-9]\|3[01]\)\|192\.168\.\).*\)/m\\\e[24m\1/' | \
	# unknown interfaces are cyan \
	sed 's/^\( *[^ ]\+\)/\\\e[36m\1/' | \
	# ethernet interfaces are normal \
	sed 's/\(\(en\|em\|eth\)[^ ]* .*\)/\\\e[39m\1/' | \
	# wireless interfaces are purple \
	sed 's/\(wl[^ ]* .*\)/\\\e[35m\1/' | \
	# wwan interfaces are yellow \
	sed 's/\(ww[^ ]* .*\).*/\\\e[33m\1/' | \
	sed 's/$/\\\e[0m/' | \
	sed 's/^/\t/' \
	)
end
echo

set r (random 0 100)
if test -s ~/.todo
	if [ $r -lt 10 ] # only occasionally show backlog (10%)
		echo -e " \e[1mFinished things, yay!\e[0;32m"
		set_color blue
		echo
		#echo "  [project] <description>"
		cat $HOME/.config/fish/backlog| sed 's/^/  /'
		echo
end
end

set_color normal
echo -e " \e[1mTODOs\e[0;32m"
echo
if [ $r -lt 15 ]
	# least important and urgent, remind me occasionally
	set_color cyan
	# echo "    [project] <description>"
	echo "    [PVN] NetBricks: Replicate experiments"
	echo "    [PVN] NetBricks: Modify and improve NetBricks"
	echo "    [Rust] Rust Book: check the list of unclear concepts"
	echo "    [CFP] NSDI 2020 Fall DDL: Sept 19, 2019"
	echo "    [Fun] SICP"
	echo "    [Fun] C++ 2012, 2014"
end
if [ $r -lt 35 ]
	# less important and urgent
	set_color green
	# echo "    [project] <description>"
	echo "    [CFP] HotCloud 2019 DDL: Mar 6, 2019"
	echo "    [CFP] NSDI 2020 Spring DDL: Mar 19, 2019"
	echo "    [NSDI 2019] Student grant application DDL: Jan 23"
end
if [ $r -lt 50 ]
	# important but not urgent things, note that these are the things I work
	# on every morning
	set_color yellow
	echo "    [PVN] SGX: read primer (ring0)"
	echo "    [PVN] DPDK: Fastpass, primer "
	echo "    [Research] Short paper idea"
	echo "    [PVN] Design, Architecture and Prototype"
end

# important and urgent things, so I should get to it quick
set_color red
#echo "    [PVN] NetBricks: fix dpdk myself?"

echo
set_color normal
end

# end of [fish/config.fish]