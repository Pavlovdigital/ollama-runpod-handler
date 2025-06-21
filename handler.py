import requests

OLLAMA_URL = "http://127.0.0.1:11434/api/generate"

def handler(event):
    body = event["input"]
    r = requests.post(OLLAMA_URL, json={
        "model": "mistral-small3.1:24b",
        "prompt": body.get("prompt", ""),
        "images": body.get("images", [])
    }, timeout=600)
    r.raise_for_status()
    return r.json()["response"]
