#!/usr/bin/env python3
"""Check the relative links of the tracked Markdown documents.

For every tracked `.md` file outside the archives, every Markdown link `[text](target)` whose target is a path in
the repository must point to an existing file or directory. Web links, mail links and pure `#anchor` links are not
checked; a `#fragment` after a path is ignored.

Usage: python3 scripts/check_md_links.py [--root DIR] [FILE...]
Without FILE arguments, all tracked Markdown files are checked except those under ARCHIVES.
Exit status 0 iff no link is broken.
"""
import argparse
import re
import subprocess
import sys
from pathlib import Path
from urllib.parse import unquote

# records of past work: kept as they were received, links included
ARCHIVES = ("abandonware/", "handoff/", "outputs/")
ARCHIVE_PARTS = ("/sources/",)

LINK = re.compile(r"(?<!\\)\[(?:[^\]\\]|\\.)*\]\(\s*<?([^)\s>]+)>?(?:\s+\"[^\"]*\")?\s*\)")
FENCE = re.compile(r"^\s*(```|~~~)")
INLINE_CODE = re.compile(r"`[^`\n]*`")


def tracked_markdown(root: Path):
    out = subprocess.run(
        ["git", "-C", str(root), "ls-files", "-z", "--", "*.md"], check=True, capture_output=True
    ).stdout.decode("utf-8")
    files = [f for f in out.split("\0") if f]
    return [
        f for f in files
        if not f.startswith(ARCHIVES) and not any(part in "/" + f for part in ARCHIVE_PARTS)
    ]


def links(text: str):
    """(line number, target) for every Markdown link outside code."""
    fenced = False
    for lineno, line in enumerate(text.splitlines(), 1):
        if FENCE.match(line):
            fenced = not fenced
            continue
        if fenced:
            continue
        for m in LINK.finditer(INLINE_CODE.sub("", line)):
            yield lineno, m[1]


def broken_links(root: Path, rel: str):
    text = (root / rel).read_text(encoding="utf-8", errors="replace")
    for lineno, target in links(text):
        if re.match(r"^[a-zA-Z][a-zA-Z0-9+.-]*:", target) or target.startswith("#"):
            continue
        if not target.isascii():  # mathematics such as [x](t−4β/ε), not a link
            continue
        path = unquote(target.split("#", 1)[0].split("?", 1)[0])
        if not path:
            continue
        base = root if path.startswith("/") else (root / rel).parent
        if not (base / path.lstrip("/")).exists():
            yield f"{rel}:{lineno}: broken link {target}"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--root", default=Path(__file__).resolve().parent.parent, type=Path)
    parser.add_argument("files", nargs="*")
    args = parser.parse_args()
    files = args.files or tracked_markdown(args.root)
    problems = [p for rel in files for p in broken_links(args.root, rel)]
    for p in problems:
        print(p)
    if problems:
        print(f"check_md_links: {len(problems)} broken link(s) in {len(files)} file(s)", file=sys.stderr)
        return 1
    print(f"check_md_links: OK, {len(files)} file(s)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
