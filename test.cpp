#include <array>
#include <iostream>

std::array<int, 4> gv1 = {0, 1, 2, 3};
std::array<int, 4> gv2 = {4, 5, 6 ,7};

int main() {
    printf("%d", gv2[1]);
}
