# Выбор клиента

На данный момент список состоит из одного клиента NekoRay. Но скорее всего будет расширяться. Этот клиент мультиплаторменный и также существует неофициальная сборка для MacOS.

- [`NekoRay`](https://github.com/MatsuriDayo/nekoray) (бесплатный)

# Настройка клиента NekoRay

## Установка

1. Скачайте архив [https://github.com/MatsuriDayo/nekoray/releases/download/3.26/nekoray-3.26-2023-12-09-windows64.zip](https://github.com/MatsuriDayo/nekoray/releases/download/3.26/nekoray-3.26-2023-12-09-windows64.zip)

2. Распакуйте архив по пути (например) `C:\Users\Ivan\nekoray`

\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/nekoray_win_1.png}
\end{center}

При первом запуске программа спросит, хотите ли вы использовать `Xray` или `sing-box`в качестве ядра программы. Необходимо выбрать `sing-box`.

Если вы случайно выбрали `Xray` то вы можете поменять его на `sing-box`:

1. Во вкладке "Настройки" -> "Базовые настройки".

\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/nekoray_core_1.png}
\end{center}

2. Далее вкладка "Ядро" и выбор внизу окна.
\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/nekoray_core_2.png}
\end{center}

## Импорт конфигурации сервера

Обратитесь ко мне в личных сообщениях, и я сообщу вам ваши уникальные ключи для подключения к прокси-серверу. Ключи обычно начинаются с `vless://` или `ss://`.

Далее пошагово:

1. Скопируйте __один__ ключ в буфер обмена.

2. Зайдите в окно программы Nekoray и нажмите `Ctrl+V`. В списке конфигураций появится профиль.

\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/nekoray_win_2.png}
\end{center}

3. Повторите для других ключей, если такие имеются.

Конфигурации серверов добавлены. Теперь необходимо настроить приложение, чтобы исключительно заблокированные сайты маршрутизировались через прокси сервер.

## Настройки маршрутизации

Далее есть два сценария настройки маршрутизации:

### Настройка по сгенированным спискам (рекомендуемый вариант)

В этом случае мы используем список заблокированных доменов, созданный добрыми неравнодушными людьми. Он находится на сайте [GitHub](https://github.com/1andrevich/Re-filter-lists). Если его заблокируют к моменту чтения данной инструкции, то этот вариант будет чуть сложнее.

Далее пошагово:

1. В настройках выберите пункт Routing settings.

\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/nekoray_win_3.png}
\end{center}

2. В пункте Domain Strategy выберите `prefer_ipv4`.

\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/nekoray_win_4.png}
\end{center}

3. Переходим во вкладку Simple Route.

\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/nekoray_list_1.png}
\end{center}

4. Жмём кнопку Custom route внизу и добавляем следующую конфигурацию:

\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/nekoray_list_2.png}
\end{center}

\newpage
```json
{
  "route": {
    "final": "direct",
    "auto_detect_interface": true,
    "rules": [
      {
        "rule_set": [
          "refilter_domains",
          "refilter_ipsum"
        ],
        "outbound": "proxy"
      }
    ],
    "rule_set": [
      {
        "tag": "refilter_domains",
        "type": "remote",
        "format": "binary",
        "url": "https://github.com/1andrevich/Re-filter-lists/releases/latest/download/ruleset-domain-refilter_domains.srs",
        "download_detour": "direct"
      },
      {
        "tag": "refilter_ipsum",
        "type": "remote",
        "format": "binary",
        "url": "https://github.com/1andrevich/Re-filter-lists/releases/latest/download/ruleset-ip-refilter_ipsum.srs",
        "download_detour": "direct"
      }
    ]
  },
  "experimental": {
    "cache_file": {
      "enabled": true
    }
  }
}
```

5. Нажимаем все кнопки OK пока не вернемся на главный экран приложения.

Поздравляю, настройка маршрутизации пакетов закончена.

### Ручная настройка

В этом случае мы сами задаем параметры по которым тот или иной интернет пакет должен идти напрямую к серверу или через наш прокси.

Далее пошагово:

1. В настройках выберите пункт Routing settings.

\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/nekoray_win_3.png}
\end{center}

2. В пункте Domain Strategy выберите `prefer_ipv4`

\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/nekoray_win_4.png}
\end{center}

3. Во вкладке Simple Route в квадрате IP:Direct добавляем две строки:

```
geoip:ru
geoip:private
```


\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/nekoray_win_5.png}
\end{center}

\pagebreak

4. В квадрате Domain:Direct добавляем две строки:

```
google.ru
google.com
```

\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/nekoray_win_9.png}
\end{center}

Это необходимо, потому что я имел неудачу получить сервер с адресом, который буквально забанен в поиске Google. 

5. Жмём кнопку Custom route внизу и добавляем следующую конфигурацию:

```json
{
    "rules": [
        {
            "domain_suffix": [
                ".ru"
            ],
            "outbound": "direct"
        }
    ]
}
```

6. Нажимаем все кнопки OK пока не вернемся на главный экран приложения.


Поздравляю, настройка маршрутизации пакетов закончена.


## Добавляем свои сайты список для обхода

Если какой-либо сайт всё ещё не открывается вы можете добавить его сами в настройках Routing settings -> Simple Route в квадрат Domain:Proxy.

\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/nekoray_win_7.png}
\end{center}

Например это список доменов для YouTube:

```
yt.be
googlevideo.com
youtu.be
gvt1.com
gstatic.com
youtube.com
nhacmp3youtube.com
youtube-nocookie.com
aaplimg.com
ytimg.com
youtubeeducation.com
youtubekids.com
googleapis.com
ggpht.com
googleusercontent.com
1e100.net
doubleclick.net
mdns.mcast.net
youtube.ru
```

## Использование программы

Данную программу можно использовать по несколькми сценариям. Ниже я опишу каждый из них.

### В режиме SOCKS5 прокси сервера

В этом случае программа запускает на вашем компьютере локальный SOCKS5 прокси сервер, адрес и порт которого вы видите внизу окошка. SOCKS5 это очень распространенный протокол и многие программы поддерживают работу с ним. В этом сценарии использования через прокси сервер пойдёт лишь траффик от приложений, которые подключены к SOCKS5 прокси. Это может быть удобно, когда вам, например, нужно использовать прокси только в браузере.

1. Удостоверимся, что галочка в поле Tun Mode в программе не стоит.

\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/nekoray_win_10.png}
\end{center}

2. Жмём правой кнопкой мыши на выбранный профиль и выбираем Start.

\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/nekoray_win_11.png}
\end{center}

Далее вам нужно лишь подключить желаемую программу к адресу указанному ниже на окошке. В моём слуачае `127.0.0.1:2080`. Поддерживает ли та или иная конкретная программа SOCKS5 и как указать адрес сервера можно без труда найти в интернете. Ниже я рассмотрю случай использования SOCKS5 прокси в браузере FireFox.

#### Использование SOCKS5 в браузере FireFox

1. Открываем настройки браузера FireFox.

\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/firefox_socks_1.png}
\end{center}

2. В окне поиске в настройках вводим `socks`. 

\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/firefox_socks_2.png}
\end{center}

3. Указываем ручную конфигируацию прокси, адрес и порт. Ставим галочку `Проксировать DNS через SOCKS v5`.

\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/firefox_socks_3.png}
\end{center}

После этого проверяем есть ли интернет.

### В режиме `TUN`

В этом режиме, программма будет пропускать через себя любой интернет траффик, который используется на компьютере. Это может быть полезно, когда какая-то программа требует подсоединения к сайту, который в России заблокирован.

Чтобы использовать этот режим необходимо сделать следующие шаги:

1. Ставим галочку в поле Tun Mode и программа попросит перезапуститься с правами администратора.

\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/nekoray_win_6.png}
\end{center}

2. Жмём правой кнопкой мыши на выбранный профиль и выбираем Start.

\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/nekoray_win_8.png}
\end{center}

### В режиме системного прокси

Насколько я понимаю, в этом случае будет что-то типа системного Windows http/https прокси. Я не буду рассматривать этот режим, т.к. он самый неудобный и не все программы с ним работают.
