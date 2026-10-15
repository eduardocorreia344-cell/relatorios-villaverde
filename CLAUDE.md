# Relatórios Villa Verde — regras permanentes

## Regra nº 1 — alterações na conta de anúncios (decisão do Gabriel Goto)

- **Nunca** alterar nada na conta de anúncios Villa Verde (campanhas, conjuntos, anúncios, orçamento, lance, status, público, criativo, regras, pixel, qualquer configuração) sem **perguntar antes ao Gabriel e receber um "sim" explícito na conversa**.
- Vale para qualquer via: curl/scripts na Graph API (POST/PUT/DELETE), conectores MCP (ex.: Supermetrics `manage_campaign`) ou qualquer outra ferramenta.
- Recomendar uma mudança no relatório é permitido; executar a mudança, não, sem aprovação.
- O usuário do sistema tem acesso total à conta por **decisão do Gabriel**. Não questionar nem sugerir reduzir esse acesso.
- Reforço técnico: `.claude/hooks/meta-write-guard.sh` força um pedido de aprovação em qualquer comando de escrita para `graph.facebook.com`. Não desativar nem contornar esse hook.

## Escopo

- Relatórios exclusivamente de marketing (Meta Ads). Sem acesso ao CRM do cliente: sem análise comercial, sem inferir qualidade de lead ou vendas.
- Não usar credenciais de CRM (ex.: Clint) neste projeto.
