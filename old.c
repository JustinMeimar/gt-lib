// /**
//  * One day GT challenge.
// */
// #include <unistd.h>
// #include <stdio.h>
// #include <stdbool.h>
// #include <stdlib.h>
// #include <stdint.h>
//
// #define MAX_GT 2
// #define STACK_SIZE 0x40000
//
// // pthread esque signature
// typedef void *(*func_ptr)(void *arg);
//
// // x86 callee saved registers
// typedef struct {
//     uint64_t rsp, rbp, r12, r14, r15, r16;    
// } ctx_t;
//
// typedef struct {
//     uint32_t id; 
//     ctx_t ctx;
//     uint8_t *stack; 
//     enum {
//         UNUSED = 0,
//         READY = 1,
//         RUNNING = 2,
//     } state;   
// } gt;
//
// extern void gt_switch(ctx_t *old, ctx_t *new);
// void dump_regs(ctx_t ctx);
// bool gt_yield();
//
// gt gt_arr[MAX_GT];
// gt *cur_gt;
//
// void print_gt_table() { 
//     for (int i =0; i < MAX_GT; i++) {
//         gt tr = gt_arr[i];
//         printf("------------\n");
//         printf("id: %d\n", tr.id);
//         printf("state: %d\n", tr.state);
//         dump_regs(tr.ctx);
//     }
// }
//
// void 
// __attribute__((noreturn))
// gt_return() {
//
//     printf("\nin gt_return\n"); 
//     
//     if (cur_gt->id != 1) {
//         printf("");
//         cur_gt->state = UNUSED;
//         gt_yield();
//     }
//
//     while(gt_yield())
//         ;
//
//     printf("no more threads to run\n");
//
//     exit(1);
// }
//
//
// bool gt_yield() {
//     
//     int x = 5;
//     
//     printf("enter yield\n");
//     printf("print innocent variable: %d\n", x);
//     printf("cur_gt: %d, %d\n", cur_gt->state, cur_gt->state == READY);
//     printf("yeilding thread: %d\n", cur_gt->id);
//     
//     gt *rdy_gt = cur_gt;
//
//     while (rdy_gt->state != READY) {
//         printf("iter\n");
//         if (rdy_gt++ == &gt_arr[MAX_GT])
//             rdy_gt = &gt_arr[0];
//         if (rdy_gt == cur_gt)
//             return false;
//     }
//    
//     printf("cur_gt: %d, %d\n", cur_gt->id, cur_gt->state);
//     printf("rdy_gt: %d, %d\n", rdy_gt->id, rdy_gt->state);
//     
//     if (rdy_gt->state == READY) {
//
//         printf("yeilding from :%d to %d\n", cur_gt->id, rdy_gt->id);
//         ctx_t *old, *new;
//             
//         rdy_gt->state = RUNNING; 
//         old = &cur_gt->ctx;
//         new = &rdy_gt->ctx;
//         cur_gt = rdy_gt;
//     
//         gt_switch(old, new);
//         
//         return true;
//     } 
//     return false;
// }
//
// void gt_init() {
//     cur_gt = &gt_arr[0];
//     cur_gt->id = 1;
//     cur_gt->state = RUNNING;
// }
//
// int gt_start(func_ptr f, void *arg) {
//     
//     static uint32_t id = 2;
//     gt new_gt;  
//     
//     // find empty slot in gt_arr
//     gt* free_gt = cur_gt; 
//     while (free_gt->state != UNUSED) {
//         if (++free_gt == &gt_arr[MAX_GT])
//             free_gt = &gt_arr[0];
//         if (free_gt == cur_gt)
//             return -1;
//     }   
//   
//     new_gt.stack = malloc(STACK_SIZE);
//     *(uint64_t*)&new_gt.stack[STACK_SIZE - 8] = (uint64_t)gt_return; 
//     *(uint64_t*)&new_gt.stack[STACK_SIZE - 16] = (uint64_t)f; 
//     
//     new_gt.ctx.rsp = (uint64_t)&new_gt.stack[STACK_SIZE - 16]; 
//     new_gt.state = READY;
//     new_gt.id = id++; 
//     
//     *free_gt = new_gt;
//     
//     return 0;
// }
//
// void *gt_function(void *arg) {
//     printf("gt switched to me!\n");
//     print_gt_table();
//     int a,b,c,d,e,f,g,h;
//     a = 0x1;
//     b = 0x10;
//     c = 0x100;
//     d = 0x1000;
//     e = 0x10000;
//    
//     print_gt_table();
//         
//     sleep(1);
//     return NULL;
// }
//
// int main() {
//     gt_init();
//     
//     int x = 6;
//
//     gt_start(gt_function, (void*)&x);
//     // gt_start(gt_function, (void*)&x);
//     // gt_start(gt_function, (void*)&x);
//     
//     print_gt_table(); 
//     gt_return();
//
//     printf("returned to main thread\n");
// }
//
// void dump_regs(ctx_t ctx) {
//     printf("rsp: 0x%lx\n", ctx.rsp); 
//     printf("rbp: 0x%lx\n", ctx.rbp); 
//     printf("r12: 0x%lx\n", ctx.r12); 
//     printf("r14: 0x%lx\n", ctx.r14); 
//     printf("r15: 0x%lx\n", ctx.r15); 
//     printf("r16: 0x%lx\n", ctx.r16);    
// }
