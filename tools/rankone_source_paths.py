"""Resolve archived source metadata inside the executing research checkout.

Historical roots are provenance labels only. They are never probed or opened:
their handoff suffix is mapped to the current repository, then containment and
existence are checked there. Callers must still verify every recorded digest.
"""
from pathlib import Path


ARCHIVED_ROOTS = (
    Path('/Users/alingalatan/workspaces/grothe'),
    Path('/Users/alingalatan/Documents/Codex/2026-10-23/'
         'important-do-not-peek-in-other/work/grothe-rankone'),
)


def resolve_archived_handoff_path(value, repo):
    """Return an existing clone-local file; reject every outside fallback.

    Accepted inputs are repository-relative ``handoff/...`` paths, absolute
    paths within this repository, and handoff paths beneath ARCHIVED_ROOTS.
    Unknown absolute prefixes, traversal and symlink escapes are errors.
    """
    repo = Path(repo).resolve(strict=True)
    if not repo.is_dir():
        raise ValueError('Research repository root is not a directory')
    path = Path(value)
    if '..' in path.parts:
        raise ValueError('Archived source path contains parent traversal')
    if path.is_absolute():
        try:
            relative = path.relative_to(repo)
        except ValueError:
            relative = None
            for archived in ARCHIVED_ROOTS:
                try:
                    relative = path.relative_to(archived)
                except ValueError:
                    continue
                break
            if relative is None:
                raise ValueError('Unknown absolute archived source root')
    else:
        relative = path
    if not relative.parts or relative.parts[0] != 'handoff':
        raise ValueError('Archived sources must use a repository handoff path')
    local = (repo / relative).resolve(strict=True)
    if not local.is_relative_to(repo):
        raise ValueError('Archived source symlink escapes the current repository')
    if not local.is_file():
        raise ValueError('Archived source is not a file')
    return local
