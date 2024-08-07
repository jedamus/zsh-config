#!/usr/bin/env python3
# coding=utf-8

# erzeugt Mittwoch, 11. März 2015 21:01 2015 von Leander Jedamus
# modifiziert Montag, 08. Juli 2024 09:31 von Leander Jedamus
# modifiziert Samstag, 13. August 2022 08:51 von Leander Jedamus
# modifiziert Montag, 07. Mai 2018 22:24 von Leander Jedamus
# modifiziert Montag, 21. September 2015 17:01 von Leander Jedamus
# modifiziert Samstag, 19. September 2015 18:36 von Leander Jedamus
# modifiziert Mittwoch, 11. März 2015 21:03 von Leander Jedamus

"""Print out zsh prompts.

Based on: https://gist.github.com/seanh/5233082

Customized
"""
import os
import os.path
import subprocess
import socket


def get_username():
    import pwd
    return pwd.getpwuid(os.getuid())[0]


def get_machname():
    name = socket.gethostname()
    if name.find('.') >= 0:
        name = socket.gethostbyaddr(socket.gethostname())[0]
        name = name.split(sep=".")[0]
    return name

def _zero_width(s):
    '''Return the given string, wrapped in zsh zero-width codes.

    This tells zsh that the string is a zero-width string, eg. for prompt
    alignment and cursor positioning purposes. For example, ANSI escape
    sequences should be marked as zero-width.

    '''
    return "%{{{s}%}}".format(s=s)


def _foreground(s, color):
    colors = {
        'black': '\x1b[30m',
        'red': '\x1b[31m',
        'green': '\x1b[32m',
        'yellow': '\x1b[33m',
        'blue': '\x1b[34m',
        'magenta': '\x1b[35m',
        'cyan': '\x1b[1;34;40m',
        'white': '\x1b[37m',
        'gray': '\x1b[1;30m'
    }
    return "{color}{s}".format(color=_zero_width(colors[color]), s=s)


def _background(s, color):
    colors = {
        'red': '\x1b[41m',
        'black': '\x1b[40m',
        'green': '\x1b[42m',
        'yellow': '\x1b[43m',
        'blue': '\x1b[44m',
        'magenta': '\x1b[45m',
        'cyan': '\x1b[46m',
        'white': '\x1b[47m',
    }
    return "{color}{s}".format(color=_zero_width(colors[color]), s=s)


def _bold(s):
    return "{bold}{s}".format(bold=_zero_width("\x1b[1m"), s=s)


def _underline(s):
    return "{underline}{s}".format(underline=_zero_width("\x1b[4m"), s=s)


def _reverse(s):
    return "{reverse}{s}".format(reverse=_zero_width("\x1b[7m"), s=s)


def _reset(s):
    return "{s}{reset}".format(s=s, reset=_zero_width("\x1b[0m"))


def color(s, foreground=None, background=None, bold=False, underline=False,
        reverse=False):
    '''Return the given string, wrapped in the given colour.

    Foreground and background can be one of:
    black, red, green, yellow, blue, magenta, cyan, white.

    Also resets the colour and other attributes at the end of the string.

    '''

    if not s:
        return s
    if foreground:
        s = _foreground(s, foreground)
    if background:
        s = _background(s, background)
    if bold:
        s = _bold(s)
    if underline:
        s = _underline(s)
    if reverse:
        s = _reverse(s)
    s = _reset(s)
    return s


def shorten_path(path, max_length=20):
    '''Return the given path, shortened if it's too long.

    Parent directories will be collapsed, fish-style. Examples:

    /home/seanh -> ~
    /home/seanh/Projects/ckan/ckan/ckan -> ~/P/c/c/ckan
    /home/seanh/Projects/ckan/ckan-> ~/Projects/ckan/ckan

    '''
    # Replace the user's homedir in path with ~
    homedir = os.path.expanduser('~')
    if path.startswith(homedir):
        path = '~' + path[len(homedir):]

    parts = path.split(os.sep)

    # Remove empty strings.
    parts = [part for part in parts if part]
    path = os.sep.join(parts)

    # Starting from the root dir, truncate each dir to just its first letter
    # until the full path is < max_length or all the dirs have already been
    # truncated. Never truncate the last dir.
    while len(path) > max_length:
        for i in range(0, len(parts) - 1):
            part = parts[i]
            if len(part) > 1:
                part = part[0]
                parts[i] = part
                path = os.sep.join(parts)
                continue
        break
    return path


def current_working_dir():
    '''Return the full absolute path to the current working directory.'''

    # Code for getting the current working directory, copied from
    # <https://github.com/Lokaltog/powerline/>.
    try:
        try:
            cwd = os.getcwdu()
        except AttributeError:
            cwd = os.getcwd()
    except OSError as e:
        if e.errno == 2:
            # User most probably deleted the directory, this happens when
            # removing files from Mercurial repos for example.
            cwd = "[not found]"
        else:
            raise
    return cwd


def _is_root():
    return 'SUDO_UID' in os.environ.keys() or os.getuid() == 0


def virtualenv():
    path = os.environ.get('VIRTUAL_ENV', '')
    if path:
        path = "{}{}{}".format(
            color("(", foreground="green"),
            color(os.path.basename(path), foreground="white"),
            color(")", foreground="green"))
    return path


def git_branch():
    # Warning: subprocess.check_output() is new in Python 2.7.
    try:
        output = subprocess.check_output('git symbolic-ref HEAD'.split(),
                stderr=subprocess.PIPE)
    except subprocess.CalledProcessError:
        # Non-zero return code, assume the current working dir is not in a git
        # repo.
        return ''
    first_line = str(output.split(sep=b'\n')[0])
    branch_name = first_line.split('/', 2)[-1].rstrip("'")
    branch = "{}{}{}".format(
        color("[", foreground="gray"),
        color(branch_name, foreground="red", background="yellow"),
        color("]", foreground="gray"))
    return branch


def host_name():
    return socket.gethostname()


def left_prompt():
    '''Return my zsh left prompt.

    '''
    if _is_root():
        root_status = '(^)'
    else:
        root_status = ''

    return "{zsh}{user} {cwd} {root}".format(
            zsh=color("z", foreground='yellow', background='blue'),
            user=color(get_username() + "@" + get_machname(), foreground='blue', background='yellow'),
            cwd=color(shorten_path(current_working_dir()), foreground='white', background='red'),
            root=color(root_status, foreground='red')
            )


def right_prompt(last_exit_status):
    '''Return my zsh right prompt.

    '''
    if last_exit_status in (None, 0):
        last_exit_status = ''
    else:
        last_exit_status = ':( ' + str(last_exit_status)

    parts = [
        virtualenv(),
        git_branch(),
        color(last_exit_status, foreground='red'),
        ]
    # Remove empty strings from parts.
    parts = [part for part in parts if part]

    prompt = ' '.join(parts).strip()
    return prompt


def main():
    import argparse
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('side', metavar='left|right',
            choices=('left', 'right'),
            help="which zsh prompt to print (the left- or right-side prompt)")
    parser.add_argument('--last-exit-status', dest='last_exit_status',
            type=int,
            help='the exit status (int) of the previous shell command (default: None)')
    args = parser.parse_args()
    if args.side == 'left':
        print(left_prompt())
    else:
        assert args.side == 'right'
        print(right_prompt(args.last_exit_status))


if __name__ == '__main__':
    main()

# vim:ai sw=2 sts=4 expandtab

