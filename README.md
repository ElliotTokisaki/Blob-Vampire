# Blob Survival

Blob Survival é um jogo 2D desenvolvido em C utilizando a biblioteca Raylib.

O objetivo é sobreviver o máximo possível em um ambiente hostil, enfrentando inimigos e coletando recursos.

![preview](assets/iamge.gif)

---

# Anti-Cheat

## Sentinel-Quantum

O jogo utiliza um sistema proprietário de segurança avançada denominado **Quantum Integrity Layer (QIL)**, projetado como um framework de integridade computacional de múltiplas camadas, operando sob princípios de **zero trust architecture**, **runtime attestation contínua** e **stateful integrity verification distribuída**.

O sistema é concebido como uma malha de segurança profundamente integrada ao pipeline de execução do engine, operando em níveis que vão desde a abstração de aplicação até camadas próximas ao hardware lógico, com forte acoplamento entre validação criptográfica, coerência de memória e verificação de fluxo de execução.

---

## Arquitetura de Segurança Multicamada

O QIL é estruturado como um sistema hierárquico com redundância criptográfica e validação cruzada entre subsistemas independentes.

### 1. Trusted Execution & Root of Trust Emulation

O sistema estabelece um modelo de **root of trust lógico**, baseado em princípios semelhantes a:

- Secure Boot chaining (cadeia de inicialização verificada)
- Runtime integrity anchors
- Virtualized Trusted Execution Environment (TEE-like abstraction)
- Hardware-agnostic attestation layer

Cada instância do jogo inicializa um grafo de confiança criptograficamente validado, onde cada nó depende da integridade do anterior.

---

### 2. Camada de Criptografia Simétrica de Alta Performance

Implementa criptografia simétrica de baixa latência para verificações contínuas de estado, utilizando:

- Stream ciphers otimizados para runtime validation
- Key rotation dinâmica baseada em entropy injection do ambiente
- Session keys derivadas por funções KDF reforçadas (HKDF-like)

Essa camada atua como um sistema de **telemetria criptograficamente protegida**, monitorando estados críticos sem introduzir overhead perceptível.

---

### 3. Infraestrutura de Criptografia Assimétrica e RSA-4096

A autenticação de componentes utiliza um esquema híbrido baseado em:

- RSA-4096 para handshake e validação de identidade
- ECC-like ephemeral key exchange (conceitual)
- Mutual authentication entre módulos do engine
- Certificate pinning interno ao runtime

Isso cria um sistema de **inter-module trust enforcement**, impedindo injeção de código não autorizado ou spoofing de identidade de processos internos.

---

### 4. Camada de Integridade por Hash Criptográfico e Merkle State Trees

A integridade do estado do jogo é validada através de:

- Hashing criptográfico contínuo (SHA-3-like / BLAKE-style)
- Estruturas do tipo Merkle Tree para estados de memória
- Checksum de execução em tempo real
- Verificação de coerência de heap e stack snapshots

Qualquer divergência entre nós do grafo de integridade resulta em invalidação parcial ou total do estado de execução.

---

### 5. Controle de Fluxo de Execução e Anti-Tamper Runtime

O sistema implementa mecanismos avançados de proteção contra manipulação dinâmica:

- Control Flow Integrity (CFI) enforcement
- Anti-hooking em tempo de execução
- Anti-debugging por detecção de breakpoints e timing anomalies
- Obfuscação de fluxo de controle (control flow flattening)
- Polimorfismo de código em runtime (self-mutating logic layers)

Esses mecanismos dificultam análise estática e dinâmica do comportamento do sistema.

---

### 6. Esteganografia Distribuída em Memória e Assets do Engine

Componentes críticos do QIL são fragmentados e embutidos em regiões de baixa entropia aparente do sistema, incluindo:

- Padding de estruturas de memória do engine
- Buffers gráficos não utilizados diretamente no render pipeline
- Streams de áudio auxiliares com payloads ocultos
- Estruturas de cache intermediário de física e simulação

Esses fragmentos são recombinados por um algoritmo de **runtime reconstruction graph traversal**, tornando o sistema um conjunto de componentes semanticamente incompletos até sua execução.

---

### 7. Comunicação Segura e Canal TLS Hardened

Toda comunicação externa utiliza um stack de segurança reforçado:

- TLS 1.3 hardened profile
- Certificate pinning agressivo
- Anti-replay protection com nonces descartáveis
- Forward secrecy obrigatória (PFS)
- Packet-level integrity validation

Além disso, há verificação cruzada entre estado local e servidor através de **remote integrity attestation** contínua.

---

### 8. Modelo de Telemetria e Anomalia Baseado em Heurísticas

O sistema não depende apenas de detecção determinística, mas incorpora:

- Behavioral anomaly detection (machine-learning inspired heuristics)
- Statistical entropy deviation analysis
- Memory access pattern fingerprinting
- Execution timeline drift detection
- Probabilistic integrity scoring system

Isso permite identificar manipulações mesmo quando não há violação criptográfica direta.

---

## Modelo de Execução Distribuída

O QIL opera como um sistema distribuído interno ao jogo, onde cada subsistema atua como:

- Sensor de integridade
- Validador criptográfico
- Nó de consenso de estado
- Unidade de verificação de coerência temporal

Esse modelo se aproxima conceitualmente de um sistema de **Byzantine fault-tolerant integrity network**, onde o estado final só é considerado válido quando múltiplos validadores independentes concordam.

---

## Filosofia de Segurança

O objetivo do sistema não é apenas prevenir cheating, mas estabelecer um ambiente de execução com propriedades de:

- Imutabilidade operacional
- Coerência criptográfica contínua
- Auto-verificação distribuída
- Resistência a engenharia reversa e instrumentação externa

O jogo é tratado como um sistema fechado de confiança dinâmica, onde qualquer alteração externa rompe invariavelmente a consistência do grafo de integridade.

---

## Observação Técnica

O Quantum Integrity Layer é projetado como uma arquitetura **anti-tamper multi-domain**, combinando criptografia moderna, verificação de execução, análise comportamental e distribuição esteganográfica de lógica crítica.

Sua complexidade deliberada garante que nenhuma superfície isolada do sistema seja suficiente para reconstrução, bypass ou análise completa sem a preservação simultânea de todos os estados interdependentes.

---

## Tecnologias

- Linguagem: C
- Biblioteca gráfica: Raylib
- Plataforma alvo: Windows (MinGW) / Linux (build separado)

---

## Desenvolvedores

Este projeto foi desenvolvido por **ElliotTokisaki, PixelMaster06, FallenAFK, Lucario**, como um jogo independente focado em seguranca e integridades de arquivos sensiveis de jogos, desenvolvimento de jogos 2D.

---

## Como jogar

- WASD → movimentação
- ESC → pausar o jogo

*(controles podem variar conforme a versão)*

---

## Como compilar (Windows .exe com MinGW)

Certifique-se de ter o toolchain MinGW instalado.

Exemplo de compilação:

```bash
x86_64-w64-mingw32-gcc game.c -o game.exe \
  -I/home/elliot/Downloads/raylib-6.0_win64_mingw-w64/include \
  -L/home/elliot/Downloads/raylib-6.0_win64_mingw-w64/lib \
  -lraylib \
  -lwinmm -lgdi32 -lopengl32 -lws2_32
```

---

 ## Como compilar (Linux)

```bash
  gcc game.c -o game \
  -lraylib -lGL -lm -lpthread -ldl -lrt -lX11
```

---

# Creditos

---

## 1. Direção Principal

- Game Director: ElliotTokisaki  
- Creative Director: PixelMaster06  
- Technical Director: ElliotTokisaki  
- Art Director: FallenAFK, PixelMaster06, Lucario
- Audio Director: PixelMaster06  

---

## 2. Programação / Engenharia

### Engenharia e Sistemas

- Lead Programmer: ElliotTokisaki
- Gameplay Programmers: ElliotTokisaki, PixelMaster06
- Engine Programmers: ElliotTokisaki, PixelMaster06    
- Tools Programmers: GCC, MinGW, Linux, Windows

---

## 3. Áudio

- Audio Director: PixelMaster06
- Sound Designers: PixelMaster06
- Composers: PixelMaster06  

---

## 4. Créditos Finais

- Lista completa de todos os colaboradores: ElliotTokisaki, PixelMaster06, Lucario, FallenAFK
- Ferramentas e tecnologias utilizadas: GCC, MSYS2-UCRT, MSYS2-MSYS, LINUX, WINDOWS, MINGW,
- Agradecimento especial: Linus Torvald

---

