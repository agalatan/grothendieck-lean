# Shared agent identity and review rules for the review and landing scripts.

agent_kind_re='(claude|codex|gemini)'
agent_id_re="$agent_kind_re-[0-9a-f]{4}"

is_agent_id() {
  [[ "$1" =~ ^$agent_id_re$ ]]
}

is_independent_reviewer() {
  is_agent_id "$1" && is_agent_id "$2" && [[ "${1%%-*}" != "${2%%-*}" ]]
}

# The GitHub query returns the latest review as state<TAB>description.
approved_reviewer() {
  local review="$2" reviewer
  [[ "$review" == success$'\t'* ]] || return 1
  review=${review#*$'\t'}
  [[ "$review" =~ ^\[($agent_id_re)\] ]] || return 1
  reviewer=${BASH_REMATCH[1]}
  is_independent_reviewer "$1" "$reviewer" || return 1
  printf '%s\n' "$reviewer"
}
