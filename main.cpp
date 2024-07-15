// #include "raylib-cpp/raylib-cpp.hpp"

// const int WINDOW_WIDTH = 800;
// const int WINDOW_HEIGHT = 450;
// const int TEXT_X = 190;
// const int TEXT_Y = 200;
// const int TEXT_SIZE = 20;

// int main() {
//     raylib::Window window(WINDOW_WIDTH, WINDOW_HEIGHT, "raylib-cpp - basic window");

//     SetTargetFPS(60);
//     while (!window.ShouldClose()) {
//         BeginDrawing();
//         {
//             window.ClearBackground(RAYWHITE);
//             DrawText("Congrats! You created your first window!", TEXT_X, TEXT_Y, TEXT_SIZE, LIGHTGRAY);
//         }
//         EndDrawing();
//     }
//     return 0;
// }

#include <iostream>
#include <format>
#include <ranges>
#include <vector>

int main() {
    std::vector<int> numbers = {1, 2, 3, 4, 5};
    std::cout << std::format("{}", numbers);
}