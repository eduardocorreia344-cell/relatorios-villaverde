#!/usr/bin/env bash
# Exige aprovação do usuário antes de qualquer escrita na Meta (conta de anúncios).
# Leitura (GET) passa direto; qualquer sinal de escrita para graph.facebook.com vira "ask".
input=$(cat)
tool=$(printf '%s' "$input" | jq -r '.tool_name // ""')

ask() {
  jq -n --arg r "$1" '{hookSpecificOutput:{hookEventName:"PreToolUse",permissionDecision:"ask",permissionDecisionReason:$r}}'
  exit 0
}

case "$tool" in
  Bash)
    cmd=$(printf '%s' "$input" | jq -r '.tool_input.command // ""')
    if printf '%s' "$cmd" | grep -qiE 'graph\.facebook\.com|facebook\.com/v[0-9]'; then
      if printf '%s' "$cmd" | grep -qiE -- '(-X|--request)[ =]*(POST|PUT|PATCH|DELETE)|(^|[[:space:]])(-d|--data[a-z-]*|-F|--form[a-z-]*|-T|--upload-file)([[:space:]=]|$)|method=(post|delete)|\.(post|put|patch|delete)\(|"(POST|PUT|PATCH|DELETE)"'; then
        ask "Comando com escrita para a API da Meta. Regra do projeto: qualquer alteração na conta de anúncios Villa Verde exige aprovação explícita do Gabriel."
      fi
    fi
    ;;
  mcp__Supermetrics_Marketing_Analytics__manage_campaign)
    ask "Ferramenta que altera campanhas. Regra do projeto: qualquer alteração na conta de anúncios exige aprovação explícita do Gabriel."
    ;;
esac
exit 0
