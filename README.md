# Blob Surviva

Blob Survival é um jogo 2D desenvolvido em C utilizando a biblioteca Raylib.
O objetivo é sobreviver o máximo possível em um ambiente hostil, enfrentando inimigos e coletando recursos.

![preview](assets/iamge.gif)

---

## Tecnologias

- Linguagem: C
- Biblioteca gráfica: Raylib
- Plataforma alvo: Windows (MinGW) / Linux (build separado)

---

## Desenvolvedor

Este projeto foi desenvolvido por **ElliotTokisaki**, como um jogo independente focado em aprendizado de programação em C, desenvolvimento de jogos 2D.

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
