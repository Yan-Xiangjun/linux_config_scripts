import curses
from commands import *
import subprocess
import os
import shutil


def run_commands(selected_items):
    for item in selected_items:
        has_apt_fast = True if shutil.which("apt-fast") else False
        print(item)
        cmd_lst = commands[item]
        for cmd in cmd_lst:
            if is_termux:
                cmd = cmd.lstrip('sudo ')
            if not has_apt_fast:
                cmd = cmd.replace('apt-fast ', 'apt ')
            print(f"执行：{cmd}")
            try:
                subprocess.run(cmd, shell=True, check=True)
            except subprocess.CalledProcessError as e:
                print(e)
                input("按回车键退出...")
                return
    input("按回车键退出...")  # 暂停程序，便于查看输出


def main(stdscr):
    # 初始化 curses 设置
    curses.curs_set(0)  # 隐藏光标
    stdscr.keypad(True)

    # 菜单项和选中状态
    menu = list(commands.keys())
    selected = [False] * len(menu)
    current = 0

    while True:
        stdscr.clear()
        height, width = stdscr.getmaxyx()

        # 在屏幕上方显示使用说明
        instructions = ["↑↓ - 切换菜单项，空格 - 选择/取消，回车 - 确定"]
        for i, line in enumerate(instructions):
            stdscr.addstr(i, 0, line)

        # 在菜单下方显示菜单项
        start_row = len(instructions) + 1
        for idx, item in enumerate(menu):
            if idx == current:
                # 高亮当前项
                stdscr.attron(curses.A_REVERSE)
            mark = "[√] " if selected[idx] else "[ ] "
            stdscr.addstr(start_row + idx, 0, f"{mark}{item}")
            if idx == current:
                stdscr.attroff(curses.A_REVERSE)

        stdscr.refresh()

        key = stdscr.getch()

        if key == curses.KEY_UP:
            current = (current - 1) % len(menu)
        elif key == curses.KEY_DOWN:
            current = (current + 1) % len(menu)
        elif key == ord(' '):
            # 切换当前项的选中状态
            selected[current] = not selected[current]
        elif key == curses.KEY_ENTER or key in [10, 13]:
            # 回车键
            break

    # 恢复终端设置后退出 curses 模式
    curses.endwin()

    # 收集选中的菜单项（保持菜单在列表中的顺序）
    chosen = [item for i, item in enumerate(menu) if selected[i]]
    run_commands(chosen)


if __name__ == '__main__':
    try:
        curses.wrapper(main)
    except Exception as e:
        print('[Error]', e)
        if str(e) == 'addwstr() returned ERR':
            print('出现错误！请尝试调大终端窗口后重试！')
