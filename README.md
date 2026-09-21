[MOOMOO_RADAR_V3_HANDOFF_MASTER_2026-09-21.pdf](https://github.com/user-attachments/files/32481213/MOOMOO_RADAR_V3_HANDOFF_MASTER_2026-09-21.pdf)
[MOOMOO_RADAR_V3_HANDOFF_MASTER_2026-09-21.txt](https://github.com/user-attachments/files/32481212/MOOMOO_RADAR_V3_HANDOFF_MASTER_2026-09-21.txt)
# MOOMOO RADAR V3 — HANDOFF MASTER

**Data de consolidação:** 21/09/2026  
**Finalidade:** transferência segura do projeto para outra AI, engenheiro ou nova conversa  
**Idioma operacional:** português, preservando nomes técnicos e campos de código em inglês  
**Status do documento:** fonte de continuidade e governança  
**Status do V3:** especificação consolidada; não representa, por si só, código V3 implementado ou validado

---

## 0. LEIA ISTO PRIMEIRO

Este arquivo foi criado para impedir perda de memória técnica, repetição de investigações, reutilização indevida de código antigo e conclusões apresentadas sem evidência.

### Regra obrigatória de continuidade

Código novo não significa conhecimento zero.

Antes de propor qualquer investigação, auditoria, mudança arquitetural, filtro, métrica, correção, experimento ou implementação, perguntar internamente:

> Isso já foi investigado, decidido, testado ou medido anteriormente neste projeto?

Se sim, partir obrigatoriamente do resultado existente. Não repetir trabalho concluído. Não reabrir questão resolvida sem evidência nova relevante. Não substituir silenciosamente contratos anteriores.

O legado pode ser consultado como evidência e memória técnica, mas seu código não deve ser reutilizado no Clean/V3 sem autorização explícita.

**Princípio:** código clean; memória técnica cumulativa.

### Regra obrigatória de honestidade epistemológica

Toda afirmação relevante deve ser classificada como uma destas cinco categorias:

1. **VERIFICADO:** sustentado por arquivo, log, teste reproduzível, gráfico ou dados OHLCV identificáveis.
2. **DECIDIDO:** escolha arquitetural ou operacional aprovada, ainda que não implementada.
3. **IMPLEMENTADO NÃO VALIDADO:** existe no código, mas não cumpriu toda a hierarquia de validação.
4. **HIPÓTESE:** explicação plausível ainda não provada.
5. **DESCONHECIDO/PENDENTE:** evidência ausente ou insuficiente.

É proibido transformar hipótese, inferência, horário de alerta ou descrição do usuário em fato verificado sem conferir a fonte primária aplicável.

---

## 1. OBJETIVO DO PROJETO

Construir um radar próprio para encontrar cedo ações com grande potencial de movimento para swing trade, com atenção especial a premarket e intraday, preservando descoberta ampla e priorizando qualidade de timing.

Fluxo-alvo:

**MERCADO → descoberta ampla → setup/ignition/breakout → freshness de 1 minuto → validação estrutural e de risco → ranking TOP 3–5 → alerta móvel → revisão humana → confirmação explícita → eventual ordem Moomoo**

O sistema deve:

- encontrar movimentos cedo, antes de ficarem excessivamente estendidos;
- diferenciar setup em formação, ignição recente, breakout fresco, volume shock e momentum já tardio;
- cobrir small, mid e large caps dos EUA, além de biotech, tecnologia, energia, ações ligadas a commodities, ETFs, crypto ETFs e crypto suportada;
- excluir OTC;
- preservar listas informativas mesmo quando um ativo não é acionável;
- explicar por que alertou, rejeitou ou perdeu um mover relevante;
- operar em **SIMULATE-only** durante desenvolvimento e validação;
- jamais executar blind auto-trading;
- exigir confirmação humana explícita antes de qualquer futura submissão de ordem.

---

## 2. LINHAGEM E POLÍTICA DE VERSÕES

### 2.1 V7 legado

**Classificação:** baseline historicamente validada/congelada dentro do legado.

- Foi a última versão que mostrou melhora live significativa antes das alterações de Industry/Theme.
- Preserva descoberta ampla, DELTA, freshness assíncrona de 1 minuto, Stage Gate, TOP3, Pushover e SIMULATE.
- Não sobrescrever nem modificar a única cópia.
- Deve servir como evidência técnica, não como fonte automática de código para o Clean/V3.

### 2.2 V6 legado

**Classificação:** referência arquitetural.

- Referência para a arquitetura assíncrona de freshness de 1 minuto.
- Não é a baseline escolhida para evolução.

### 2.3 V8 e V8.1 legado

**Classificação:** forense apenas.

- Foram associados às tentativas de adicionar Industry/Theme.
- Devem ser consultados para entender regressões e isolamento de metadata.
- Não usar como baseline.
- A revisão V8 declarou metadata display-only, assíncrona e cacheada, mas a política consolidada continua sendo não promover V8/V8.1 a baseline.

### 2.4 hybrid_quotasafe

**Classificação:** baseline congelada e validada do pacote de 04/09/2026.

- Não modificar.
- Preservar como rollback e referência.

### 2.5 hybrid_alertsafe

**Classificação:** candidato pendente de validação completa.

- Corrigir e validar somente em cópia/branch.
- Não chamar de validado antes de cumprir toda a sequência obrigatória.

### 2.6 V2 Clean

**Classificação:** reinício de código com memória técnica cumulativa.

- Não reutilizar código legado sem autorização.
- Não assumir que decisões antigas perderam validade só porque o código foi refeito.
- Toda mudança deve verificar primeiro o que já foi investigado, decidido, testado ou medido.

### 2.7 V3 neste handoff

**Classificação:** contrato de continuidade e governança consolidado.

V3, neste documento, não significa que um novo motor foi implementado, compilado, testado ou certificado. Significa que a próxima gestão do projeto deve começar deste contrato, reconciliar o estado real do repositório e somente então nomear uma build/candidato de código.

---

## 3. FONTES CANÔNICAS RECUPERADAS

### Documentos principais

1. `MoomooRadar_MASTER_MANUS_2026-09-04.md`
2. `MooMooRadar_MASTER_FILE_FOR_NEXT_AI_20260904.md`
3. `CODEX_START_HERE_MOOMOO_RADAR_2026-09-04.md`
4. `MOOMOO_RADAR_COMPLETE_HANDOFF.md`
5. `MOOMOO_RADAR_SWING_MULTITASK_ARCHITECTURE_2026-09-06.md`
6. `V7_FRESH_LISTS_REVIEW.txt`
7. `V8_THEME_METADATA_REVIEW.txt`
8. `hybrid_quotasafe/README_START_HERE.md`
9. `hybrid_quotasafe/HYBRID_VALIDATION.md`
10. `hybrid_alertsafe/SETUP_ALERT_GOVERNANCE.md`
11. `hybrid_alertsafe/ERROR_TIME_LOSS_LEDGER.md`
12. `hybrid_alertsafe/MoomooRadar_HYBRID_V7_QUOTASAFE.py`

### Artefatos e referências adicionais existentes

- `MoomooRadar_EARLY_DISCOVERY_V7_FRESH_LISTS.py`
- `MoomooRadar_EARLY_DISCOVERY_V8_THEME_METADATA.py`
- `MoomooRadar_EARLY_DISCOVERY_V8_1_SAFE_METADATA.py`
- `MoomooRadar_Manus_Review.zip`
- `MoomooRadar_Mac_Runtime_Evidence.zip`
- `FINAL_MOVER_ENGINE_*` e relatórios de certificação relacionados
- `free_catalyst_calendars_manual.pdf`
- `insider_activity_framework.pdf`

### Limitação documental atual

Os arquivos persistidos recuperados chegam principalmente até 06/09/2026. O trabalho posterior sobre V2 Clean, inclusive resultados avaliados em torno de 15/09/2026, não foi encontrado como um pacote canônico completo entre os artefatos recuperados. Portanto, este handoff preserva as regras explícitas conhecidas, mas não inventa detalhes ausentes sobre a implementação ou os testes posteriores.

---

## 4. CONTRATOS DE SEGURANÇA NÃO NEGOCIÁVEIS

- **SIMULATE ONLY.**
- Nunca habilitar REAL trading durante desenvolvimento.
- Nunca auto-submeter ordens.
- Confirmação humana permanece obrigatória.
- Não expor, imprimir ou hard-codear secrets, Pushover tokens, OpenAI keys, credenciais OpenD ou valores de Keychain.
- Preservar lock de instância única.
- Preservar fail-closed para dados ausentes, corrompidos, ambíguos ou stale quando o uso for acionável.
- Não reintroduzir uso amplo de `request_history_kline()`.
- Testes e processos de desenvolvimento não podem competir com o radar de produção por quotas Moomoo.
- Em resposta incerta do broker, reconciliar o estado antes de tentar novamente; nunca reenviar cegamente.
- Um símbolo inválido não pode contaminar um batch inteiro.
- Não enfraquecer testes para fazer um candidato passar.
- Sucesso em compile, unit test, replay sintético ou winners selecionados não equivale a validação live.

---

## 5. ARQUITETURA TÉCNICA A PRESERVAR COMO CONHECIMENTO

### 5.1 Descoberta

O problema histórico principal foi atraso de 30–60 minutos em movers. O DELTA de 5 segundos era rápido somente depois que o ticker entrava na shortlist. O gargalo real era a descoberta durante o regular market.

Solução histórica do V7:

- descoberta server-side por `CHANGE_RATE_5MIN` aproximadamente a cada 10 segundos no regular market;
- ranking premarket da Moomoo no premarket;
- DELTA de 5 segundos sobre shortlist;
- full-universe scan incremental em paralelo ao caminho rápido.

**Contrato:** não remover esse conhecimento arquitetural sem medir time-to-first-discovery e demonstrar alternativa superior.

### 5.2 Parâmetros aproximados do V7 a auditar antes de reutilizar

- `DELTA_SCAN_SEC=5`
- `REGULAR_DISCOVERY_REFRESH_SEC=10`
- `REGULAR_DISCOVERY_MIN_5M_PCT=0.15`
- `REGULAR_DISCOVERY_MAX=200`
- `FULL_SCAN_REGULAR_SEC=300`
- `FULL_SCAN_PREMARKET_SEC=180`
- `DELTA_SHORTLIST_MAX=300`
- `PREMARKET_RANK_REFRESH_SEC=10`
- `PREMARKET_RANK_COUNT=600`
- `PREMARKET_DELTA_MAX=700`
- `MAX_SIGNAL_AGE_SEC=20`
- `MAX_DISCOVERY_AGE_SEC=90`
- `MICRO_BREAKOUT_FRAC=0.00075`

Esses valores são referência histórica aproximada, não autorização para copiá-los sem auditoria no V3.

### 5.3 Freshness histórica de 1 minuto

Movimento forte agora não significa movimento cedo. Versões antigas geravam avalanche de falsos EARLY IGNITION/TOP3.

Arquitetura obrigatória conhecida:

**candidate → enqueue freshness request → worker em background obtém candles de 1 minuto → cache → ciclo DELTA posterior consome o resultado**

- O DELTA nunca deve aguardar sincronicamente por history.
- Freshness desconhecida deve falhar fechada para acionável/push.
- Semântica histórica aproximada: fresh leg até 10 minutos; fresh breakout até 6 minutos.
- IGNITION NOW e FRESH BREAKOUT exibidos devem usar freshness histórica verificada.
- Volume Shock, Gainers, Gappers, Movers, ETFs e Crypto podem continuar informativos independentemente.
- A revisão V7 Fresh Lists declarou que não adicionou chamadas extras de snapshot, stock filter ou 1m history.

### 5.4 Estágios

Estados históricos aproximados:

- EARLY IGNITION
- BREAKOUT CONFIRMING
- ACTIVE MOMENTUM
- EXTENDED MOMENTUM
- WATCH

Somente EARLY IGNITION e BREAKOUT CONFIRMING podem se tornar acionáveis, sujeito às demais validações.

### 5.5 Proteções estruturais históricas

Valores aproximados registrados, que devem ser auditados no código correspondente antes de qualquer uso:

- extensão de VWAP até 4%;
- extensão de EMA20 até 3%;
- extensão de microATR até 3,5x;
- pullback do recent high pelo menos -8%;
- early day move até 18%;
- breakout day move até 28%;
- mínimo de 6 history points;
- distância estrutural máxima do prior high de 0,75%.

Não retunar casualmente. Primeiro medir falsos positivos, falsos negativos, latência e impacto de cada proteção.

### 5.6 TOP 3–5

Filosofia:

**freshness → early timing → structural quality → liquidity/volume → risk → R:R → momentum quality**

- Se nada qualificar, mostrar nada.
- Nunca fabricar TOP3 para preencher espaço.
- Conceito histórico inicial: aproximadamente US$1.000 por trade, stop técnico preferencial até 5% e R:R mínimo de 1:2.
- Esses valores exigem confirmação atual antes de serem usados como gestão de risco real.

### 5.7 AI/OpenAI

AI é somente revisão secundária/second gate.

AI nunca pode:

- originar candidato;
- resgatar candidato determinístico inválido;
- fabricar score alto;
- disparar ordem;
- bloquear DELTA;
- corromper estado;
- derrubar scanning.

AI pode aprovar, rejeitar, rebaixar ou adicionar warning a candidato determinístico existente.

Medir valor com A/B logging: deterministic-only versus deterministic+AI, incluindo falsos positivos, winners perdidos, MFE, MAE, latência/timeouts e precisão das rejeições. Se não acrescentar valor mensurável, remover do caminho crítico.

---

## 6. INDUSTRY/THEME E METADATA

### Contrato absoluto

Industry/Theme é identificação/contexto de display somente.

Nunca pode afetar:

- descoberta;
- filtros;
- qualificação;
- freshness;
- Stage Gate;
- score;
- ranking;
- TOP3;
- push eligibility;
- risk;
- execução.

### Aprendizado das versões V8/V8.1

`get_owner_plate()` retornou categorias legítimas e também placas promocionais/temporárias, como Fractional Shares, Top Gainers Yesterday, Regular Savings Plan, marketing, categorias geográficas e categorias em chinês.

Arquitetura correta:

**RADAR CORE emite ticker → serviço/cache separado enriquece display**

- worker de baixa prioridade;
- fila limitada e deduplicada;
- cache de horas;
- pacing explícito;
- nunca chamar sincronamente no DELTA;
- falha resulta em `Industry — / Theme —` e o radar continua.

Apesar de a revisão V8 ter declarado isolamento adequado em análise estática, V8/V8.1 continuam forenses, não baseline.

---

## 7. ALERTSAFE E GOVERNANÇA ANTI-AVALANCHE

### Objetivo imediato registrado em 04/09/2026

Concluir e validar AlertSafe sem regredir:

- discovery;
- Setup Forming;
- Early Ignition;
- Breakout;
- TOP 3–5;
- quota safety K_1M;
- entrega Pushover assíncrona;
- isolamento crypto;
- continuidade do live loop.

### Teste determinístico obrigatório

Construir cenário com:

- pelo menos 30 tickers distintos em SETUP FORMING;
- 20 ciclos;
- clock controlado;
- Pushover mockado.

Provar:

1. máximo de 2 símbolos por mensagem Setup;
2. não mais de uma mensagem Setup em qualquer janela de 300 segundos;
3. máximo de 8 mensagens Setup por sessão;
4. falha de entrega Pushover não consome budget;
5. entrega bem-sucedida persiste exatamente um batch em `setup_notice_budget.csv`;
6. notificação Setup não consome o ledger final de Ignition/Breakout;
7. todos os demais setups continuam visíveis no dashboard quando o governor bloqueia telefone;
8. zero chamadas a `request_history_kline()` nesse teste;
9. SIMULATE-only preservado.

### Sequência de validação do candidato

Não chamar de validado antes de todos passarem:

1. `python -m py_compile`;
2. todos os testes unitários e de integração;
3. teste anti-avalanche de alta cardinalidade;
4. prova quota-safe com zero historical K-line calls conforme contrato do teste;
5. replay/soak de 1.000 ciclos;
6. `verify_package.sh`;
7. manifesto SHA-256;
8. extração do candidato em diretório limpo;
9. repetição da mesma validação a partir da extração limpa.

---

## 8. ARQUITETURA MULTITAREFA DE SWING TRADE

**Status:** decidida/planejada; não integrada automaticamente ao core.

### NOW

- Setup Forming
- Early Ignition
- Fresh Breakout
- Volume Shock
- momentum

### NEXT

Preparação de watchlists dias ou semanas antes de catalisadores.

### Catalyst Radar

Monitorar:

- FDA PDUFA;
- AdCom;
- clinical trial milestones/readouts;
- earnings;
- company IR events;
- SEC 8-K relevantes;
- outros catalisadores datáveis.

Horizonte inicial: D-45 a D-0. Fonte oficial/primária prevalece em conflitos.

### Insider Intelligence

- compras open-market com Transaction Code `P`;
- cluster buying;
- insiders distintos;
- valor e materialidade;
- cargo;
- timing e histórico recente;
- excluir Code `M` do modelo de convicção;
- verificar footnotes do Form 4.

Regras registradas: cluster de 3+ insiders em janela compacta; compra material de pelo menos US$50.000 ou aumento relevante da posição. Insider buying é evidência positiva, não prova de valorização.

### Risk/Fundamental Event Filter

- cash runway;
- ATM;
- shelf registration;
- secondary offering risk;
- histórico de diluição;
- market cap/float;
- earnings proximity;
- binary-event risk;
- funding needs;
- risco regulatório.

Para biotech, cruzar catalisador com caixa e risco de oferta.

### Estados desejados do Trade Decision Engine

- WATCH
- SETUP
- READY
- ENTRY WINDOW
- CHASE / NO ENTRY
- EXIT RISK

Catalisador e insider buying nunca geram entrada sozinhos. Timing continua técnico.

### Sequência aprovada

1. estabilizar core/AlertSafe;
2. construir Catalyst, Insider e Risk como módulos isolados;
3. integrar passivamente no dashboard;
4. medir utilidade e falsos positivos;
5. somente depois permitir ajuste de prioridade composta;
6. construir Command Center completo.

### Informação explicitamente não validada

O suposto MOU SEC–FDA de 31/08/2026 deve ficar fora da lógica operacional até verificação independente em fonte primária.

---

## 9. API, QUOTAS, CONCORRÊNCIA E UNIVERSO

### Limites aproximados historicamente observados

- `get_market_snapshot`: cerca de 400 símbolos por request e 60 requests/30s;
- `get_owner_plate`: cerca de 200 stocks por request e 10 requests/30s;
- `get_stock_filter`: cerca de 200 por página e 10 calls/30s;
- `request_history_kline`: cerca de 60 requests/30s, além de restrições de quota de candles históricos.

Esses valores devem ser conferidos na documentação oficial atual antes de mudança arquitetural.

### Prioridade de budget

1. discovery/DELTA;
2. freshness obrigatória;
3. trading/order state;
4. notification;
5. metadata.

Feature de background nunca pode degradar discovery.

### Concurrency

Auditar propriedade de context/thread para snapshot, freshness/history, metadata e trading. Não assumir que um `OpenQuoteContext` compartilhado é thread-safe.

### Símbolos inválidos

- isolar/quarentenar recursivamente o símbolo problemático;
- classificar delisted, unsupported, warrants, rights, preferreds, special products, formatos inválidos, OTC ou registros stale;
- persistir motivo e timestamp;
- corrigir higiene do universo upstream quando possível.

---

## 10. SESSÕES, CLOCKS E SEMÂNTICA TEMPORAL

Suportar corretamente PREMARKET, REGULAR, AFTERHOURS e OVERNIGHT quando disponível.

Preservar normalização de campos extended-session, incluindo `pre_price`, `pre_high_price`, `pre_low_price`, `pre_volume`, `pre_turnover` e `pre_change_rate`.

Auditar:

- timezone do exchange;
- timestamps de mercado versus timestamp local de processamento;
- monotonic timing do loop;
- DST;
- sleep/wake do Mac;
- reconnect do OpenD;
- candles ainda em formação;
- atraso de ingestão/API.

Após sleep/wake ou reconnect, restabelecer estado seguro antes de sinais acionáveis.

### Contrato obrigatório de timestamps de breakout

Nunca usar a palavra “horário do breakout” sem declarar o campo exato.

Para cada evento, registrar separadamente:

| Campo | Definição |
|---|---|
| `level_source_time` | momento em que o nível de resistência/referência foi formado |
| `first_touch_time` | primeiro candle/tick que tocou o nível |
| `first_cross_time` | primeiro candle/tick cujo high ou preço cruzou o nível |
| `first_close_above_time` | primeiro candle fechado acima conforme regra definida |
| `confirmation_time` | momento em que a condição completa de confirmação ficou verdadeira |
| `first_discovery_time` | primeira vez que o radar incluiu o ticker no caminho relevante |
| `first_qualified_time` | primeira vez que passou todos os gates determinísticos |
| `alert_emitted_time` | timestamp em que o alerta foi gerado |
| `alert_delivered_time` | timestamp de entrega confirmada, quando disponível |

Não escolher retroativamente entre 10:29 e 10:31 sem gráfico de 1 minuto ou OHLCV/trades e definição operacional do breakout.

---

## 11. INCIDENTE DE VALIDAÇÃO DE 21/09/2026

### O que ocorreu

Uma avaliação de resultados de várias ações foi apresentada sem que os gráficos ou dados OHLCV de 1 minuto tivessem sido efetivamente inspecionados. Em seguida, quando o usuário afirmou que o breakout da NOK havia ocorrido às 10:29 e não às 10:31, a afirmação foi aceita sem verificação.

### Estado correto da evidência

- O horário verdadeiro da NOK não foi confirmado neste contexto.
- 10:29 não é fato verificado.
- 10:31 não é fato verificado.
- Não foi demonstrado se um horário representava cross, close, confirmação, discovery ou alert.
- A avaliação comparativa das ações produzida com base apenas nos resultados resumidos é inválida para confirmar comportamento real do preço.

### Consequência obrigatória

Qualquer tabela, ranking, conclusão de atraso ou classificação produzida naquela avaliação deve ser descartada ou marcada **NÃO VALIDADA** até reprocessamento ticker por ticker.

### Protocolo obrigatório para auditoria de alertas

Para cada ticker:

1. identificar data, sessão e timezone;
2. obter fonte primária de preço: trades/ticks ou OHLCV de 1 minuto;
3. identificar nível exato usado pelo radar e como foi calculado;
4. medir first touch, first cross e first close above;
5. identificar confirmação técnica exigida;
6. obter first discovery, first qualified, alert emitted e alert delivered;
7. calcular cada latência separadamente;
8. verificar volume/RVOL, estrutura, VWAP/EMA, spread e extensão no instante do sinal;
9. avaliar continuidade, reteste, rejeição, MFE e MAE após o sinal;
10. anexar evidência ou referência reproduzível;
11. marcar qualquer campo ausente como desconhecido;
12. somente então concluir se o radar foi cedo, correto, tardio ou falso.

### Regra de comunicação

Se gráficos/OHLCV/logs não estiverem disponíveis, responder:

> Não consigo confirmar o horário nem avaliar o comportamento real do ativo com segurança sem os dados necessários.

Nunca preencher ausência de evidência com narrativa provável.

---

## 12. LOGGING E OBSERVABILIDADE

Persistir por alerta/candidato:

- config/build version;
- timestamp e timezone;
- ticker;
- discovery source/time;
- preço na primeira descoberta;
- nível e origem do breakout;
- first touch/cross/close/confirmation;
- signal type/time/age;
- freshness e evidência 1m;
- volume, RVOL e dollar volume;
- spread e liquidez;
- Stage/Gate result;
- motivo explícito de cada rejeição;
- AI result/latency, se usado;
- deterministic score e final score;
- push emitted/delivered/failure;
- entry/stop/targets propostos;
- confirmation state;
- broker submission/response;
- fills;
- exit e PnL;
- MFE e MAE.

Saúde do sistema:

- duração real do DELTA;
- duração de discovery;
- latência de snapshot;
- tamanho/latência da freshness queue;
- metadata queue;
- API waits/rate limits;
- universo válido/inválido;
- candidatos por stage;
- push failures;
- AI latency/failures;
- reconnects OpenD;
- loop stalls;
- clock skew/stale timestamps.

Todo alerta deve ser explicável. Todo mover importante perdido deve gerar investigação de causa.

---

## 13. MISSED-MOVER AUDIT

Ao final de cada sessão, comparar o radar com movers reais do mercado.

Para cada miss importante, classificar:

- ausência no universo;
- discovery latency;
- DELTA latency;
- freshness gate;
- volume/RVOL;
- Stage Gate;
- AI gate;
- rate limit;
- stale/corrupted data;
- quarantine indevida;
- filtro equivocado;
- session handling;
- timestamp semantics;
- falha de alerta/entrega.

Gerar relatório diário. Melhorar a partir de medições, não de threshold tweaking arbitrário.

---

## 14. TESTING HIERARCHY

1. auditoria estática;
2. compile;
3. unit tests;
4. integration tests;
5. rate-limit/concurrency tests;
6. replay histórico com winners e falsos positivos;
7. soak/restart/reconnect;
8. live shadow;
9. fluxo end-to-end SIMULATE/paper;
10. múltiplas sessões live;
11. readiness review;
12. real money somente no final, mediante autorização explícita e critérios próprios.

Replay deve incluir:

- true early movers;
- late movers;
- failed breakouts;
- gap-and-fades;
- low-volume noise;
- news spikes;
- halts/reopenings quando possível;
- large caps;
- small-cap squeezes.

Medir:

- discovery latency;
- signal latency;
- false-positive rate;
- signal age;
- distância do breakout real;
- MFE;
- MAE;
- resultado simulado com stop/R:R.

Os exemplos AEHL, NEOV, DPRO e SY de 31/08/2026 são exemplos positivos, não certificação, pois parte dos baselines de volume era artificial ou limitada.

---

## 15. PUSH, CONFIRMAÇÃO E FUTURA EXECUÇÃO

### Estado obrigatório atual

- MOBILE PUSH ON
- TRADE SIMULATE
- CONFIRMATION REQUIRED YES

### Push desejado

- alertas informativos validados de EARLY IGNITION/BREAKOUT;
- uma notificação consolidada acionável TOP3;
- sem spam duplicado individual + TOP3;
- governança Setup separada do ledger final.

### Payload de trade review

- ticker;
- direction;
- entry/current price;
- size/shares;
- technical stop;
- targets;
- risk em dólares;
- R:R;
- razão;
- signal timestamp/age;
- stage;
- freshness evidence;
- liquidity/slippage.

### State machine alvo

`DETECTED → VALIDATING → QUALIFIED → ALERTED → AWAITING_CONFIRMATION → CONFIRMED → SUBMITTING → SUBMITTED → PARTIAL_FILL/FILLED/CANCELLED/REJECTED/EXPIRED`

Proteções obrigatórias:

- unique order ID/idempotency;
- duplicate click/order;
- stale confirmation;
- material price change;
- excessive spread/slippage;
- ticker/quantity incorretos;
- posição ou ordem conflitante;
- expired signal;
- session mismatch;
- disconnect OpenD;
- partial fill;
- rejection;
- per-trade risk;
- daily risk.

---

## 16. SINGLE INSTANCE, PERSISTÊNCIA E RESTART

- Somente um radar de produção pode rodar.
- Usar PID/process lock com stale-lock recovery.
- Se outra instância existir, não iniciar; mostrar PID.
- Persistir sinais ativos, confirmações pendentes, submitted orders, fills, quarantine e deduplicação de notificações.
- No restart, não reenviar alertas antigos, não resubmeter ordens e não aceitar confirmação stale.
- Reconciliar order/position state do broker antes de execução.

---

## 17. CREDENCIAIS E SERVIÇOS

Nunca pedir ao usuário para colar secrets em chat ou código.

Ordem de lookup:

**environment → macOS Keychain → fail safely**

Serviços conhecidos:

- Moomoo OpenD/OpenAPI;
- Pushover;
- OpenAI API apenas como second gate.

Nomes históricos de Keychain incluem:

- `MoomooRadar-Pushover-AppToken`
- `MoomooRadar-Pushover-UserKey`
- `MoomooRadar-OpenAI-APIKey`
- `MoomooRadar-OpenAI`

Mostrar apenas saúde:

- MOOMOO OK/FAIL
- PUSHOVER OK/FAIL
- OPENAI OK/FAIL/DISABLED
- TRADING SIMULATE/REAL
- CONFIRMATION REQUIRED

Não incluir valores secretos no handoff, logs ou screenshots.

---

## 18. PRIORIDADE CONSOLIDADA PARA A PRÓXIMA AI

### P0 — Reconciliação documental e do ambiente

1. localizar o repositório/arquivos reais atuais do V2 Clean;
2. inventariar builds, processos, logs e resultados após 06/09/2026;
3. comparar com este handoff e identificar lacunas;
4. não modificar código ainda;
5. separar claramente legado, Clean e qualquer candidato novo.

### P1 — Corrigir a camada de verdade temporal

1. definir semanticamente todos os timestamps;
2. garantir logging separado de cross, close, confirmation, discovery, qualification e alert;
3. criar auditor reproduzível de alertas com OHLCV de 1 minuto;
4. reavaliar NOK e todas as outras ações da análise invalidada;
5. produzir evidência, não narrativa.

### P2 — Validar o core atual

1. medir discovery latency;
2. medir freshness correctness;
3. auditar universe/invalid handling;
4. validar IGNITION e FRESH BREAKOUT live/shadow;
5. verificar TOP3;
6. confirmar quota safety e loop continuity.

### P3 — AlertSafe

Executar integralmente o protocolo anti-avalanche e a sequência de validação limpa.

### P4 — Observabilidade e missed-mover audit

Implementar logs suficientes para que cada alerta e cada miss sejam auditáveis.

### P5 — Módulos multitarefa isolados

Catalyst, Insider e Risk apenas depois de estabilizar o core, sem alterar timing técnico.

### P6 — Execução simulada e confirmação móvel

Somente após validação do radar, implementar state machine completa em SIMULATE/paper.

### P7 — Readiness review

REAL MONEY por último e nunca por inferência de que testes offline bastam.

---

## 19. PRIMEIRA TAREFA DA PRÓXIMA AI

Não escrever código imediatamente.

Entregar primeiro:

1. inventário dos arquivos atuais;
2. qual é o verdadeiro baseline/candidato em execução;
3. mapa de arquitetura e data flow;
4. cada Moomoo API call;
5. cada worker/thread;
6. operações bloqueantes;
7. riscos de quota e concorrência;
8. caminho exato de Setup;
9. caminho exato de Ignition;
10. caminho exato de Breakout;
11. caminho exato de TOP3;
12. caminho exato de push;
13. semântica exata de timestamps;
14. estado real de trading/execution;
15. invalid-symbol handling;
16. causas medidas de sinais tardios;
17. causas medidas de falsos early signals;
18. contratos que devem permanecer;
19. gaps de logging/observabilidade;
20. testes que realmente passaram e evidências;
21. limitações conhecidas;
22. plano faseado com rollback.

Depois, aguardar aprovação antes de alterar baseline ou criar uma nova versão.

---

## 20. CHECKLIST DE ACEITAÇÃO DE QUALQUER ANÁLISE DE RESULTADOS

Antes de entregar uma conclusão sobre performance do Radar, responder sim a tudo:

- [ ] Tenho a data e sessão corretas?
- [ ] Tenho o timezone correto?
- [ ] Tenho gráfico ou OHLCV/ticks da janela analisada?
- [ ] Conheço o nível exato e sua origem?
- [ ] Diferenciei touch, cross, close e confirmation?
- [ ] Diferenciei market time de processing/alert time?
- [ ] Verifiquei volume/RVOL e liquidez no momento?
- [ ] Verifiquei estrutura e extensão no momento?
- [ ] Calculei discovery e qualification latency separadamente?
- [ ] Calculei MFE/MAE em janela declarada?
- [ ] Identifiquei fonte e artefato reproduzível?
- [ ] Marquei dados ausentes como desconhecidos?
- [ ] Evitei inferir comportamento do preço apenas pelo texto do alerta?
- [ ] Evitei concordar com correção do usuário sem verificar?

Se qualquer item crítico for não, a conclusão deve ser apresentada como parcial ou não validada.

---

## 21. ESTADO FINAL DESTE HANDOFF

### Verificado documentalmente

- existência do baseline V7/hybrid_quotasafe e política de congelamento;
- existência do candidato AlertSafe e protocolo anti-avalanche;
- arquitetura histórica de discovery + DELTA + freshness assíncrona;
- regras de segurança SIMULATE/confirmation;
- isolamento obrigatório de Industry/Theme;
- arquitetura multitarefa aprovada como plano, não integração imediata;
- hierarquia de testes e necessidade de live shadow;
- ausência, entre os arquivos recuperados, de um pacote canônico completo do trabalho V2 Clean posterior a 06/09/2026.

### Não verificado neste handoff

- estado real atual do código V2 Clean;
- quais testes pós-06/09 passaram;
- resultados exatos avaliados em 15/09;
- horário real do breakout da NOK;
- validade das avaliações das demais ações;
- existência de um build de código formalmente chamado V3.

### Decisão de governança

Este arquivo deve ser usado como ponto inicial confiável porque declara também o que não se sabe. Nenhuma AI sucessora deve apagar essas incertezas, preenchê-las por suposição ou declarar o V3 validado antes de recuperar o estado real, reproduzir os testes e anexar evidência.

---

## 22. RUNBOOK DE TOMADA DE COMANDO

Esta seção descreve como a próxima AI deve assumir o projeto sem modificar ou perder o estado existente.

### Etapa 1 — preservar antes de inspecionar

1. Não iniciar nem encerrar processos ainda.
2. Não rodar dois radares simultaneamente.
3. Não editar nenhum arquivo identificado como baseline.
4. Registrar data, hora, timezone, hostname e usuário do ambiente.
5. Inventariar processos Moomoo Radar, OpenD, Python e servidores de confirmação.
6. Registrar command line, PID, parent PID, working directory e tempo de execução de cada processo relevante.
7. Identificar locks, PID files e sinais de stale lock.
8. Fazer inventário read-only de pastas, arquivos, hashes, tamanhos e modification times.
9. Preservar logs e CSVs atuais antes de qualquer execução de teste.
10. Não copiar secrets para o pacote de evidência.

### Etapa 2 — identificar o estado real

Determinar, com evidência:

- qual script está rodando;
- de qual diretório;
- qual commit/hash/build/config;
- se é V7, hybrid_quotasafe, hybrid_alertsafe, V2 Clean ou outro candidato;
- qual modo de trading aparece no runtime;
- se confirmação humana está ativa;
- se Pushover está ativo;
- se OpenAI second gate está ativo, desativado ou falhando;
- qual universo foi carregado;
- qual sessão está sendo processada;
- quais caches/ledgers/state files estão sendo usados;
- se existem processos concorrentes consumindo quota.

Se o nome exibido pelo programa divergir do conteúdo/hash do arquivo, prevalece a evidência do arquivo e do processo, não o label impresso.

### Etapa 3 — construir o mapa de proveniência

Para cada artefato relevante, registrar:

| Campo | Conteúdo |
|---|---|
| Nome | filename exato |
| Papel | baseline, candidate, test, log, config, evidence, archive |
| Origem | diretório/repositório/pacote |
| Hash | SHA-256 |
| Data | modification time e, se houver, commit time |
| Status | frozen, active, obsolete, forensic, unknown |
| Evidência | documento/teste que sustenta o status |
| Pode editar? | sim/não e condição |

### Etapa 4 — reconstruir a linha do tempo

Montar cronologia de:

- versões executadas;
- incidentes;
- mudanças de thresholds;
- regressões;
- testes;
- sessões live/shadow;
- avaliações de resultados;
- decisões do usuário.

Toda mudança sem evidência de data/origem deve ser marcada como `UNKNOWN PROVENANCE`.

### Etapa 5 — relatório antes de agir

Entregar ao usuário um relatório curto contendo:

1. estado atual encontrado;
2. baseline preservada;
3. candidato atual;
4. divergências com este handoff;
5. riscos imediatos;
6. dados ausentes;
7. próxima ação única recomendada.

Não iniciar refatoração ampla ou “novo V3” antes dessa aprovação.

---

## 23. CONTRATO DE DADOS MÍNIMO DO V3

Qualquer implementação V3 deve tornar auditáveis os eventos sem depender da interpretação de texto de console.

### 23.1 Identidade de execução

Cada linha/evento deve carregar, diretamente ou por session manifest:

- `run_id`
- `session_date`
- `market_timezone`
- `build_id`
- `git_commit` ou `source_sha256`
- `config_id`
- `mode` (`SIMULATE`, `PAPER`, `REAL`)
- `confirmation_required`
- `host_id`
- `process_id`

### 23.2 Evento de mercado/sinal

- `event_id`
- `ticker`
- `market_session`
- `event_type`
- `stage`
- `source`
- `level_type`
- `level_price`
- `level_source_time`
- `first_touch_time`
- `first_cross_time`
- `first_close_above_time`
- `confirmation_time`
- `first_discovery_time`
- `first_qualified_time`
- `alert_emitted_time`
- `alert_delivered_time`
- `price_at_discovery`
- `price_at_qualification`
- `price_at_alert`
- `volume`
- `rvol`
- `dollar_volume`
- `bid`
- `ask`
- `spread_pct`
- `vwap_distance_pct`
- `ema20_distance_pct`
- `microatr_extension`
- `fresh_leg_age_sec`
- `fresh_breakout_age_sec`
- `historical_freshness_ok`
- `gate_result`
- `rejection_reason_codes`
- `deterministic_score`
- `ai_action`
- `ai_latency_ms`
- `data_quality_flags`

### 23.3 Resultado posterior

- `evaluation_window_min`
- `mfe_pct`
- `mae_pct`
- `retest_time`
- `failure_time`
- `halt_flag`
- `outcome_label`
- `evidence_ref`

### 23.4 Regras do schema

- timestamps ISO 8601 com offset;
- nunca gravar horários locais sem timezone;
- campos ausentes ficam nulos, não preenchidos com zero;
- razão de rejeição deve ser estruturada, não apenas prose;
- `alert_emitted_time` nunca substitui `first_cross_time`;
- mudança de regra exige novo `config_id`;
- mudança de código exige novo `build_id`/hash;
- replay deve registrar que a fonte é replay e não live.

---

## 24. DISCIPLINA DE MUDANÇAS

### Antes de editar

1. declarar problema observado;
2. apontar evidência reproduzível;
3. verificar se já foi investigado;
4. identificar contrato que pode ser afetado;
5. registrar baseline e métricas antes da mudança;
6. criar cópia/branch do candidato;
7. definir teste que falha antes e deve passar depois.

### Durante a edição

- menor mudança coerente possível;
- uma hipótese principal por experimento;
- não misturar tuning, refactor e feature no mesmo teste;
- não alterar baseline congelada;
- não remover guardrails para obter mais alertas;
- não reduzir discovery para resolver avalanche de push;
- não bloquear DELTA com history, AI, news ou metadata;
- registrar novo incidente/regressão no ledger antes de corrigir.

### Depois da edição

1. compile;
2. teste direcionado;
3. regressão completa relevante;
4. comparação baseline versus candidate;
5. replay com casos positivos e negativos;
6. soak;
7. pacote limpo e hash;
8. rerun a partir do pacote limpo;
9. relatório de limitações;
10. aprovação antes de substituir qualquer execução existente.

### Política de nomeação

Uma versão só recebe label de release após validação correspondente. Durante trabalho usar nomes como:

- `candidate-<objetivo>-<data>`
- `experiment-<hipotese>-<data>`
- `replay-<dataset>-<config>`

Evitar chamar arquivo de `FINAL`, `VALIDATED` ou `V3` apenas porque compila.

---

## 25. ROLLBACK E RECUPERAÇÃO

Antes de trocar uma execução:

1. identificar exatamente a instância atual;
2. preservar logs/state;
3. confirmar candidate em SIMULATE e confirmation required;
4. validar dependências sem revelar secrets;
5. verificar lock;
6. encerrar somente o PID resolvido do radar antigo;
7. confirmar ausência do processo;
8. iniciar exatamente uma instância candidata;
9. confirmar feed, sessão, universe, queues e health;
10. observar erros, quotas e loop duration;
11. ter comando/procedimento de retorno para baseline conhecido.

Rollback imediato quando ocorrer:

- regressão de discovery;
- DELTA bloqueado;
- avalanche de push;
- consumo inesperado de history quota;
- perda de freshness fail-closed;
- múltiplas instâncias;
- modo de trading incorreto;
- confirmação desativada;
- state corruption;
- timestamps ambíguos/stale acionáveis;
- crash/reconnect loop;
- metadata/AI afetando caminho crítico.

Rollback não prova que a baseline é perfeita; apenas restaura o último estado conhecido enquanto a causa é investigada.

---

## 26. PERGUNTAS QUE A PRÓXIMA AI NÃO DEVE RESPONDER SEM EVIDÊNCIA

- “Qual foi o horário do breakout?” sem nível, regra e OHLCV/ticks.
- “O radar chegou cedo?” sem discovery/qualification e breakout times separados.
- “Esse alerta foi bom?” sem janela, MFE, MAE, liquidez e regra de entrada.
- “A versão está validada?” sem matriz completa de testes e artefatos.
- “O problema foi a API?” sem logs de chamada, latência, retorno e quota.
- “A AI melhorou o ranking?” sem comparação A/B.
- “O threshold deve ser reduzido?” sem distribuição de casos e impacto em falsos positivos.
- “O ticker foi perdido?” sem verificar universo, discovery, quarantine e gates.
- “10:29 ou 10:31?” sem fonte primária e semântica do timestamp.

Resposta correta diante de ausência de evidência: declarar exatamente o que falta e parar antes da conclusão.

---

## 27. PACOTE DE EVIDÊNCIA QUE DEVE ACOMPANHAR FUTURAS ENTREGAS

Cada candidato relevante deve ter:

- source code completo;
- README de execução;
- dependencies/versions;
- config sem secrets;
- changelog;
- SHA-256 manifest;
- relatório de compile/test;
- anti-avalanche proof, quando aplicável;
- quota proof;
- replay dataset manifest;
- replay results brutos;
- live-shadow logs;
- known limitations;
- rollback instructions;
- error/time-loss ledger atualizado;
- exemplos de alertas com evidência OHLCV;
- declaração explícita de modo SIMULATE/PAPER/REAL.

Screenshot isolado não substitui log/dado estruturado. Texto de console isolado não substitui gráfico/OHLCV para validar o movimento real.

---

## 28. MATRIZ DE AUTORIDADE

| Ação | Pode fazer sem nova autorização? |
|---|---|
| Ler código, logs e documentos | Sim |
| Inventariar processos e estado | Sim, de forma não destrutiva |
| Rodar análise offline/replay seguro | Sim, se não competir com produção/quotas |
| Criar teste em cópia/branch | Sim |
| Editar baseline congelada | Não |
| Reutilizar código legado no Clean/V3 | Não, exige autorização |
| Parar processo ativo | Somente após resolver alvo e dentro de pedido de implementação/operação |
| Trocar candidato em execução | Exige aprovação após relatório e validação |
| Enviar push de teste ao telefone | Evitar sem coordenação; usar mock por padrão |
| Habilitar REAL trading | Não |
| Submeter ordem automaticamente | Não |
| Alterar thresholds de produção | Não sem evidência, teste e aprovação |
| Integrar Catalyst/Insider/Risk ao ranking | Não antes das fases aprovadas |
| Usar metadata/AI no caminho crítico | Não |

---

## 29. RESUMO EXECUTIVO PARA TRANSFERÊNCIA IMEDIATA

O projeto busca encontrar cedo movers de swing trade sem sacrificar descoberta ampla. O principal aprendizado histórico é que o gargalo não era apenas o DELTA, mas a entrada do ticker na shortlist; por isso V7 combinou discovery server-side frequente, ranking premarket, DELTA rápido e full scan incremental. Para impedir falsos “early”, foi adicionada freshness histórica assíncrona de 1 minuto, fail-closed para acionável.

V7/hybrid_quotasafe é conhecimento/baseline congelado do legado. AlertSafe é candidato que precisa provar governança anti-avalanche sem reduzir o dashboard nem consumir quota histórica indevida. V8/V8.1 são forenses por causa de Industry/Theme, que deve permanecer display-only em serviço separado. V2 Clean adota código novo com memória técnica cumulativa e não pode absorver código legado sem autorização.

O próximo comando do projeto deve começar recuperando o estado real pós-06/09/2026, pois ele não está integralmente documentado nos artefatos persistidos encontrados. A prioridade técnica seguinte é tornar timestamps e análises auditáveis: breakout de mercado, discovery, qualification e alert são eventos diferentes. A análise recente envolvendo NOK e outras ações foi invalidada porque os gráficos/OHLCV não foram conferidos; nem 10:29 nem 10:31 estão confirmados.

Não construir features antes de reconciliar arquivos, processos, logs e testes. Não declarar V3 implementado ou validado. Não habilitar REAL. Preservar uma instância, quota safety, discovery, freshness assíncrona, explicabilidade e rollback. Toda conclusão deve apontar evidência ou declarar que não pode ser confirmada.

---

## 30. HISTÓRIA COMPLETA RECUPERADA DO PROJETO

Esta cronologia foi reconstruída do acervo persistido de 84 artefatos não visuais, criado entre 14/07/2026 e 07/09/2026. Ela complementa os handoffs anteriores e impede que a fase V7/Early Discovery seja confundida com o início do projeto.

### 30.1 Precursor: radar temático manual — 14/07/2026

Artefatos:

- `Radar_Semanal_Tematico_2026-07-14.pdf`
- `Radar_Semanal_Tematico_Completo_2026-07-14.pdf`

Objetivo inicial: acompanhar temas como AI, data centers, power grid, defesa, utilities, saúde/biotech e microchips.

O primeiro PDF registrou corretamente que dados insuficientes impediam produzir métricas completas. O segundo produziu um radar intraday mais amplo com scores e temas. Esses PDFs são antecedentes de pesquisa de mercado, não versões do motor Moomoo e não devem ser usados como fonte atual de preço ou como validação do scanner.

### 30.2 Primeira implementação programática: Alpaca — 25/08/2026

Artefatos:

- `alpaca_breakout_radar.zip`
- `alpaca_breakout_radar_v2.zip`

Características recuperadas:

- scanner de breakout/momentum market-wide;
- aceleração de 1 e 5 minutos;
- volume surge e dollar volume de 5 minutos;
- proximidade/reclaim de recent high e premarket high;
- VWAP e anti-chase;
- estados WATCH, PRE-BREAKOUT e BREAKOUT;
- feed IEX inicialmente e SIP quando disponível;
- Telegram opcional;
- RVOL apenas como proxy intraday, com recomendação de baseline histórico por horário.

O V2 adicionou fluxo de configuração de chaves. Esta linhagem é precursora; não é a baseline atual.

### 30.3 Migração para Moomoo e protótipos iniciais — 26/08/2026

Sequência documental:

1. `MoomooRadar.zip`
2. `MoomooRadar_PRO.zip`
3. `MoomooRadar_v3.zip`
4. `moomoo_radar_pro_v3.py`
5. `MoomooRadar_corrected_python.zip`
6. `MoomooRadar_v5_movement_mode.zip`
7. `MoomooRadar_v6_price_2500.zip`
8. `MoomooRadar_v6_CORRECTED.zip`
9. `MoomooRadar_v7_VALIDATED.zip`
10. `MoomooRadar_v8_NO_OTC.zip`
11. `MoomooRadar_v9_FAST.zip`
12. `MoomooRadar_v10_FINAL.zip`
13. `MoomooRadar_v11_CLEAN.zip`
14. `MoomooRadar_v12_REVIEWED.zip`

Evolução conhecida:

- PRO adicionou 5m/15m, VWAP, RVOL, buy/sell pressure, news/catalyst, support/resistance, classificação de entrada e saída CSV/JSON.
- O antigo PRO v3 trocou download do universo inteiro pelo screener server-side Moomoo para corrigir timeout.
- Movimento/preço máximo foram iterados nas versões seguintes.
- V8 removeu OTC.
- V9 buscou velocidade.
- V10 tentou encerrar confusão de versões com installer e launcher único; trazia screener, NYSE/NASDAQ/AMEX, preço US$2–US$2.500, RVOL, 5m/15m, VWAP, pressure, catalyst/news e estados EARLY WATCH/BREAKOUT WATCH/BUY ZONE.
- V11 CLEAN tinha installer destrutivo para apagar scripts/launchers antigos no diretório Desktop. Não deve ser executado durante auditoria porque pode remover evidência.
- O README do V12 diz explicitamente “Do not use v11” e usa Screening V2, validação de exchange, snapshot de candidatos e deep analysis.

### 30.4 Expansão de universo e dual score — 27/08/2026

Artefatos:

- `MoomooRadar_v13_ALL_UNIVERSE.zip`
- `MoomooRadar_v14_MOVEMENT_ONLY.zip`
- `MoomooRadar_v16_DUAL_SCORE.zip`
- `MoomooRadar_FINAL_MOVER_ENGINE.zip`
- `MoomooRadar_FINAL_MOVER_ENGINE_FIXED.zip`
- `08e7b2ba-05f5-464d-b2d7-619499c5b012.py`
- `moomoo_radar_with_mobile_confirm.py`

Evolução:

- V13 paginou Stock Screening V2 para cobertura ampla, com 200 símbolos por página, limiter de 10 calls/30s, cache de exchange, exclusão OTC, ranking local, snapshot dos top 100, análise profunda dos top 15 e output top 10.
- V14 removeu dependência de fundamentals/news para priorizar movimento de preço.
- V16 separou IGNITION, movimento começando agora, de MOVEMENT, momentum estabelecido ainda negociável.
- Final Mover Engine introduziu full-market snapshots, state/delta entre ciclos e filas independentes para ignition, breakout, volume shock, gainers, gappers, movers, ETFs e crypto ETFs; incluía crypto principal via Coinbase e nenhuma função de ordem.
- A variante FIXED corrigiu startup para reutilizar caches e impedir que timeout de plate matasse a inicialização.
- O arquivo UUID `08e7...py` é byte a byte idêntico ao `moomoo_radar.py` do pacote Final Mover Engine Fixed.
- Apareceu a primeira trilha explícita de confirmação móvel.

### 30.5 AI Stage Filter, audited builds, Low Risk e TOP5 — 28/08/2026

Artefatos:

- `moomoo_radar_ai_stage_filter.py`
- `moomoo_radar_FINAL.py`
- `RUN_RADAR_FINAL.command`
- `moomoo_radar_FINAL_AUDITED.py`
- `RUN_RADAR_FINAL_AUDITED.command`
- `moomoo_radar_LOW_RISK_TOP3.py`
- `RUN_RADAR_LOW_RISK_TOP3.command`
- `moomoo_radar_TOP5_FINAL.py`
- `RUN_RADAR_TOP5_FINAL.command`
- `2aa3baba-9c14-4098-9931-e6db9d5e8735.py`
- `MoomooRadar_TOP5_FINAL_AUDITED.zip`

Evolução:

- introdução de AI como filtro/stage review;
- builds denominadas FINAL e FINAL_AUDITED;
- experiência LOW_RISK_TOP3;
- TOP5 consolidado com push e revisão;
- single-instance e confirmação explícita no pacote auditado;
- SAFE_FALLBACK podia exibir candidatos, mas não autorizar execução.

`moomoo_radar_TOP5_FINAL.py` e `moomoo_radar_TOP5_FINAL_BACKUP.py` foram posteriormente confirmados como cópias byte a byte. Labels FINAL/AUDITED não bastam para provar validação live.

### 30.6 Premarket, instrumentação e certificações — 31/08/2026

Artefatos principais:

- `5f35620a-98a6-4071-8dd4-19e63ee915c3.py`
- `moomoo_radar_TOP5_FINAL_BACKUP.py`
- `MoomooRadar_PREMARKET_AUDITED_v2.py` até `v9_CERTIFIED.py`
- `9ad7b8b6-2949-4203-82b2-1c953754741f.py`
- `certify_moomoo_radar.py`
- `MoomooRadar_V9_CERTIFICATION.txt`
- `FINAL_MOVER_ENGINE_PRELIVE_CERTIFICATION.txt`
- `certify_final_mover_engine.py`
- `FINAL_MOVER_ENGINE_CERT_CANDIDATE.py`
- `FINAL_MOVER_ENGINE_CERTIFICATION_REPORT.txt`
- `certify_FINAL_MOVER_ENGINE_candidate.py`
- `FINAL_MOVER_ENGINE_SHADOW_VALIDATION.py`
- `validate_shadow_session.py`
- `FINAL_MOVER_ENGINE_SHADOW_VALIDATION_CERT.txt`
- `REAL_MARKET_REPLAY_2026-08-31.txt`
- `replay_today_real_movers.py`
- `MoomooRadar_TOP3_CRYPTO_CALIBRATED_TODAY_READY.py`
- `TODAY_READY_VALIDATION_REPORT.txt`
- `MoomooRadar_TOP3_STAGEGATE_V2_OFFLINE.py`
- `MoomooRadar_TOP3_STAGEGATE_V3_OFFLINE.py`

Descobertas documentadas:

- A pre-live certification do Final Mover Engine concluiu **NOT CERTIFIED FOR LIVE USE YET** por full scan sequencial, timestamps aproximados, ausência de breakout event age confiável, deque sem timestamps, state apenas em memória, risco de estado stale após restart e ausência de replay end-to-end.
- O candidato de certificação obteve 14/14 em testes determinísticos offline. O próprio relatório limita a conclusão ao core determinístico e exige shadow validation para feed live.
- A shadow validation obteve 13/13 quanto à presença de raw/event logs, cycle latency, sample time, breakout age, validator independente, clean session e ausência de orders/AI. Isso prova instrumentação/guardrails do artefato, não performance live.
- O `MoomooRadar_V9_CERTIFICATION.txt` registra 23/23 testes offline, incluindo defeitos reproduzidos do V8, Stage classification, TOP5 local, AI timeout, metadata isolation, push consolidado, DELTA nonblocking e SIMULATE guard.
- O replay de 31/08 marcou AEHL, NEOV, DPRO e SY como 4/4 detectados, mas não constitui certificação geral: eram movers conhecidos e os handoffs posteriores alertam que baselines de volume eram parcialmente artificiais/limitados.
- A calibração TODAY READY reduziu micro breakout de 0,10% para 0,075% usando BTC/ETH/SOL como referência de timing e manteve threshold principal de ignition. Foi declarada pronta para SIMULATE + confirmation, não prova de lucratividade nem autorização REAL.
- StageGate V2/V3 permaneceu offline candidate.

Hashes/duplicações confirmadas:

- `9ad7...py` = `MoomooRadar_PREMARKET_AUDITED_v7.py`.
- `5f356...py` = fonte dentro de `MoomooRadar_TOP5_FINAL_AUDITED.zip`.
- TOP5 FINAL = TOP5 FINAL BACKUP.

### 30.7 Early Discovery e correção do atraso — 01/09/2026

Artefatos:

- `MoomooRadar_EARLY_DISCOVERY_V4_READY.py`
- `EARLY_DISCOVERY_V4_REVIEW.txt`
- `MoomooRadar_EARLY_DISCOVERY_V5_FRESHNESS.py`
- `MoomooRadar_EARLY_DISCOVERY_V6_NONBLOCKING_FRESHNESS.py`
- `V6_NONBLOCKING_REVIEW.txt`
- `MoomooRadar_EARLY_DISCOVERY_V7_FRESH_LISTS.py`
- `V7_FRESH_LISTS_REVIEW.txt`
- `MoomooRadar_EARLY_DISCOVERY_V8_THEME_METADATA.py`
- `V8_THEME_METADATA_REVIEW.txt`
- `MoomooRadar_EARLY_DISCOVERY_V8_1_SAFE_METADATA.py`

Sequência técnica:

1. V4 atacou diretamente o atraso de 30–60 minutos com market-wide regular-session discovery a cada 10s via `CHANGE_RATE_5MIN`, injeção dos movers na frente do DELTA e avaliação após nova amostra. Meta arquitetural: aproximadamente 5–15s após aparecer no screen, sujeita ao timing da Moomoo.
2. V5 introduziu historical freshness para impedir que movimento velho fosse classificado como early.
3. V6 moveu o 1m history para worker dedicado, tornando freshness nonblocking; pendência/falha bloqueia acionável/push, mas o radar continua.
4. V7 filtrou as listas exibidas IGNITION NOW e FRESH BREAKOUT pela freshness já verificada, sem novas calls.
5. V8 adicionou Industry/Theme assíncrono e display-only.
6. V8.1 tentou metadata mais segura, mas observação live encontrou categorias promocionais/temporárias e levou à decisão de tratar V8/V8.1 apenas como forense.

No fim dessa fase, a política consolidada escolheu `EARLY_DISCOVERY_V7_FRESH_LISTS` como baseline de desenvolvimento, e não o antigo `MoomooRadar_v7_VALIDATED.zip` de 26/08.

### 30.8 Handoffs, credenciais e evidência de runtime — 01/09/2026

Artefatos:

- `MOOMOO_RADAR_COMPLETE_HANDOFF.md`
- `MOOMOO_RADAR_COMPLETE_HANDOFF.txt`
- `MOOMOO_RADAR_CREDENTIALS_SETUP.txt`
- `MoomooRadar_Manus_Review.zip`
- `MoomooRadar_Mac_Runtime_Evidence.zip`

O pacote Manus consolidou V6/V7/V8/V8.1, launchers e documentação, mas declarou corretamente não possuir acesso direto ao Mac. Screenshot indicava V8.1 em execução, enquanto V7 era baseline de desenvolvimento. O pacote de runtime evidence foi read-only e excluiu secrets; também registrou que vários arquivos esperados no Desktop Mac não estavam disponíveis naquele ambiente de coleta.

### 30.9 Master consolidado e AlertSafe — 04/09/2026

Artefatos:

- `MooMooRadar_MASTER_FILE_FOR_NEXT_AI_20260904.md`
- `MoomooRadar_MASTER_MANUS_2026-09-04.md`
- `CODEX_START_HERE_MOOMOO_RADAR_2026-09-04.md`

Os dois masters de aproximadamente 37,7 MB são cópias consolidadas extensas do histórico/evidência. O Start Here definiu `hybrid_quotasafe` como baseline congelada e `hybrid_alertsafe` como candidato a validar, com anti-avalanche obrigatório, zero regressão de discovery/freshness/TOP3, soak de 1.000 ciclos, package verification e hash manifest.

### 30.10 Arquitetura multitarefa — 06–07/09/2026

Artefatos:

- `free_catalyst_calendars_manual.pdf`
- `insider_activity_framework.pdf`
- `MOOMOO_RADAR_SWING_MULTITASK_ARCHITECTURE_2026-09-06.md`

Foi aprovada a arquitetura NOW/NEXT com Catalyst Radar, Insider Intelligence e Risk/Dilution Engine como módulos separados. Timing continua técnico. A alegação de MOU SEC–FDA dentro do framework de insider activity não foi validada por fonte primária e foi explicitamente excluída da lógica operacional.

### 30.11 V2 Clean e trabalho posterior — após 07/09/2026

Regra recebida do usuário:

- código clean, memória técnica cumulativa;
- não reutilizar código legado sem autorização;
- antes de qualquer investigação ou mudança, verificar se já foi investigada, decidida, testada ou medida;
- não repetir trabalho concluído;
- não substituir contratos silenciosamente.

O acervo persistido auditado não contém o pacote canônico completo do V2 Clean posterior, nem os resultados de 15/09. Portanto, a próxima AI deve recuperar esse estado no repositório/ambiente onde foi produzido.

### 30.12 Incidente de análise — 21/09/2026

A avaliação de NOK e outras ações sem inspeção de gráficos/OHLCV foi invalidada. O incidente criou a regra obrigatória de evidência e separação temporal descrita nas seções 10, 11, 20, 23 e 26.

---

## 31. AMBIGUIDADES DE NOMENCLATURA QUE DEVEM SER EVITADAS

### “V3” possui pelo menos três significados históricos

1. `MoomooRadar_v3.zip` / PRO v3 de 26/08: correção de timeout com screener server-side.
2. `MoomooRadar_TOP3_STAGEGATE_V3_OFFLINE.py` de 31/08: StageGate offline.
3. V3 Clean/Next deste handoff: próxima governança/linha de desenvolvimento.

Nunca escrever apenas “V3”. Usar nome completo e hash/build.

### “V7” possui pelo menos dois significados

1. `MoomooRadar_v7_VALIDATED.zip` de 26/08: versão da linhagem PRO inicial.
2. `MoomooRadar_EARLY_DISCOVERY_V7_FRESH_LISTS.py` de 01/09: baseline escolhida posteriormente.

Quando os handoffs dizem “V7 = BASELINE”, referem-se à segunda, salvo evidência contrária.

### “FINAL”, “AUDITED”, “READY”, “CERTIFIED” e “VALIDATED”

Esses termos aparecem em filenames antigos, mas não são prova suficiente. Sempre declarar o escopo:

- compile/static audit;
- unit/integration offline;
- deterministic replay;
- shadow instrumentation;
- live shadow;
- paper end-to-end;
- multiple live sessions;
- real-money readiness.

---

## 32. MANIFESTO DOS 84 ARTEFATOS NÃO VISUAIS RECUPERADOS

### Pesquisa temática

1. `Radar_Semanal_Tematico_2026-07-14.pdf`
2. `Radar_Semanal_Tematico_Completo_2026-07-14.pdf`

### Alpaca

3. `alpaca_breakout_radar.zip`
4. `alpaca_breakout_radar_v2.zip`

### Moomoo inicial e versões empacotadas

5. `MoomooRadar.zip`
6. `MoomooRadar_PRO.zip`
7. `MoomooRadar_v3.zip`
8. `moomoo_radar_pro_v3.py`
9. `MoomooRadar_corrected_python.zip`
10. `MoomooRadar_v5_movement_mode.zip`
11. `MoomooRadar_v6_price_2500.zip`
12. `MoomooRadar_v6_CORRECTED.zip`
13. `MoomooRadar_v7_VALIDATED.zip`
14. `MoomooRadar_v8_NO_OTC.zip`
15. `MoomooRadar_v9_FAST.zip`
16. `MoomooRadar_v10_FINAL.zip`
17. `MoomooRadar_v11_CLEAN.zip`
18. `MoomooRadar_v12_REVIEWED.zip`
19. `MoomooRadar_v13_ALL_UNIVERSE.zip`
20. `MoomooRadar_v14_MOVEMENT_ONLY.zip`
21. `MoomooRadar_v16_DUAL_SCORE.zip`
22. `MoomooRadar_FINAL_MOVER_ENGINE.zip`
23. `MoomooRadar_FINAL_MOVER_ENGINE_FIXED.zip`

### Mobile, AI, audited, risk e ranking

24. `08e7b2ba-05f5-464d-b2d7-619499c5b012.py`
25. `moomoo_radar_with_mobile_confirm.py`
26. `moomoo_radar_ai_stage_filter.py`
27. `moomoo_radar_FINAL.py`
28. `RUN_RADAR_FINAL.command`
29. `moomoo_radar_FINAL_AUDITED.py`
30. `RUN_RADAR_FINAL_AUDITED.command`
31. `moomoo_radar_LOW_RISK_TOP3.py`
32. `RUN_RADAR_LOW_RISK_TOP3.command`
33. `moomoo_radar_TOP5_FINAL.py`
34. `RUN_RADAR_TOP5_FINAL.command`
35. `2aa3baba-9c14-4098-9931-e6db9d5e8735.py`
36. `MoomooRadar_TOP5_FINAL_AUDITED.zip`
37. `5f35620a-98a6-4071-8dd4-19e63ee915c3.py`
38. `moomoo_radar_TOP5_FINAL_BACKUP.py`

### Premarket e certificação

39. `MoomooRadar_PREMARKET_AUDITED_v2.py`
40. `MoomooRadar_PREMARKET_AUDITED_v3.py`
41. `MoomooRadar_PREMARKET_AUDITED_v4.py`
42. `MoomooRadar_PREMARKET_AUDITED_v5.py`
43. `MoomooRadar_PREMARKET_AUDITED_v6.py`
44. `MoomooRadar_PREMARKET_AUDITED_v7.py`
45. `9ad7b8b6-2949-4203-82b2-1c953754741f.py`
46. `MoomooRadar_PREMARKET_AUDITED_v8.py`
47. `MoomooRadar_PREMARKET_AUDITED_v9_CERTIFIED.py`
48. `certify_moomoo_radar.py`
49. `MoomooRadar_V9_CERTIFICATION.txt`
50. `FINAL_MOVER_ENGINE_PRELIVE_CERTIFICATION.txt`
51. `certify_final_mover_engine.py`
52. `FINAL_MOVER_ENGINE_CERT_CANDIDATE.py`
53. `FINAL_MOVER_ENGINE_CERTIFICATION_REPORT.txt`
54. `certify_FINAL_MOVER_ENGINE_candidate.py`
55. `FINAL_MOVER_ENGINE_SHADOW_VALIDATION.py`
56. `validate_shadow_session.py`
57. `FINAL_MOVER_ENGINE_SHADOW_VALIDATION_CERT.txt`

### Replay, calibração e StageGate

58. `REAL_MARKET_REPLAY_2026-08-31.txt`
59. `replay_today_real_movers.py`
60. `MoomooRadar_TOP3_CRYPTO_CALIBRATED_TODAY_READY.py`
61. `TODAY_READY_VALIDATION_REPORT.txt`
62. `MoomooRadar_TOP3_STAGEGATE_V2_OFFLINE.py`
63. `MoomooRadar_TOP3_STAGEGATE_V3_OFFLINE.py`

### Early Discovery e metadata

64. `MoomooRadar_EARLY_DISCOVERY_V4_READY.py`
65. `EARLY_DISCOVERY_V4_REVIEW.txt`
66. `MoomooRadar_EARLY_DISCOVERY_V5_FRESHNESS.py`
67. `MoomooRadar_EARLY_DISCOVERY_V6_NONBLOCKING_FRESHNESS.py`
68. `V6_NONBLOCKING_REVIEW.txt`
69. `MoomooRadar_EARLY_DISCOVERY_V7_FRESH_LISTS.py`
70. `V7_FRESH_LISTS_REVIEW.txt`
71. `MoomooRadar_EARLY_DISCOVERY_V8_THEME_METADATA.py`
72. `V8_THEME_METADATA_REVIEW.txt`
73. `MoomooRadar_EARLY_DISCOVERY_V8_1_SAFE_METADATA.py`

### Handoff, credenciais e evidência

74. `MOOMOO_RADAR_COMPLETE_HANDOFF.md`
75. `MOOMOO_RADAR_COMPLETE_HANDOFF.txt`
76. `MOOMOO_RADAR_CREDENTIALS_SETUP.txt`
77. `MoomooRadar_Manus_Review.zip`
78. `MoomooRadar_Mac_Runtime_Evidence.zip`
79. `MooMooRadar_MASTER_FILE_FOR_NEXT_AI_20260904.md`
80. `MoomooRadar_MASTER_MANUS_2026-09-04.md`
81. `CODEX_START_HERE_MOOMOO_RADAR_2026-09-04.md`

### Multitarefa

82. `free_catalyst_calendars_manual.pdf`
83. `insider_activity_framework.pdf`
84. `MOOMOO_RADAR_SWING_MULTITASK_ARCHITECTURE_2026-09-06.md`

### Imagens fora deste manifesto

O acervo também contém screenshots/imagens históricas. Elas não foram contadas entre os 84 artefatos acima. Servem como evidência visual contextual, mas não substituem código, logs ou OHLCV estruturado. A próxima AI deve correlacioná-las por data/conversa antes de extrair qualquer conclusão.

---

## 33. ESCOPO REAL DA REVISÃO DESTE HANDOFF

### Lido ou inspecionado diretamente nesta revisão

- inventário completo dos 84 artefatos não visuais;
- conteúdo dos ZIPs e seus READMEs/manifests;
- relatórios de certificação, replay e revisão em TXT;
- handoffs e Start Here;
- PDFs temáticos, catalyst e insider;
- fontes principais V6/V7/V8/V8.1 e hashes/duplicações relevantes;
- master consolidado como acervo de evidência e logs;
- documentação de arquitetura multitarefa.

### Inventariado, mas não promovido a fonte canônica

- cada versão intermediária do código;
- arquivos UUID duplicados;
- launchers antigos;
- installers potencialmente destrutivos;
- nomes autodeclarados FINAL/VALIDATED/CERTIFIED.

### Continua faltando

- repositório/pacote canônico do V2 Clean pós-07/09;
- logs/resultados estruturados de 15/09;
- gráficos/OHLCV usados na análise de NOK e demais ações;
- estado atual do Mac, processos, OpenD, configs e runtime;
- qualquer código novo criado fora do acervo persistido.

Conclusão: este handoff agora cobre todo o histórico documental recuperável do projeto desde o precursor temático, mas não afirma possuir material que não está no acervo. A primeira obrigação da AI sucessora continua sendo reconciliar as lacunas pós-07/09 no ambiente real.
