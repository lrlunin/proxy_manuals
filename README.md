# Инструкции по настройке прокси
Инструкции по настройке прокси по протоколлу `VLESS` и `ShadowSocks` для всех платформ. Ошибки и исправления пожалуйста присылать в `Issues` на GitHub.

# PDF инструкции
Инструкции находятся в корне репозитория.

# Сборка
Вряд ли вы когда либо будете сами собирать эти файлы руками, но для порядка инструкция будет здесь. Инструкция ниже рассчитана для сборке на Ubuntu Linux.

1. Установить необходимые пакеты:

```bash
sudo apt-get install pandoc pandoc-citeproc texlive-latex-full texlive-fonts-recommended texlive-extra-utils texlive-latex-extra make 
```

>Для `mermaid` диаграмм нужны также `nodejs`, `npm`. Затем установить пакет [`mermaid-filter`](https://github.com/raghur/mermaid-filter) и опциально для `svg` внутри `pdf` файлов потребуется `rsvg-convert` в составе пакета `librsvg2-bin`.
2. Выполнить комманды:

```bash
cd src
make all
```

3. Открыть папку корневой раздел и радоваться!
🥳🥳🥳🥳