"""The declaration payload of a Lean data file, for comparing a live file with its pinned historical copy.

The upper proof moved from `Grothe/UpperSix/...` (namespaces `Haagerup`, `HaagerupKernel`) to `Grothe/Upper/...`
(namespace `Grothe.Upper`) in the batch of #786, so the live files differ from the pinned copies in their
`import`, `namespace`, `open` and `end` lines only. The payload drops exactly those lines and keeps every other
line verbatim (definitions, coefficients, comments), so a changed coefficient still makes the payloads differ.
Agent-ID: claude-b9ee.
"""
import re

STRUCTURE = re.compile(r"^(import|namespace|open|end)( |$)")

# the live counterparts of the pinned paths (pinned checkouts keep the old paths)
LIVE = {
    "Grothe/UpperSix/Haagerup/Data/OverlapData.lean": "Grothe/Upper/Rounding/Data/OverlapData.lean",
    "Grothe/UpperSix/Haagerup/Parameters.lean": "Grothe/Upper/Rounding/Parameters.lean",
    "Grothe/UpperSix/Certificate/Parameters.lean": "Grothe/Upper/Certificate/Parameters.lean",
    "Grothe/UpperSix/Certificate/Head.lean": "Grothe/Upper/Certificate/Head.lean",
}


def payload(text):
    """The lines of `text` other than import/namespace/open/end lines, trailing whitespace removed."""
    return [line.rstrip() for line in text.splitlines() if not STRUCTURE.match(line)]


def same_payload(live_text, pinned_text):
    return payload(live_text) == payload(pinned_text)
