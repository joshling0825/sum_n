#!/usr/bin/env python3
"""任務達成評分系統：輸入前四題的結果，每題達標即給 25 分，滿分 100。

用法：
  互動模式：python3 score.py
  快速模式：python3 score.py 1110   （依序為第 1~4 題，1=達標 0=未達標）
"""
import sys

TASKS = [
    ("第 1 題：撰寫 1 加到 N 的 Fortran 程式，並完成編譯與執行",
     ["程式碼已完成", "實際編譯成功（有編譯器實測）", "實際執行並輸出正確結果"]),
    ("第 2 題：執行三次隨機驗證",
     ["已選出三個隨機 N", "三次實際輸出皆與預期值相符"]),
    ("第 3 題：Git 版本控制（v1 提交 → 逐行註解 → 編譯驗證 → v2 提交）",
     ["v1 原版已 commit", "v2 逐行註解版已 commit", "v2 實際編譯驗證成功"]),
    ("第 4 題：將本地 Git 儲存庫推送到 GitHub",
     ["GitHub 遠端儲存庫已建立並設定 origin", "git push 成功，網頁上可見兩個 commit"]),
]
POINTS = 25


def ask(prompt):
    while True:
        a = input(prompt + " (y/n): ").strip().lower()
        if a in ("y", "n"):
            return a == "y"


def main():
    if len(sys.argv) > 1:
        bits = sys.argv[1]
        if len(bits) != 4 or set(bits) - {"0", "1"}:
            sys.exit("快速模式需要 4 位的 0/1，例如 1010")
        results = [c == "1" for c in bits]
    else:
        results = []
        for title, criteria in TASKS:
            print("\n" + title)
            results.append(all([ask("  - " + c) for c in criteria]))

    total = 0
    print("\n===== 評分結果 =====")
    for (title, _), ok in zip(TASKS, results):
        got = POINTS if ok else 0
        total += got
        print(f"[{'達標' if ok else '未達標'}] {got:>2}/{POINTS}  {title}")
    print(f"總分：{total}/{POINTS * len(TASKS)}")


if __name__ == "__main__":
    main()
