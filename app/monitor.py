#!/usr/bin/env python3
import urllib.request
import ssl
import certifi
import datetime
import json
import sys

SITES = [
    "https://google.com",
    "https://github.com",
    "https://httpstat.us/500",
]

def check_site(url):
    try:
        ctx = ssl.create_default_context(cafile=certifi.where())
        urllib.request.urlopen(url, timeout=5, context=ctx)
        return {"url": url, "status": "ok"}
    except Exception as e:
        return {"url": url, "status": "error", "error": str(e)}

def main():
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    results = []

    print(f"=== Site Monitor | {timestamp} ===\n")

    for site in SITES:
        result = check_site(site)
        results.append(result)
        icon = "✓" if result["status"] == "ok" else "✗"
        print(f"{icon} {result['url']}")

    ok = sum(1 for r in results if r["status"] == "ok")
    total = len(results)
    print(f"\nИтого: {ok}/{total} доступно")

    with open("/tmp/report.json", "w") as f:
        json.dump({"timestamp": timestamp, "results": results}, f, indent=2)

    if ok < total:
        sys.exit(1)

if __name__ == "__main__":
    main()
