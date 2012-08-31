#include <common.h>

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

void _main(void)
{
    one_reset();
    two_reset();
    three_reset();
    four_reset();

    while (g_running) {
        run();
    }
}
