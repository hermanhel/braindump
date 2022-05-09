+++
title = "Operating System"
author = ["System Administrator"]
draft = false
+++

The Info comes most from MITOCW


## MIT 6.S081 {#mit-6-dot-s081}


### meta {#meta}

6.s081. a website.
qemu, a hardware simulation under linux
xv6, a teaching OS, on RISC-V processor


### Overview {#overview}




#### What Operating system do {#what-operating-system-do}

-   Abstract Hardware
-   Multiplex
-   Isolation
-   Sharing
-   Security
    access
-   Preformance
-   Range of application


#### orgnization Image {#orgnization-image}

![](/Users/hermanhe/Notes/RoamNotes/os1.png)
Kernel have filesystem, process management, memory management...codes.

-   filesystem: give more high-level way to name files, orgnize directories,etc.
-   process management: vi, cc are like different processes, and we want then to run concurrently, without interfering each other.
-   memory: and we divide and allocate memory to them.


#### API - kernel {#api-kernel}

`fd = open("path",1)`
much like defining a funciton, but `system calls` jump into kernel and run kernel code. The kernel code have the special access to hardware and other kernel code user-defined function don't have


#### Why OS is interesting? {#why-os-is-interesting}

<!--list-separator-->

-  OS have it's projection into all softwares

<!--list-separator-->

-  Tensions

    <!--list-separator-->

    -  efficient - abstract

    <!--list-separator-->

    -  powerful - simple

    <!--list-separator-->

    -  flexible - secure

        want the user code to as flexible as possible, but don't want them to subatage other programs.

<!--list-separator-->

-  the interaction of funcitons OS provided

    fork() create a new process that is a copy of the currrent one, then how will the resources this process accesed interact with this copy?

<!--list-separator-->

-  The infrastructures and services

<!--list-separator-->

-  Tracking bugs


#### Example of system call - what it looks like? {#example-of-system-call-what-it-looks-like}

<!--list-separator-->

-  Installing xv6

    <!--list-separator-->

    -  1. installing i386 elf

        with macport installed
        `sudo port install i386-elf-gcc`

<!--list-separator-->

-  Simple program

    ```c
    #include "kernel/types.h"
    #include "user/user.h"

    int main(){
      char buf[64];

      while(1){
        int n = read(0,buf,sizeof(buf)); //0 console input, 1 console output by shell.
        //buf is a pointer to a memory address where the program ask the OS to read the data into. it's a reserved 64 cells on the stack.
        //sizeof(buf) is the maximum read size.
        if(n<=0) break;
        write(1,buf,n);
      }
      exit(0);
    }
    ```

    <div class="src-block-caption">
      <span class="src-block-number">Code Snippet 1</span>:
      copy.c
    </div>

    chapter 2 of the xv6 book have a table of all system call args.

<!--list-separator-->

-  Fork()

    it created 1 identical children process, return the pid of the process, and return 0 if used in the children process. The copy doesn't start/stop corresponding to where the fork() system call is used, but the whole process, and the only difference of the 2 process, is the pid, and what fork() would return.

    the memory's the same. in different memory

<!--list-separator-->

-  exec()

    replace the current process's memory entirely, and never return. return only under error.

    ```c
    int main(){
      char *argv[] = {"echo","this","is","echo",0}; //0 to signify the end of the array
      //each "sth" is a pointer pointing to a address storing the bytes. 0 points to NULL. when pointer's value is 0, it's a NULL pointer.
      exec("echo",argv);
      printf("exec failed!\n");
      exit(0);
    }
    ```

    <div class="src-block-caption">
      <span class="src-block-number">Code Snippet 2</span>:
      exec.c
    </div>

    shell use forkexac to execute a command on the fork() of it, and then regain control when the child process exited

<!--list-separator-->

-  redirection

    ```c
    int main(){
      int pid;

      pid = fork();
      if(pid == 0){
        close(1);
        open("output.txt", O_WRONLY | O_CREATE);
        char *arg[]={"echo","This","is","echo","redirected",0};
        exec("echo",argv);
        printf("exxec failed");
        exit(1);

      } else {
        wait((int *) 0);
      }
      exit(0);
    }
    ```

    after `close(1);`, file descriptor `1` is closed. `open("output.txt",)` will bind the lowest number of available file descriptor(1) to `output.txt`


### OS organization {#os-organization}


#### to check {#to-check}

prime
pipe: in fork, it will have 4 ends.
concurent


#### isolation {#isolation}

strong isolation between OS and app. So OS won't crash with error of app

<!--list-separator-->

-  If there's no OS?

    no multiplexing. The dead loop will continue to run to the end of time
    so we want the app to give up cpu once in a while

    also, with memory, the perculating of echo and shell. echo can't overwrite shell's physical memory

<!--list-separator-->

-  OS's perpose

    -   enforce strong isolation
    -   enforce multiplexing

<!--list-separator-->

-  Unix Interface

    Abstract the HW resource
    like process. process system calls act on the abstraction of process, not directly to CPU. So the kernel could allow multiplexing of CPU.

    The kernel would force the idea that a process won't be able to run for &gt;100ms.
    exec() is abstraction of memory. The file it works with act like a part of program working memory, which have no physical correspondance with a partucular location.

    file() abstract disk blocks. You can't directly read or write. The OS have its way to map the files to disk locations, and make sure the file in that block is unique system-wise. Other people can't know/access it.

<!--list-separator-->

-  OS should be defensive

    -   app can't crash the OS
    -   app can't break the isolation

<!--list-separator-->

-  typical: HW support

    to strong isolation.

    <!--list-separator-->

    -  user/kernel mode

        <!--list-separator-->

        -  user mode

            only unpriveleged instructions `add` `sub`

        <!--list-separator-->

        -  kernel mode

            priviledge of instructions. `manitulating hw directely` `setting up page table` `disable clock interupt`

    <!--list-separator-->

    -  page table/virtual memory

        <!--list-separator-->

        -  page table

            map virtual addr to physical addr
            vew on memory
            basic idea: give every process its own page table.
            so that the process don't have knowledge of others physical memory
            strong memory isolation

<!--list-separator-->

-  Entering kernel

    sometimes we want to transfer control to kernel in user app.
    `ecall(n)` n is a number of system call number
    enter kernel at a `entry point`

    fork() = ecall(n) n is the system call number of fork
    it goes in the kernel, in a file called syscall.c, in which it checked the number, and then call the function

<!--list-separator-->

-  trusted computing base (TCP)

    -   kernel have no bug
    -   kernel treat software as malicious

    <!--list-separator-->

    -  kernel design

        <!--list-separator-->

        -  monolithic kernel design

            all OS code in kernel mode

            -   serious bug
            -   tight integration - high performance
            -   large more(historical reason)

        <!--list-separator-->

        -  microkernel design

            -   some in kernel mode
                -   ipc
                -   vm
                -   multiplex
            -   bulk of OS run in user mode
            -   fewer bugs
            -   use msgs.
                Shell -msg- ipc -msg- FS -msg- ipc -msg- Shell
            -   performance
                -   jumping
                -   tight integration
            -   embeded more

<!--list-separator-->

-  Makefile of xv6

    proc.h -gcc- proc.s -assembler- proc.o -ld- kernel (all the \*.o files load together)
    a kernel.asm is gnerated to see the full form of kernel.

    The qemu enulate a board of risc5 schema board. Should think it that way. It's a c program of for loop


#### kernel/user mode {#kernel-user-mode}


#### system call {#system-call}


#### the above in xv6 {#the-above-in-xv6}


### Page Tables (virtual memory) {#page-tables--virtual-memory}


### Inbox {#inbox}


#### hold and wait condition {#hold-and-wait-condition}

to prevail


#### Mutual exclusion {#mutual-exclusion}


#### Scheduling {#scheduling}

<!--list-separator-->

-  Round Robin Scheduling Algorithm


## the Dinosaur book {#the-dinosaur-book}


### Introduction {#introduction}


#### What is OS? {#what-is-os}

<!--list-separator-->

-  Kernel

    a program runing all the time

    -   System programs
        part of OS but not in kernel
    -   Middleware
        set of software framework
        provide additional servises
        graphic, database, multimedia


#### Computer-System Operation {#computer-system-operation}

<!--list-separator-->

-  Bootstrap program(firmware)

    -   to start the computer
    -   in ROM or EEPROM
    -   `locate OS Kernal and load it into Memory`

<!--list-separator-->

-  Kernel start

<!--list-separator-->

-  System process

    -   after kernel start, it would start some system processes(system daemons)
    -   They run while kernel is runing
    -   After this, the whole system is `booted`. The system then wait for `event to occur`

<!--list-separator-->

-  Interupt

    -   Interupt signal the `event`
    -   Trigered by:
        -   hardware: sending signal to CPU
        -   software: `system call` (monitor call)
    -   After interupted, CPU:
        1.  Stop what it's doing
        2.  Transfer execution to a fixed point

    <!--list-separator-->

    -  Interupt Vector

        A table holding some commonly used interupt service for some devises


### Operating-System Structure {#operating-system-structure}


### Processes {#processes}


#### Process {#process}

Program in execution
Program = xx.exe. Process = that thing in memory after you load xx.exe into memory

<!--list-separator-->

-  Composition

    {{< figure src="/Users/hermanhe/Notes/RoamNotes/process.png" >}}

    -   Text section: program code
    -   Program counter: the current activity
    -   Stack: temporary data(like funciton parameter.etc)
    -   Data section: global vars
    -   Heap: dynamically allocated memory


#### States {#states}

As the program executed, the states change.
states: `new,ready,running,waiting,terminated`

-   new: the process is created
-   running: instructions are being executed
-   waiting: the process is waiting some event to occur
    like I/O or siganl
-   Ready: the process is waiting to be assigned to a processor
-   terminated: the process has finished execution

{{< figure src="/Users/hermanhe/Notes/RoamNotes/procstates.png" >}}


#### Queues {#queues}

Queue is where process is put when not executing
Dispatch: selected to exec

{{< figure src="/Users/hermanhe/Notes/RoamNotes/queues.png" >}}

<!--list-separator-->

-  I/O request queue

<!--list-separator-->

-  Ready Queue

    contains all processes ready to exec. Waiting for CPU
    Each Process is represented with [PCB](#pcb) in Ready Queue
    Generally a `linked list`

    -   header: contains pointer to 1st and final PCB.

    Each PCB have a field pointing to next PCB


#### PCB {#pcb}

Process Control Block(task control block) is the representation of Process

{{< figure src="/Users/hermanhe/Notes/RoamNotes/pcb.png" >}}

-   Process state as in [States](#states)
-   Program Counter: Address of next instruction to exec for this proc.
-   Registers: The condition of all registers of that CPU execing the Proc.
    When Interupt comes, Program Counter and Registers are stored, so that when it's back on the table, they could continue.
-   CPU scheduling information:(more in [CPU Scheduling](#cpu-scheduling))
    -   process priority
    -   pointer to scheduling queues
    -   other scheduling parameters
-   Memory-Management information(more in [Main Memory](#main-memory))
    memory stuffs, like page table.
-   Accounting information
    -   amount of CPU
    -   real time used
    -   time limit
    -   account number
    -   job/proc number
    -   etc
-   I/O status information
    -   list of I/O devices allocated to the process
    -   list of open files


#### Thread {#thread}

the [PCB](#pcb) will be modified to include thread information to support multi thread system


#### Scheduling {#scheduling}

<!--list-separator-->

-  Objectives

    -   multiprogramming: have something to run always
    -   time-sharing: have everything running interactive

    to meet these objectves, the `process scheduler` select proc.

<!--list-separator-->

-  Long-term(job) scheduler

    Process are stored on a disk when first submitted.
    Job scheduler select from that pool to load into memeory
    controls the `degree of multiprogramimg` (how many proc.s in memory)

    selection of process that will be allowd to get in touchwith CPU
    Influenced by: `resource allocation consideration`

    sometimes absent, like in unix/ms.

    <!--list-separator-->

    -  careful selection

        -   Bound:
            -   I/O-bound: more time in I/O
            -   CPU-bound: more time in computation
        -   a good process fix: both of them mixed nicely, so that no device is wasted.(no too long queue and empty queue)

<!--list-separator-->

-  Short-term(CPU)

    select from ready processes to feed CPU
    Very frequent, least once every 100ms

    selection of 1 process from CPU

<!--list-separator-->

-  Medium-term scheduler

    sometimes it's good to swap a proc out.
    swapping(more in [Main Memory](#main-memory))

<!--list-separator-->

-  Context Switch

    include:

    -   CPU Registers
    -   process state
    -   memory-management information

    Few ms speed.
    putting the context in other place, and load the context in the new process's PCB


#### Operations on Process {#operations-on-process}

<!--list-separator-->

-  Creation

    `Parent` proc. create `Child` proc. Forming a tree, starting from the proc with pid=0

    <!--list-separator-->

    -  Resource Options

        -   share all resource
        -   child use subset of parent's resource
        -   share no resource

    <!--list-separator-->

    -  Execution Options

        -   concurrently
        -   parent wait for child to terminate.

<!--list-separator-->

-  Termination

    Process use `exit()` to ask OS to delete it.
    This:

    -   return status data from child to parent (0 for normal)
    -   cause the resource to be relocated

    Parent use `wait()` to wait for child to finish


#### Parent/Child process {#parent-child-process}

<!--list-separator-->

-  execution

    wait, or concurrently
    Concurrent is good forL `information sharing, computation speedup, modularity, and convenience`


#### Coorperating process {#coorperating-process}

<!--list-separator-->

-  interprocess communication mechanism

    <!--list-separator-->

    -  shared memory

        share some variables

        -   type of buffer
            -   bounded: fixed buffer size
            -   unbounded: no limit on the size of buffer

        <!--list-separator-->

        -  how to do it?

    <!--list-separator-->

    -  message passing

        {{< figure src="/Users/hermanhe/Notes/RoamNotes/resource/messagepassing.png" >}}

        <!--list-separator-->

        -  How?

            a message passing facility provide:

            -   send(message)
            -   receive(message)

            a communication link must exist between them

        <!--list-separator-->

        -  Direct/indirect communication

            Messages goes into a queue
            Buffering of the queue:

            -   Zero capacity
            -   Bounded
            -   unbounded

            <!--list-separator-->

            -  Direct Communication

                use `send(P,message)` and `recieve(Q,message)`.
                use pid for the communication (P,Q)
                hard to find the sender.

            <!--list-separator-->

            -  Indirect

                1.  Create a port A
                2.  use `send(A,message)`, `recieve(A,message)`
                3.  destroy a port

        <!--list-separator-->

        -  Synchronous/asynchronous communication

            Blocking is synchronous, non-blocking is asynchronous

            -   Blocking
                -   send: sender is blocked until message recieved
                -   recieve: reciever is blocked until recieve message
            -   non-blocking
                -   send: send and go
                -   recieve: recieve something or NULL

        <!--list-separator-->

        -  Automatic/explicit buffering

<!--list-separator-->

-  communication in client-server systems

    <!--list-separator-->

    -  socket

        socket = endpoint of communication
        a connection between 2 applications include 2 sockets on each end of communication channel

    <!--list-separator-->

    -  remote procedure call(RPC)

        1 process/thread call procedure on remote application

    <!--list-separator-->

    -  pipes

        take output of a command as input of another


### Threads {#threads}

Thread is a `stream of instruciton`

-   Benefits:
    1.  less time to create/terminate/switch than proc.
    2.  better communication efficiency
-   Representation: Thread Control block
    -   Thread ID
    -   Program counter: which instruciton next
    -   Register set: current working variables
    -   Stack: history of thread execution
    -   other things it share with other threads in the proc.


#### Multicore Programming {#multicore-programming}

<!--list-separator-->

-  Concurrency / Parallelism

    -   Concurrency: Overlaped executing period.
    -   Parallelism: Multicore multitasking.


#### Multithreading Models {#multithreading-models}

<!--list-separator-->

-  User level threading

    some software library with threading util take care of that.

    -   Pro
        -   No mode switiching -&gt; fast
        -   cross-OS
        -   flexible. We can write the scheduling algor. ourselves.
    -   Con
        -   system calls block for process. All thread in the process will be blocked altogether.
        -   only concurrecy, not parallelism. only 1 processor.

<!--list-separator-->

-  Kernel level threading

<!--list-separator-->

-  Many to One Model

    `Thread library` do the thread in user space

<!--list-separator-->

-  One-to-One model

    Kernel knows.
    Each user thread map into 1 kernel thread


#### Thread Libraries {#thread-libraries}


#### Implicit Threading {#implicit-threading}


#### Threading issues/Design method {#threading-issues-design-method}


### Process Synchronization {#process-synchronization}


### CPU Scheduling {#cpu-scheduling}


### Deadlocks {#deadlocks}


### Main Memory {#main-memory}


### Virtual Memory {#virtual-memory}


### Mass-Storage Structure {#mass-storage-structure}


### File-System Interface {#file-system-interface}


### File-System Implement {#file-system-implement}


### I/O Systems {#i-o-systems}


### Protection {#protection}


### Security {#security}


### Virtual Machines {#virtual-machines}


### Distributed Systems {#distributed-systems}


## Trying Machine {#trying-machine}


### Thread {#thread}


#### Thread {#thread}

stream of instruciotn
flow of control in a process


#### Pros of Thread {#pros-of-thread}

-   Responsiveness
    have 1 thread doing a very difficult job
    other threads works normal, and interact immediately
-   Resource sharing
    thread of 1 process share the memories without explicit specification
-   Economy
    faster in creation and context switch due to resource sharing
-   Scalability
    can run faster on multicore systems. while 1 thread process runs the same on multicore or singlecore.


#### Thread Control Block {#thread-control-block}

-   thread ID
-   program counter
-   register set
-   stack


#### Sequential/Multi-threaded program {#sequential-multi-threaded-program}

-   Sequential program: program with only 1 stream of instruction
-   multi-threaded program: program with n streams of instruction


#### single/multi-threaded processes {#single-multi-threaded-processes}

-   single thread process: traditional process
-   multithreaded process: same code, data, file. but multiple threads. Perform more than 1 task at time


#### Thread life cycle {#thread-life-cycle}

{{< figure src="/Users/hermanhe/Notes/RoamNotes/threadlifecycle.png" >}}

<!--list-separator-->

-  Preemption


#### Amdahl's law {#amdahl-s-law}

\\(speedup \le \frac{1}{S + \frac{(1 - S)}{N}}\\) where S stands for `serial parts of the program`
the law states:

-   the speed up rise with N(core number) rise
-   the speed converge to \\(\frac{1}{S}\\) as N approach \\(\inf\\).


#### Challenges with multicore programming {#challenges-with-multicore-programming}

-   Identifying Tasks
    find areas that can be devided into concurrent threads
    They should be independent.
-   Balance
    some task are too small to run seperately. like x = x + 1.
-   Data splitting
    the data accessed should be devided to corresponding processors.
-   Data dependency
    when proc1 depend on the result of proc2. They should be synchronized, so that the data is used right.
-   Testing and debugging
    The possible order of instruction execution increase largely when concurent.


#### Concurrency/Parallelism {#concurrency-parallelism}

-   Concurrency: little bit of every one
-   parallelism: more cores.

<!--list-separator-->

-  types of parallelism

    -   data parallelism
        data is divided to cores for identical operation
        array1.sum() =&gt; array1[:5].sum() + array1[5:].sum()
    -   Task parallelism
        unique operation to cores


#### Synchrounous threading {#synchrounous-threading}

<!--list-separator-->

-  fork-join strategy

    parent fork child, and wait for them all to terminate.
    data sharing is significant. The parent may use all the data child manipulated.


#### Threading Support {#threading-support}

<!--list-separator-->

-  User level libraries

    library create and manages threads
    program -libs-&gt; multiple little threads scheduled -&gt; new program -&gt; load as process -&gt; single threaded process on 1 core.

    <!--list-separator-->

    -  pro

        -   no mode switching -&gt; fast
        -   options for scheduling
        -   not OS specific

    <!--list-separator-->

    -  con

        -   the blocking system calls would block the whole process, and threfore all threads of the process
        -   no parallelism

<!--list-separator-->

-  Kernel level

    kernel create and manages, schedules threads.

    <!--list-separator-->

    -  pro

        -   use multiple cores
        -   blocking at thread level
        -   multithread kernel routines(everybody multithread)

    <!--list-separator-->

    -  con

        -   thread switch always involves kernel -&gt; mode switch -&gt; slower


#### lightweight process {#lightweight-process}

an intermediate data structure between user and kernel threads

-   to user: virtual processor
-   to kernel: attach to a kernel therads
-   when blocking happens: block on thread level, not process.
-   could use multiple cores.


#### multithreading models {#multithreading-models}

<!--list-separator-->

-  M to O

    with Thread librarys.
    the functions in the library schedule the threads into 1 large thread, feeding to 1 kernel thread.

<!--list-separator-->

-  O to M

    each user thread map to one kernel thread.
    concurrency, clever blocking.
    the overhead could be troublesome, so often the number of threads are restricted

<!--list-separator-->

-  M to M

    a set of threads map to a set of kernel therad with less or equal degree.
    Therefore unlimited user threads, concurrency and clever blocking.

<!--list-separator-->

-  2 level

    M to M + O to O side by side.


#### Thread libraries {#thread-libraries}

lib that provide functions to `create` `use` `terminate` therads

<!--list-separator-->

-  Thread API

    Functions and Data structure of the thread library.
    like `future`, `thread`.

<!--list-separator-->

-  POSIX

    <!--list-separator-->

    -  Pthread

<!--list-separator-->

-  Java

<!--list-separator-->

-  Win32

<!--list-separator-->

-  Implementation

    -   in user space: local function call
        codes and data structure in user space
    -   kernel level: system call
        codes and data structure in kernel space


#### Asynchronous/synchronous threading {#asynchronous-synchronous-threading}

-   Asynchronous: parent don't wait child
-   synchronous: parent wait child.


#### Explicit/Inplicit threading {#explicit-inplicit-threading}

<!--list-separator-->

-  Explicit threading

    Programmer create and manage the threads

<!--list-separator-->

-  Inplicit threading

    compilers and run-time libs create and manage threads

    <!--list-separator-->

    -  Thread pool

        a pool of threads init at process init.
        They sit and wait for work.
        when works come, 1 thread will be call from the pool, and return after the work done.

    <!--list-separator-->

    -  OpenMP

        set of compiler directives for C,C++,Fortran, that instruct compiler to generate parallel code automatically.
        `parallel region` is idendtified with the directives.

        <!--list-separator-->

        -  parallel region

            ```c
            #include <omp.h>
            #include <stdio.h>

            int main(int argc, char *argv[]){
              #pragma omp parallel //the parallel region
              {
                printf("I am a parallel region.");
              }
              return 0;
            }
            ```

    <!--list-separator-->

    -  Grand Central Dispatch

        extension to C and C++ on macOS and iOS to support parallelism
        it use

        <!--list-separator-->

        -  blocks

            `^{printf("hi");}`

        <!--list-separator-->

        -  dispatch queue

            blocks as unit, go in that queue.
            when block removed, the block goes to a thread.

            -   queue types:
                -   serial: FIFO, 1 by 1
                -   concurrent: FIFO, n by n.
                    there's 3 concurrent queue with different priority.

        <!--list-separator-->

        -  main queue

            every process have this serial queue


#### asynchronous procedure call (APC) {#asynchronous-procedure-call--apc}


#### fork() {#fork}

create a new child thread from the parent thread. an identical copy.

<!--list-separator-->

-  child/parent thread


#### exec() {#exec}

replace the executable of the thread. others stay the same.

<!--list-separator-->

-  interaction of exec() and fork()


#### signal handling {#signal-handling}

a interrupt or event generated by a unix system
in response to a condition/actoin

<!--list-separator-->

-  signal handler

    the function handling the signal
    all signals are handled exactly once

<!--list-separator-->

-  asynchronous signal

    from outside the process that receives it

<!--list-separator-->

-  synchronous signal

    from the same process


#### thread cancellation {#thread-cancellation}

<!--list-separator-->

-  target thread

<!--list-separator-->

-  Asynchronous cancellation

    terminate the target thread immediately

<!--list-separator-->

-  Deferred cancellation

    the target thread periodically check if it should be terminated.
    the canceled thread has sent the cancellation request

    <!--list-separator-->

    -  cancellation point

    <!--list-separator-->

    -  cleanup handler


#### single- to multi-thread {#single-to-multi-thread}


#### Thread-local storage (TLS) {#thread-local-storage--tls}


#### Scheduler Activations (lightweight process) {#scheduler-activations--lightweight-process}

<!--list-separator-->

-  upcall

<!--list-separator-->

-  upcall handler


#### Linux thread story {#linux-thread-story}


### Process Synchronization {#process-synchronization}


#### coordination of process {#coordination-of-process}

manageing the execution of processes so that no 2 processes access same resource the same time


#### share resource {#share-resource}


#### critical-section problem {#critical-section-problem}

<!--list-separator-->

-  critical section

    the area where the shared data is accesed

    ![](/Users/hermanhe/Notes/RoamNotes/racecondition.png)
    to ensure the correctness, the logical parallelism is turned off in critical section.

<!--list-separator-->

-  entry section

    code entering critical section

<!--list-separator-->

-  exit section

    code leaves critical section

<!--list-separator-->

-  remainder section

    code other than the above 3 sections.

<!--list-separator-->

-  solution

    <!--list-separator-->

    -  requirement

        <!--list-separator-->

        -  Mutal Exclusion

            only 1 process is in critical section.

        <!--list-separator-->

        -  Progress

            when 0 process is in critical section, someone could get into critical section.
            when 2 process competeing, 1 must win.

        <!--list-separator-->

        -  Bounded waiting.

            the waiting time should be limited.
            1 process would lose,lose,lose...win!

    <!--list-separator-->

    -  software

        rely on algorithms ensuring only 1 process in critical section.
        since CS is untouchable, use entry and exit section to build the system.

        <!--list-separator-->

        -  Peterson's Solution

            by Gary L. Peterson in 1981
            between 2 process P0 and P1

            ```c
            int turn; //whose turn it is to enter
            boolean flag[2]; //init to FALSE. flag[i] = TRUE -> Pi is ready.
            ```

            <!--list-separator-->

            -  Peterson's Algorithm

                ```c
                do {
                  //entry section start
                  flag[0] = true; //P0 ready
                  turn = 1; //give away turn
                  while (flag[1]&&turn==1); //wait while P1 is ready and having its turn
                  critical_section();
                  //entry section end
                  flag[0] = false; //exit section
                  //remainder section.
                 } while (true);
                ```

        <!--list-separator-->

        -  cons

            -   complicated to program
            -   busy waiting(CPU wasted)
            -   it's better to just block the waiting process.
                but that involves OS

    <!--list-separator-->

    -  hardware

        rely on machine instruction of [Locks](#locks)

        <!--list-separator-->

        -  Locks

            lock on the required resource at [entry section](#entry-section)
            remove lock at [exit section](#exit-section)

            <!--list-separator-->

            -  Test and Set solution

            <!--list-separator-->

            -  compare and swap

                the Pi finds lock = 0 proceed.
                Pi lock other proc by setting lock = 1.
                at exit, Pi set lock = 0 to enable progress.

        <!--list-separator-->

        -  pro

            -   scalable.
                work on n proc. on n cores.
            -   simple
            -   multipel CS supported

        <!--list-separator-->

        -  con

            <!--list-separator-->

            -  busy-waiting

            <!--list-separator-->

            -  starvation

                infinite blocking
                1 proc leave CS, multiple waiting.

            <!--list-separator-->

            -  deadlock

                iofinite waiting to a signal from the other.
                priority. High priority will obtain processor, while the current proc. don't have one to exit CS

    <!--list-separator-->

    -  OS and PL solution

        provide function/stucture to use for synchronization

    <!--list-separator-->

    -  Mutex lock/Mutual Exclusion

        apply lock at entry, remove lock at exit.
        block proc. asking for lock while the lock is unavailable

        <!--list-separator-->

        -  kernel-level

            disable interupts

        <!--list-separator-->

        -  software-level

            <!--list-separator-->

            -  busy waiting(spinning)

                constantly check if a lock is available.

        <!--list-separator-->

        -  spinlock

    <!--list-separator-->

    -  Semaphores

        Semaphore is a Integer var, that is only accessed by wait() and signal().

        ```c
        wait(){
          while(signal<=0);
          signal--;
        }
        siganl(){
          signal++;
        }
        ```

        by init signal to n, enable n processes into CS at same time.

        <!--list-separator-->

        -  counting semaphore

            semaphore goes to n
            for resource having multiple instances

        <!--list-separator-->

        -  binary semaphore

            semaphore init to 1

        <!--list-separator-->

        -  issue with semaphore


#### atomic instuction {#atomic-instuction}

instruction that is not interuptable.


#### Preemptive/nonpreemptive kernel {#preemptive-nonpreemptive-kernel}


#### multiprogramming {#multiprogramming}


#### Synchronization hardware {#synchronization-hardware}


#### Race condition {#race-condition}

the condition that multiple proc.s manipulate same shared data concurrently.
final value depends on the random order of the manipulation.

To prevent race condition, concurrent processes must be synchronized


#### classical process-synchronization probelms {#classical-process-synchronization-probelms}

<!--list-separator-->

-  The Bounded-Buffer / Producer-Consumer Problem

    {{< figure src="/Users/hermanhe/Notes/RoamNotes/boundedbuffer.png" >}}

<!--list-separator-->

-  The Readers–Writers Problem

    n readers, n writers.
    readers read, writers write.
    write: only 1 writer access the shared data.
    read: all reader and non writer can access the shared data
    use a reader-writer lock that specify the mode of lock.

<!--list-separator-->

-  The Dining-Philosophers Problem

    {{< figure src="/Users/hermanhe/Notes/RoamNotes/diningphilosopher.png" >}}

    <!--list-separator-->

    -  solutions

        -   allow only 4 philosopher to be hungary together
        -   allow pickup only if both chopsticks available(in CS)
        -   odd # philosophers pick left chopstick 1st
        -   Even # philosopher always picks up right chopstick 1st


#### Monitor {#monitor}


### CPU Scheduling {#cpu-scheduling}


#### concepts {#concepts}

<!--list-separator-->

-  Execution phases of a process

    interleaved with `cpu-burst` and `io-burst`

<!--list-separator-->

-  CPU-I/O Burst Cycle

    each process is build up with interleaved cpu-burst and io-burst.

<!--list-separator-->

-  Type of I/O Processes

    whether the process is I/O bound or CPU bound determined the apropriate scheduling algorithm

    <!--list-separator-->

    -  I/O bound

        many short cpu burst
        mostly waiting for I/O
        affect user interaction.(word processor/emacs)

    <!--list-separator-->

    -  CPU Bound

        few long cpu burst
        I/O very few
        long cpu burst helps
        could do with lower priority(3d rendering, machine learning)

<!--list-separator-->

-  Preemptive/non-preemptive Scheduling

    -   preemptive: the OS can stop execution of the running process on cpu
    -   non-preemptive: the OS can't stop the current process. Must wait until it exit.

<!--list-separator-->

-  CPU Schedulers

    -   Trigger:
        -   timer interrupt
        -   running process blocked by I/O
        -   By means of state change:
            -   Running to Ready [interrupt] `preemptive`
            -   Running to Waiting [I/O request/wait()] `non-preemptive`
            -   Waiting to Ready [I/O complete] `preemptive`
            -   \* to Terminate `non-preemptive`
    -   deed:
        1.  triggered
        2.  pick another process from ready queue
        3.  perform context switch

<!--list-separator-->

-  Dispatcher

    hand in control of CPU to the selected process(by short-term scheduler)
    called in every process switch

    1.  switch context
    2.  switch to user-mode
    3.  jump to the execution location in the program

    <!--list-separator-->

    -  dispatch latency

        time of dispatcher stop and start process.


#### criteria {#criteria}

-   Max CPU utilization – keep the CPU as busy as possible
-   Max Throughput – complete as many processes as possible per unit time
-   Fairness - give each process a fair share of CPU
-   Min Waiting time – process should not wait long in the ready queue
-   Min Response time – CPU should respond immediately


#### algorithms {#algorithms}

<!--list-separator-->

-  Terms

    <!--list-separator-->

    -  Arrive Time

        point of process arrives in the <span class="underline">ready queue</span>

    <!--list-separator-->

    -  Completion Time

        point of process complete execution

    <!--list-separator-->

    -  Burst time

        duration required by a process for CPU execution

    <!--list-separator-->

    -  Turnaround time

        duration of | 1st time into ready state -...-&gt; complete |
        turnaround time = Completion time - Arrive time

    <!--list-separator-->

    -  Waiting Time

        duration of process waiting in ready queue
        Waiting Time = Turnaround Time - Burst Time

    <!--list-separator-->

    -  Response Time

        Point of process gets CPU for the 1st time

<!--list-separator-->

-  Algors

    <!--list-separator-->

    -  First-Come, First-Served (FCFS) Scheduling

        -   first-come, first-served
        -   waiting time high

    <!--list-separator-->

    -  Shortest-Job-First (SJF) Scheduling

        without preemption
        aims at `shortest burst time`

        <!--list-separator-->

        -  estimate next burst time

            e = estimated time
            t = actual time
            a = weight factor (1 &lt; a &lt; 0)

            \\(e\_{n+1} = at\_n +(1-a)e\_{n}\\)

        <!--list-separator-->

        -  pro

            -   min average waiting time
            -   min average response time

        <!--list-separator-->

        -  con

            -   not practical: burst time unknown
                so SJF cannont be implemented at short term scheduling level
            -   starve long job.

    <!--list-separator-->

    -  Shortest Remaining Time First (SRTF) Scheduling

        -   When the new-comer have the shortest burst time, switch to him.

    <!--list-separator-->

    -  Priority Scheduling

        -   Each process assigned a priority
            -   based on:
                -   OS criteria(memory...)
                -   admin's choice
        -   cpu allocated to highest priority
        -   Probelm:
            -   Starvation: low priority never exec.
                -   solution: aging.

    <!--list-separator-->

    -  Round Robin(RR) Scheduling

        -   a quantom of time `q` for everyone
            q of P1, then q of P2....

        <!--list-separator-->

        -  Performance

            -   large q: FCFS
            -   small q: cost of overhead. Large compared with context switch.

    <!--list-separator-->

    -  Multiple-Level Queues Scheduling

        -   Ready queue partitioned (permanantly) into 2 queues:
            -   Foreground Proc
            -   Background Proc
        -   Schedule in 2 types:
            -   To the Queues
            -   In the Queue
        -   Among the Queues:
            -   Fixed Priority Scheduling
                first forground, then backgound
            -   Time slice
                80% time Forground in RR, 20% time Background in FCFS
        -   Categories of Proc: in them the priority desc
            -   Interactive processes
            -   Non-interactive processes
            -   CPU-bound processes
            -   I/O-bound processes
            -   Background processes
            -   Foreground processes

    <!--list-separator-->

    -  Multilevel Feedback Queue Scheduling

        place process into priority queues based on their CPU burst behaviour

        -   IO higher, CPU lower
        -   Basic Rules:
            1.  New proc. highest priority
            2.  quantum finished: (if proc not finish) into next lower queuef
        -   Parameters
            -   n queues
            -   scheduling algorithem for each queue
            -   upgrade method
            -   demote method
            -   queue select method
        -   Example
            -   Q1: RR 8ms
            -   Q2: RR 16ms
            -   Q3: FCFS

    <!--list-separator-->

    -  Thread Scheduling

        <!--list-separator-->

        -  contention scope

            the scope where the user threads compete for use of physical CPU

            <!--list-separator-->

            -  Process Contention Scope PCS (unbound thread)

                local.
                many-to-one

            <!--list-separator-->

            -  System Contention Scope SCS (bound thread)

                global
                one-to-one

    <!--list-separator-->

    -  Multiple-Processor Scheduling

        <!--list-separator-->

        -  inside Multiprocessor OS

            -   Require different inter-proc. comminucation &amp; synchronization techniques
            -   All processors share a memory
            -

        <!--list-separator-->

        -  3 structures

            <!--list-separator-->

            -  Separate Kernel Configuration

                every Processor have it's own I/O device and file system
                little interdependency

                -   no parrallel execution

            <!--list-separator-->

            -  Master–Slave Configuration (Asymmetric Configuration)

                 1 master processor and other slave processors
                OS run by master
                process scheduling run by master

            <!--list-separator-->

            -  Symmetric Configuration

                Any processor can access any device and can handle any interrupts generated on it.

                Mutual Exclusion for the OS is required.
                OS is seperated into independent parts. to prevent concurrency

                <!--list-separator-->

                -  approaches

                    <!--list-separator-->

                    -  common ready queue

                    <!--list-separator-->

                    -  per-core run queues

                <!--list-separator-->

                -  Process Affinity

                    caches make 1 processor more "familier" for a process.
                    So it's better to use 1 processor all along.

                    <!--list-separator-->

                    -  soft affinity

                        no guarentee

                    <!--list-separator-->

                    -  hard affinity

                        allowing a

                <!--list-separator-->

                -  Load Balencing

                    for each core's queue

                    <!--list-separator-->

                    -  Push migration

                        when too long, push task to other processor's queue

                    <!--list-separator-->

                    -  Pull migration

                        when empty ready queue, read from othre processors' queue. Transfer them into my own queue

                <!--list-separator-->

                -  Multicore Processors

                    a core executes a thread a time

                    <!--list-separator-->

                    -  Memory stall

                        single-core processor waiting for the data to become available.

                        use that time to execute other thread.

                <!--list-separator-->

                -  Hyperthreading

                    a intel technology
                    a physical processor divieded into 2 logical processors that are treated like seperate physical processors.

                <!--list-separator-->

                -  Multithreading

                    multiple thread on same core

                    <!--list-separator-->

                    -  coarse-grained

                        switch thread only when 1 thread block

                    <!--list-separator-->

                    -  fine-grained

                        scheduling in Round Robin policy

    <!--list-separator-->

    -  Real-Time CPU Scheduling

        <!--list-separator-->

        -  Real-time system

            a system where time play important role

            <!--list-separator-->

            -  hard real-time system

                must meet deadline

            <!--list-separator-->

            -  soft real-time system

                desirable not not necesary

                <!--list-separator-->

                -  aperiodic tasks

                    irregular arrival time

                <!--list-separator-->

                -  periodic tasks

                    once per period T

        <!--list-separator-->

        -  Scheduling real-time tasks

            {{< figure src="/Users/hermanhe/Notes/RoamNotes/realtimelatency.png" >}}

            <!--list-separator-->

            -  interrupt latency

                determine interrupt type
                switch context

            <!--list-separator-->

            -  dispatch latency

        <!--list-separator-->

        -  Static Scheduling

            schedule prepared before app startup

        <!--list-separator-->

        -  Priority-based scheduling

            priority assigned base on how quickly it must react

        <!--list-separator-->

        -  Dynamic scheduling

            schedule change over time.

        <!--list-separator-->

        -  timing constraints

            -   period:
            -   deadline:
            -

        <!--list-separator-->

        -  scheduling criteria

            -   timing constraints met
            -   cost of context switch, while preempting, must be reduced
            -

        <!--list-separator-->

        -  preemptively/non-preemptively, staticly/dynamically

        <!--list-separator-->

        -  Rate-Monotonic Scheduling

            static priority-based preemptive scheduling algorithm

            shortest period = highest priority

        <!--list-separator-->

        -  Earlies-Deadline-First Scheduling

            deadline - priority
            dynamically assign priority according to deadline

        <!--list-separator-->

        -  Proportional Share Scheduling

            T shares are allocated to all procs. in the system
            An app recive N shares. N &lt; T

        <!--list-separator-->

        -  Process in here

            periodic.

            -   once the process get CPU, it has:
                -   fixed processing time \\(t\\)
                -   deadline \\(d\\)
                -   period \\(p\\)
                -   \\(0 \le t \le d \le p\\)
                -   rate \\(\frac{1}{p}\\)
                -   illustrate

                    {{< figure src="/Users/hermanhe/Notes/RoamNotes/ptd.png" >}}

    <!--list-separator-->

    -  Algorithm Evaluation

        ❑

        <!--list-separator-->

        -  Deterministic evaluation

            1.  define workload: avg waiting time?
            2.  test.

        <!--list-separator-->

        -  Queueing Models

            we define queues for I/O and CPU, then queueing theory comes in handy

            <!--list-separator-->

            -  little's formula

                \\(n = \lambda \times W\\)
                n:average queue length
                W:avg waiting time
                \\(\lambda\\):avg arrival rate
                if we know 2 of the parameters, we know the thirs

        <!--list-separator-->

        -  Simulations

            trace tapes to provide real machine process to simulate algorithms on.


### Deadlock {#deadlock}


#### System Model {#system-model}

-   system have resources.
-   Resource have R types
-   Resource have W Instances
-   Process Use Resource with:
    -   request
    -   use
    -   release


#### Deadlock Characterizaiton {#deadlock-characterizaiton}

deadlock arise if the four condition the same time

<!--list-separator-->

-  Mutual exclusion

    1 process at a time hold that resource

<!--list-separator-->

-  Hold and wait

    the process holding 1 resource wait for the other one

<!--list-separator-->

-  No preemption

    resource released only voluntarily

<!--list-separator-->

-  Circular wait

    closed chain of process waiting for resource from the next one in chain

<!--list-separator-->

-  Resource allocation Graph

    {{< figure src="/Users/hermanhe/Notes/RoamNotes/resourceallocationgraph.png" >}}

<!--list-separator-->

-  Basic Facts

    -   graph have no cycle = no deadclock
    -   have cycle:
        -   1 instance per resource type = deadclock
        -   n instances per resource type: possibilities.


#### Methods for handling Deadlocks {#methods-for-handling-deadlocks}

<!--list-separator-->

-  Deadlock Prevention

    try to eliminate 1 of the 4 conditions

    <!--list-separator-->

    -  Mutual exclusion

        no

    <!--list-separator-->

    -  Hold and wait

        limit max resource hold to 1.
        -&gt; low resource use,

    <!--list-separator-->

    -  No preemption

        -   when holding 1 asking 1 denyed, release all.
        -   or if the asked 1 is held by other, preempt him

    <!--list-separator-->

    -  Circular wait

        order the resource types.
        restrict request object to R3-5 after holding R3.

<!--list-separator-->

-  Deadlock Avoidence

    constrain request to prevent least 1 of the 4 conditions.

    -   don't start dangerous proc.
    -   don't grant dangerous request.

    <!--list-separator-->

    -  safe state

        at least 1 sequence of resource allocation that does not result in deadlock

    <!--list-separator-->

    -  Max need

        total amount of each resources

    <!--list-separator-->

    -  available resource

        total amount of each unallocated resources

    <!--list-separator-->

    -  need

        future request from P1 for R2

    <!--list-separator-->

    -  allocation

        the R0 and R1 that P1 have been holding.

    <!--list-separator-->

    -  single instance of Resource

        <!--list-separator-->

        -  claim edge

            Pi may request Rj.
            if check cycle, reject, otherwise claim -&gt; request

    <!--list-separator-->

    -  Multiple Instances of REsources

        <!--list-separator-->

        -  `Banker's algorithm`

            <!--list-separator-->

            -  Data structures

                ```c
                n = number of process;
                m = number of resource type;
                avalable[m] containing instance numbers;
                Max[n,m]. Max[i,j]=k,then Pi may request at most k instances of Rj;
                Allocation[n,m];Pi have k of Rjs;
                Need[n,m];Pi still need k of Rjs. Need[i,j] = Max[i,j]-Allocaiton[i,j]
                ```

            <!--list-separator-->

            -  Safety Test algo

                1.  init

                    ```c
                    Work[m] = available[m];
                    Finish[n]= false;
                    ```
                2.  find `i` such that:
                    -   Finish[i] = false
                    -   Need[i]&lt;=Work[i]
                    -   if no, goto step 4
                3.  work = work + allocation; finish[i]= true;goto step 2
                4.  if finish[i] = true for all i, then safe state.

            <!--list-separator-->

            -  Resource request algo

                pretend to do the request.
                check that map.

<!--list-separator-->

-  Deadlock Detection

    <!--list-separator-->

    -  Detection of single instance of resource

        <!--list-separator-->

        -  wait-for graph

            merge resource.

        <!--list-separator-->

        -  detection

            search for loop in wait-for graph. O(n2)

    <!--list-separator-->

    -  Detection for multiple instances of resources

        banker's algorithm.

        <!--list-separator-->

        -  available

        <!--list-separator-->

        -  allocation

        <!--list-separator-->

        -  request

    <!--list-separator-->

    -  Usage

        when?
        if too late, the deadlock would grow large and hard to deal with


#### Recovery from deadlock {#recovery-from-deadlock}

<!--list-separator-->

-  Process Termination / Abort Process

    ➢ Abort all deadlocked processes
    ➢ Abort one process at a time until the deadlock cycle is eliminated

    -   Order
    -   Priority of the process
        1.  How long process has computed, and how much longer to completion
        2.  Resources the process has used
        3.  Resource's process needs to complete
        4.  How many processes will need to be terminated
        5.  Is process interactive or batch?

<!--list-separator-->

-  Resource Preemption

    1.  select victim
    2.  rollback
    3.  starvation
        make sure limited time 1 is a victim


## The Project {#the-project}


### Scheduler {#scheduler}

My goal is to:

1.  Gain practical experiance of OS
2.  Pass [CPT104 OS Concepts]({{< relref "20220220183600-cpt104.md" >}}) with High score

In order to do that, not only I should complete all CPT104 Activities, but also dig in using

-   MIT6.S081
    I stored thing in my download drive
    [official schedule](https://pdos.csail.mit.edu/6.828/2020/schedule.html) holds schedule information of the course.
-   the Dinosaur book
    it contains much practical problems.

The MIT course is in video and practices, and the dinosour book is a book. I plan to use [page reading machine](#page-reading-machine) on [the Dinosaur book](#the-dinosaur-book) and [video watching machine](#video-watching-machine) on the video materails of MIT.

I'll be holding Notes in this page, which, will be transformed into blogs in the future on my website.

Keep that in mind, and knows that there's an audiance. So make them comprehensible, and complete.


### page reading machine {#page-reading-machine}


#### Principle {#principle}

<!--list-separator-->

-  Distributed Exposure

    Various exposure to the materials build familiarance, the key to memory and understanding/processing.

<!--list-separator-->

-  Initiative

    Taking Initiative counters dizziness and copying.


#### Flow {#flow}

1.  Go through the headings, mark seemed important keywords to headings
2.  after the first skim, go to the notes and try to explain them. When failed, check the text.
3.  `[[]]` juicy jargons along the way
4.  after current node done...
5.  navigate to the first link(`C-c C-x C-p`)
6.  Create and edit the node
7.  Refile it to where it belong(`C-c m`)
8.  Back to the point using `org-mark-ring-goto(C-c 5)`
9.  Go to next link(`C-c C-x C-n`)
10. Repeat step 4-7 until all links are pointing to somewhere.


### video watching machine {#video-watching-machine}


#### <span class="org-todo todo TODO">TODO</span> Constructing video watching machine {#constructing-video-watching-machine}

<!--list-separator-->

- <span class="org-todo todo TODO">TODO</span>  Do a class conventionally, record obstacles.

    Goal - Problem record - Diagnose - Plan - Execution.

    <!--list-separator-->

    -  conventianl watching

        1.  Watch video
        2.  (Pause video to)Take note of every section
        3.  Take note of every listed experiance
        4.  Take note of every code.
        5.  Try the code myself.

        <!--list-separator-->

        -  Note

            <!--list-separator-->

            -  Page table

                a.k.a, virtual memory.

                <!--list-separator-->

                -  why use Page table? =&gt; Isolation.

                    To implement `isolation between programs` in a `whole bulk of physical memory space`.

                    [Address space](#address-space) is the idea of an ideal Isolated Senario.

                <!--list-separator-->

                -  Address Space

                    Give every process it's own `Address space`

                    `illustrate of 3 process having there own address space`

                    There are various approaches to implement Address space. [Page Table](#page-table) is one approach.

                <!--list-separator-->

                -  Pageing Hardware

                    The hardware structure that supports [Page Table](#page-table), mainly by processor, or MMU

                    <!--list-separator-->

                    -  Page Table

                        `Illustrate of paging`

                        -   VA: Virtual Address, PA: Physical Address
                            -   VA: location of the code from the process's perspective
                            -   PA: location of the code from main memory's perspective
                        -   CPU holds:
                            -   satp register: PA, location of page table in main memory.
                            -   other: VA, location of data or code address.

                <!--list-separator-->

                -  xv6 vm code+layout


### Practice {#practice}

The MIT course provides extensive lab practices.
The completion and logging would be stored in [MIT 6.S081 Lab Logs](#mit-6-dot-s081-lab-logs)


## MIT 6.S081 Lab Logs {#mit-6-dot-s081-lab-logs}


### Lab 1: Unix utils {#lab-1-unix-utils}


#### <span class="org-todo todo TODO">TODO</span> reading xv6 ch1 {#reading-xv6-ch1}


#### xv6 system calls {#xv6-system-calls}

| System call                          | Description                                                              |
|--------------------------------------|--------------------------------------------------------------------------|
| int fork()                           | Create a process, return child’s PID.                                    |
| int exit(int status)                 | Terminate the current process; status reported to wait(). No return.     |
| int wait(int \*status)               | Wait for a child to exit; exit status in \*status; returns child PID.    |
| int kill(int pid)                    | Terminate process PID. Returns 0, or -1 for error.                       |
| int getpid()                         | Return the current process’s PID.                                        |
| int sleep(int n)                     | Pause for n clock ticks.                                                 |
| int exec(char \*file, char \*argv[]) | Load a file and execute it with arguments; only returns if error.        |
| char \*sbrk(int n)                   | Grow process’s memory by n bytes. Returns start of new memory.           |
| int open(char \*file, int flags)     | Open a file; flags indicate read/write; returns an fd (file descriptor). |
| int write(int fd, char \*buf, int n) | Write n bytes from buf to file descriptor fd; returns n.                 |
| int read(int fd, char \*buf, int n)  | Read n bytes into buf; returns number read; or 0 if end of file.         |
| int close(int fd)                    | Release open file fd.                                                    |
| int dup(int fd)                      | Return a new file descriptor referring to the same file as fd.           |
| int pipe(int p[])                    | Create a pipe, put read/write file descriptors in p[0] and p[1].         |
| int chdir(char \*dir)                | Change the current directory.                                            |
| int mkdir(char \*dir)                | Create a new directory.                                                  |
| int mknod(char \*file, int, int)     | Create a device file.                                                    |
| int fstat(int fd, struct stat \*st)  | Place info about an open file into \*st.                                 |

cci| int stat(char \*file, struct stat \*st) | Place info about a named file into \*st.                                  |

| int link(char \*file1, char \*file2) | Create another name (file2) for the file file1. |
|--------------------------------------|-------------------------------------------------|
| int unlink(char \*file)              | Remove a file.                                  |


#### fork() {#fork}

create a child process

<!--list-separator-->

-  positions

    -   memory: same content, different location
    -   file descriptors: the same

<!--list-separator-->

-  behaviour

    -   a child process created, with identical everything of the parent process.
    -   child process and parent process don't share memory variables
    -   [?] whereever the `fork()` call is at, the whole program is duplicated

<!--list-separator-->

-  returns

    -   pid of the created child [in parent]
    -   0 [in child]

    <!--list-separator-->

    -  Tree of child processes

        -   Since
            -   in child processes, the value of the creating fork() is 0
            -   memory is duplicated for every child.
        -   Therefore
            -   on a leaf child
                if use `pid1=fork()` to store the pid, then all processes in the route from root to this child would have pid stored 0.


#### wait() {#wait}

wait() is companion of [fork()](#fork), parent block until childs finish.


#### exit() {#exit}


#### File Descriptor {#file-descriptor}

it's an integer.
like, 0 - standard in, 1 - standard out, 2 - standard error


#### read() {#read}


#### write() {#write}


#### File system {#file-system}


#### Pipe {#pipe}

-   1 pipe for one way communication.
-   the file


#### lab1.2: sleep() {#lab1-dot-2-sleep}

I see that you need 1 pipe for each direction of communication, 1 for P1 to P2, and 1 for P2 to P1
Otherwise, when P1 finished writing and start to read, it could read the data it just write into the pipe.


#### lab1.3: prime() {#lab1-dot-3-prime}

-   I see that procedure doing it is not promising: no
-   I see that funciton layer_init don't work well. it don't tell whether the nums are prime.
-   It's key where the child is inited in the recursive calls.
    it should be not in the while loop for while loop is giving it chance to

<!--listend-->

```c
#include "../kernel/types.h"
#include "user.h"
#include "../kernel/stat.h"

int main(){
  int p1[2];
  pipe(p1);
  if (fork() == 0){
    for(int i = 2;i<32;i++){
      write(p1[1],&i,4);
      printf("inited %d\n",i);
      }
    exit(0);
  }else
  {
    child_process(p1);
  }
  return 0;
}

void child_process(int p[2]){
  int prime;
  int child_p[2];
  pipe(child_p);
  close(p[1]);
  int len = read(p[0],&prime,4);
  printf("prime: %d\n",prime);
  if (len==0){close(p[0]);exit(0);}
  if (fork()==0){
    close(p[0]);
    child_process(child_p);
  } else {
    while(1){
      int num;
      int len = read(p[0],&num,4);
      if (len==0){close(p[0]);close(child_p[1]);
	wait(0);
	exit(0);
      } else
      if ( num % prime!= 0){
	write(child_p[1],&num,4);
      }
    }
  }

}
```

<!--list-separator-->

-  good recursive concurrent process call sturcure

    1.  every child process have it's own setup -&gt; child_process()
    2.  fork(), and on the child process, invoke child_process()

    Then, the structure would be a lovely:

    {{< figure src="/Users/hermanhe/Notes/RoamNotes/resource/recurrent.png" width="400px" >}}


#### miscellaneous {#miscellaneous}

<!--list-separator-->

-  main(int argc, char\* argv[])

    -   argc: count of args passed by command-line
    -   argv: args.
        typically, for `echo hi!`, `argv[0] = "echo", argv[1] = "hi!"`

<!--list-separator-->

-  how to add program?

    1.  write source code
    2.  add path to `UPROC` variable in `riscv-2019fall/Makefile`
    3.  recompile with `make qemu` and the program should be loaded to the shell

<!--list-separator-->

-  in usys.S

    what `li` means in `li a7, SYS_sleep`?

<!--list-separator-->

-  loading sleep

    write the code into user/sleep.c, and the Make would take care of later things.

<!--list-separator-->

-  page fault!

    ```example
    init: starting sh
    $ sleep
    sleep
    wrong number of args!usertrap(): unexpected scause 0x000000000000000f (store/AMO page fault) pid=3
    	    sepc=0x00000000000000fe stval=0x0000000000003038
    ```

    <div class="src-block-caption">
      <span class="src-block-number">Code Snippet 3</span>:
      shell output
    </div>

<!--list-separator-->

-  how large is 1 byte?

    a int? a char?


## Address space {#address-space}