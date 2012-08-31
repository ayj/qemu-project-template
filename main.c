#include <inttypes.h>
#include <stdbool.h>

bool g_running = true;
uint32_t g_counter = 0;

uint32_t update_counter(uint32_t counter) 
{
    return ++counter;
}

void run(void)
{
    g_counter = update_counter(g_counter);
}

void _start(void)
{
    while (g_running) {
        run();
    }
}
