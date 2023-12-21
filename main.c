/**
 * One day GT challenge.
*/

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define MAX_GT 1024
#define STACK_SIZE 8192

// x86 callee saved registers
typedef struct {
    uint64_t rsp, rbp, r12, r14, r15, r16;    
} ctx_t;

typedef struct {
    ctx_t ctx;
    uint8_t *stack;
    void *tls;
    enum {
        UNUSED = 0,
        READY = 1,
        RUNNING = 2,
    } state;   
} gt;

gt gt_arr[MAX_GT];
gt *cur_gt;

typedef void *(*func_ptr)(void *arg);
void dump_regs(ctx_t ctx);

void gt_return() {

}

void gt_yeild() {
 
    gt gt = gt_arr[0];  
    int i = 1;
    while (gt.state != READY && i < MAX_GT) {
        gt = gt_arr[i]; 
        i ++;
    }

    if (gt.state == READY) {
        printf("found a ready thread :D\n");

        ctx_t old, new;
        old = cur_gt->ctx;
        new = gt.ctx; 

        dump_regs(old);
        dump_regs(new);
    } else {
        printf("no ready threads found to yeild too D:\n");
    }
}

void gt_init() {
    cur_gt = &gt_arr[0];
    cur_gt->state = RUNNING;
}

int gt_start(func_ptr f, void *arg) {

    gt new_gt; 
    new_gt.stack = malloc(sizeof(STACK_SIZE));
    *(uint64_t*)&new_gt.stack[STACK_SIZE - 8] = (uint64_t)gt_return; 
    *(uint64_t*)&new_gt.stack[STACK_SIZE - 16] = (uint64_t)f;

    new_gt.ctx.rsp = (uint64_t)&new_gt.stack[STACK_SIZE - 16];
    new_gt.state = READY;

    int i = 0;
    gt free_gt;
    
    while (free_gt.state != UNUSED && i < MAX_GT) {
        free_gt = gt_arr[i];  
        if (free_gt.state == UNUSED) {
            break;
        }
        i++;
    }
    if (free_gt.state == UNUSED) {
        gt_arr[i] = new_gt;
    }

    return 0;
}

void *gt_function(void *arg) {
    int x = *(int*)(arg);
    printf("%d\n", x);
    return NULL;
}

int main() {
    gt_init();
    int x = 6;
    gt_start(gt_function, (void*)&x);
    gt_yeild(); // yeild the main threda to the created one

    printf("%lu", cur_gt->ctx.rsp);
}

void dump_regs(ctx_t ctx) {
    printf("rsp: 0x%lx\n", ctx.rsp); 
    printf("rbp: 0x%lx\n", ctx.rbp); 
    printf("r12: 0x%lx\n", ctx.r12); 
    printf("r14: 0x%lx\n", ctx.r14); 
    printf("r15: 0x%lx\n", ctx.r15); 
    printf("r16: 0x%lx\n", ctx.r16);    
}

