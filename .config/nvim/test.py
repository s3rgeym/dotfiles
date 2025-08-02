import requests
import os


def main():
    # Режим редактирования:
    # <C-Space> — вызов справки (<C-f>/<C-b> — для прокрутки).
    # <C-S> — показать сигнатуру ().
    r = requests.post("https://ipinfo.io")
    data = r.json()
    # Поставь тут брейкпоинт с помощью F9 и запусти дебаггер, нажав F5
    print("Your IP:", data["ip"])


requests.get()
if __name__ == "__main__":
    main()
