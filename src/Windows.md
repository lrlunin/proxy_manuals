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

## Импорт конфигурации сервера

Обратитесь ко мне в личных сообщениях, и я сообщу вам ваши уникальные ключи для подключения к прокси-серверу.

Далее пошагово:

1. Скопируйте __один__ ключ в буфер обмена.

2. Зайдите в окно программы Nekoray и нажмите `Ctrl+V`. В списке конфигураций появится профиль.

\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/nekoray_win_2.png}
\end{center}

3. Повторите для других ключей, если такие имеются.

Конфигурации серверов добавлены. Теперь необходимо настроить приложение, чтобы исключительно заблокированные сайты маршрутизировались через прокси сервер.

## Настройки маршрутизации
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

6. Жмём OK в обоих окнах.

7. Далее ставим галочку в поле Tun Mode и программа попросит перезапуститься с правами администратора.

\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/nekoray_win_6.png}
\end{center}

7. Жмём правой кнопкой мыши на выбранный профиль и выбираем Start.

\begin{center} 
\includegraphics[width=0.7\textwidth]{imgs/nekoray_win_8.png}
\end{center}

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