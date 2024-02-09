import requests

a = requests.get("https://haydaycalculator.live/goodsList/manifest.json").json()

print(a)