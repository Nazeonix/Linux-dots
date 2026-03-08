# Мінімальна конфігурація Zsh ⚡

Швидка та мінімалістична **конфігурація Zsh**, орієнтована на продуктивність у **Arch Linux**, з корисними псевдонімами (aliases), легкими плагінами та сучасним prompt.

![Скриншот терміналу](terminal.png)

---

## ✨ Можливості

* ⚡ Швидкий запуск
* 🧠 Автопідказки команд
* 🎨 Підсвічування синтаксису
* 🚀 Сучасний prompt за допомогою Starship
* 📦 Аліаси для керування Flatpak
* 🐧 Аліаси для Pacman / AUR helper
* 📂 Зручні Git-скорочення
* 🖥 Оптимізація для KDE Plasma

---

# 📦 Плагіни

Ця конфігурація автоматично встановлює та завантажує:

* **fast-syntax-highlighting** — швидке підсвічування синтаксису команд
* **zsh-autosuggestions** — автопідказки команд як у Fish shell

Плагіни зберігаються у:

```
~/.zsh/
```

---

# 🚀 Prompt

Ця конфігурація використовує **Starship** для сучасного та швидкого prompt.

Ініціалізація:

```bash
eval "$(starship init zsh)"
```

Альтернативний промпт (опціонально):

```
oh-my-posh
```

---

# 🧰 Доступні аліаси

## Git

```
gs      git status
gcm     git commit -m
gco     git checkout
gcob    git checkout -b
gsw     git switch
gp      git pull && git push
gpl     git pull
gf      git fetch --all --prune
gundo   git reset --soft HEAD~1
gst     git stash
pop     git stash pop
gstapp  git stash apply
```

---

## Редактор

```
vim     → nvim
svim    → sudo nvim
ez      → редагувати ~/.zshrc
sz      → перезавантажити ~/.zshrc
```

---

## Перегляд файлів

Використовуються сучасні заміни для `ls`.

```
ls      eza --icons
l       lsd -lah з датою
```

---

## Flatpak

```
fps     flatpak search
fpi     flatpak install
fpr     flatpak remove
fpl     flatpak list
fpu     flatpak update
fpclean flatpak uninstall --unused
fr      flatpak run
```

---

## Pacman

```
pu      sudo pacman -Syu
pi      sudo pacman -S
pr      sudo pacman -Rns
ps      pacman -Ss
psi     pacman -Qs
porphans видалити сирітські пакети
```

---

## AUR (yay)

```
yi      yay -S
yu      yay -Syu
ys      yay -Ss
```

---

# 📜 Налаштування історії

```
HISTFILE = ~/.zsh_history
HISTSIZE = 100000
SAVEHIST = 100000
```

Спільна історія між усіма сесіями терміналу:

```
setopt SHARE_HISTORY
```

---

# 🖥 Оптимізація KDE

Для плавнішого композитингу в **KDE Plasma**:

```
export KWIN_TRIPLE_BUFFER=1
```

---

# 📥 Встановлення

Клонуйте репозиторій:

```
git clone https://github.com/Nazeonix/Linux-dots.git
```

Скопіюйте конфігурацію:

```
cp .zshrc ~/.zshrc
```

Перезапустіть оболонку:

```
source ~/.zshrc
```

---

# 📁 Структура директорій

```
~/.zsh
 ├── fast-syntax-highlighting
 └── zsh-autosuggestions
```

---

# 🎯 Мета

Ця конфігурація створена для того, щоб забезпечити:

* **швидку оболонку**
* **чисте середовище розробника**
* **мінімум залежностей**
* **потужні аліаси**

---

# 1. Залежності (приклад для Debian/Ubuntu)

```bash
# Оновлення системи та встановлення базових пакетів
sudo apt update
sudo apt install -y zsh git neovim inxi dmidecode curl wget gpg

# Fastfetch (сучасніший і красивіший за neofetch)
# На нових Ubuntu/Debian (24.04+/Trixie/Sid) зазвичай є в репозиторіях:
sudo apt install -y fastfetch

# Старіші версії → завантажте .deb з релізів:
# https://github.com/fastfetch-cli/fastfetch/releases
# Приклад для amd64:
# wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.x.x/fastfetch-linux-amd64.deb
# sudo dpkg -i fastfetch-linux-amd64.deb
# sudo apt install -f

# Встановлення FiraCode Nerd Font (рекомендовано для іконок)
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
unzip FiraCode.zip "*.ttf" -d fira-code-nerd
fc-cache -fv
rm FiraCode.zip
```

Після встановлення виберіть **FiraCode Nerd Font** у налаштуваннях терміналу.

---

# Сучасні інструменти ls

```bash
# Додати офіційний репозиторій eza
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list

sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza
```

---

# 🎨 Тема іконок Papirus

**Papirus Icon Theme** — сучасна, яскрава тема іконок, яка чудово підходить до темних мінімалістичних систем.

### Ubuntu / Linux Mint / Pop!_OS

```bash
sudo add-apt-repository ppa:papirus/papirus
sudo apt update
sudo apt install papirus-icon-theme
```

### Debian

```bash
sudo sh -c "echo 'deb http://ppa.launchpad.net/papirus/papirus/ubuntu jammy main' > /etc/apt/sources.list.d/papirus-ppa.list"

wget -qO- https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x9461999446FAF0DF770BFC9AE58A9D36647CAE7F | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/papirus.gpg

sudo apt update
sudo apt install papirus-icon-theme
```

### Для користувачів Arch ❤️

```bash
sudo pacman -S eza starship ttf-meslo-nerd papirus-icon-theme --needed
```

Після встановлення відкрийте **GNOME Tweaks**:

```
sudo apt install gnome-tweaks або sudo pacman -S gnome-tweaks
```

Перейдіть до **Appearance → Icons** і виберіть **Papirus** або **Papirus-Dark**.

---

# 🎨 Колірна схема

Темна мінімалістична тема, натхненна One Dark / Dracula.

```
Background   #242424
Foreground   #ABB2BF
Accent       #56B6C2
Purple       #C678DD
Green        #98C379
Red          #E06C75
```

---

# 💡 Рекомендації

* Використовуйте **Papirus-Dark** разом із темною темою — виглядає дуже гарно
* Перезапустіть термінал після зміни шрифтів або іконок
* Регулярно оновлюйте Papirus:

```
sudo apt update && sudo apt upgrade papirus-icon-theme
```

Насолоджуйтесь чистим та стильним терміналом! 🚀
