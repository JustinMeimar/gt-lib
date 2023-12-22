#include <unistd.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdint.h>

#define MAX_GT 2
#define STACK_SIZE 0x40000

// x86 callee saved registers
typedef struct {
    uint64_t rsp, rbp, r12, r14, r15, r16;    
} ctx_t;

typedef struct {
    uint32_t id; 
    ctx_t ctx;
    uint8_t *stack; 
    enum {
        UNUSED = 0,
        READY = 1,
        RUNNING = 2,
    } state;   
} gt_t;

#define MAX_GREEN_THREADS 4

gt_t gt_arr[MAX_GREEN_THREADS];

extern void gt_switch(ctx_t *old, ctx_t *new);

void func() {

    printf("i am func\n");
    printf("main gt rsp: 0x%lx\n", gt_arr[0].ctx.rsp); 
    printf("func gt rsp: 0x%lx\n", gt_arr[1].ctx.rsp);
    
    gt_switch(&gt_arr[1].ctx, &gt_arr[0].ctx);
    
    return;
}

void ret() {
    printf("i am ret\n");
    exit(0);
}

int main() {
    
    gt_t *func_gt, *main_gt; 
    ctx_t func_ctx, main_ctx;
    
    // store thread strcutres in a global array
    main_gt = &gt_arr[0];
    func_gt = &gt_arr[1];
    
    // set up the func green thread
    func_gt->stack = (uint8_t*)malloc(STACK_SIZE);
    func_gt->state = READY;
    *(uint64_t*)&func_gt->stack[STACK_SIZE - 16] = (uint64_t)func;
    *(uint64_t*)&func_gt->stack[STACK_SIZE - 8] = (uint64_t)ret;
    func_ctx.rsp = (uint64_t)&func_gt->stack[STACK_SIZE-16]; 
    
    // assign contexts to threads
    func_gt->ctx = func_ctx;
    main_gt->ctx = main_ctx;

    gt_switch(&main_gt->ctx, &func_gt->ctx);
    
    printf("i am main\n");

    return 0;
}
