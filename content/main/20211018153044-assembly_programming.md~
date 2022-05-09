+++
title = "Assembly Programming"
author = ["System Administrator"]
draft = false
+++

I started assembly programming after a major crash of inline assembly in C++.


## Specifications {#specifications}


### OS X {#os-x}

[assembly in macOS-stackoverflow](https://stackoverflow.com/questions/8691792/how-to-write-assembly-language-hello-world-program-for-64-bit-mac-os-x-using-pri)
OS X require that stack pointer have 16-byte alignment at the point of any **external** function call

```asm

	.cstring
_hello:
	.asciz "Hello, world\n"

	.text
	.globl _main
_main:cmdline
	sub  $8, %rsp           // align rsp to 16B boundary
	mov  $0, %rax
	lea  _hello(%rip), %rdi // load address of format string
	call _printf            // call printf
	add  $8, %rsp           // restore rsp
	ret
```


### Syntax {#syntax}


#### Masm {#masm}

<!--list-separator-->

-  Structure

    ```asm
    .data

    .code
    ```

<!--list-separator-->

-  Data Declare

    ```asm
    .data
    	count BYTE 100
    	wVal WORD 2
    	bVal2 BYTE ?
    ```


## My way {#my-way}


### 1. Use `MSVC` on my bootcamp of windows {#1-dot-use-msvc-on-my-bootcamp-of-windows}


#### Use Clib {#use-clib}

pass parameter the same way, and call the same way.


### 2. Use `NASM` and `gcc` on Linux {#2-dot-use-nasm-and-gcc-on-linux}


#### 1. `ssh` to my linux virtual machine {#1-dot-ssh-to-my-linux-virtual-machine}

1.  open linux in virtual machine
2.  open eshell on host
3.  shell: `ssh usrname@localhost -p 3022`
    trapm: `C-x C-f ssh:usrname@localhost#port:/playground`


#### 2. assembly and link {#2-dot-assembly-and-link}

```shell
$nasm -f elf64 -o hello.o hello.asm
$ld -o hello hello.o
```


### 3. Use dosbox and MASM.EXE inside it. {#3-dot-use-dosbox-and-masm-dot-exe-inside-it-dot}

1.  Edit using emacs inside `~/dosbox/8086`
2.  run `masm XX.asm` and `link XX.exe` in dosbox


## Concepts and Syntax {#concepts-and-syntax}


### Example {#example}

```asm
section .data
   SYS_WrITE equ 1
   message db 'helloworld', 10
section .text
   global _start
_start:
   some codes
```


### Registers {#registers}

{{< figure src="/ox-hugo/redisters.png" >}}


#### Speicial use {#speicial-use}

| register | use                  |
|----------|----------------------|
| `rax`    | store syscall number |
| `rdi`    | first PARAM          |
| `rsi`    | second PARAM         |
| `rdx`    | third PARAM          |
| `rcx`    | 4th                  |
| `r8`     | 5th                  |
| `r9`     | 6th                  |

other parameters would be passed with Stacks


#### Zero extension {#zero-extension}

movning 16 bit into 32 bit, fill upper part with 0

```asm
movzx ax, bl
```


### Example {#example}


#### sys_call(int fd,pointer buf,int count) {#sys-call--int-fd-pointer-buf-int-count}

<!--list-separator-->

-  fd

    type of file

    -   0: standard input
    -   1: standard out

<!--list-separator-->

-  buf

    a address of variable X
    e.g.: msg

<!--list-separator-->

-  count

    length of the variable X


### Arithmetic {#arithmetic}

arithmetic instructions takes in 1 argument, and apply it to the `rax` register, and leave the result in `rax` register
List of arithmetic instructions:

-   `sub`: substract
-   `add`: integer addition
-   `MUL`: multiply with no sign
-   `IMUL`: multiply with sign
-   `DIV`: divide with sign
    `div rbx` means div `rax` with `rbx`, result in `rax`, reminder in `rdx`
-   `IDIV`: divide without sign
-   `INC`: self increse

    ```asm
    inc eax ; eax = eax + 1
    ```
-   `DEC`: self decline
-   `NEG`: not


### Control flow {#control-flow}


#### `CMP` instruction {#cmp-instruction}

syntax

```asm
	;;rax compared to 50
cmp rax, 50
```

use conditional jump instruction


#### Conditional jump instruction {#conditional-jump-instruction}

| instruciton | Meaning                            |
|-------------|------------------------------------|
| `JE`        | if Equal                           |
| `JZ`        | if zero                            |
| `JNE`       | if not equal                       |
| `JG`        | if rax &gt; 50                     |
| `JGE`       | if rax &gt;= 50                    |
| `JA/JAE`    | same as `JGE`, for unsigned        |
| `JMP label` | jump at no condition.Used in loops |


#### Function {#function}

use lable to declare function
use `call` instruction to call function

```asm
	call function1
function1:
	mov eax, 5
	other codes
	ret

```

`ret` is returning to the place the function is called


### Stacks {#stacks}

ref:[asm_progrm_tutorial_3](https://vvl.me/2016/08/translation-Say-hello-to-x64-Assembly-part-3/)


#### Use {#use}

Execute Function
the current address would be stored in stack before executing function.
after function executed, address would be copied to commands counter `RIP`, where the execution of codes continues.


#### Instructions {#instructions}

| ins        | mean                                             |
|------------|--------------------------------------------------|
| `push xxx` | `RSP inc` store xxx to the place `RSP` points to |
| `pop xxx`  | copy to xxx from where `RSP` points to           |
|            |                                                  |


#### Stack Pointers {#stack-pointers}

<!--list-separator-->

-  RSP - stack pointer

    it points to the top of stack
    it stores address
    when in use, use [rsp] to get the value stored in the address

    ```asm
    mov rax [rsp + 8]
    ```


#### Question regarding the tutorial {#question-regarding-the-tutorial}

The example program results 1^@^@^@^@^@^@^@5^@^@^@^@^@^@^@ instead of 15. Guessing it to be the ASCII code standard of strings. like a \\000 at the end or 0x0 something. or just empty, because ASCII charactor use only 8 bit of every register of 64 bits in x86_64 stucture. Other (64-8) are just empty.


### Other commands {#other-commands}


#### `XCHG` exchange {#xchg-exchange}

exchange 2 operand, at least 1 is register


#### `OFFSET` offset {#offset-offset}


### Flags {#flags}

Arithmetic and bitwise operations would change flags regarding the destination
`MOV` don't set flag

Flags are used to perform conditional jump


#### Zero flag {#zero-flag}


#### Sign flag {#sign-flag}


#### Carry flag {#carry-flag}


#### Overflow flag {#overflow-flag}


## Task {#task}


### immediate operand? {#immediate-operand}


### `NEG` and carry flag? {#neg-and-carry-flag}