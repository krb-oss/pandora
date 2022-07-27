#include "interface.h"

#include <istream>
#include <vector>

#include "puzzle.h"

std::vector<int> interface::read_board(std::istream& stream) {
    std::vector<int> board = {};

    // This solver only supports 4x4, and 9x9, sized boards. This means that
    // we're guaranteed to get numbers of maximum 1 character width.
    char c;
    while (stream.get(c)) {
        if (c == '.') board.push_back(BLANK);
        if (c >= '1' && c <= '9') board.push_back(c - '0');
    }

    return board;
}
