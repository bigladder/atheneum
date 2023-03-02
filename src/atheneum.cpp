/* Copyright (c) 2019 Big Ladder Software LLC. All rights reserved.
 * See the LICENSE file for additional terms and conditions. */

#include <memory>

#include <fmt/format.h>

#include <atheneum/atheneum.h>

#include "atheneum-private.h"

namespace Atheneum {

Atheneum::Atheneum() { atheneum = std::unique_ptr<AtheneumPrivate>(new AtheneumPrivate()); }

Atheneum::~Atheneum() {}

int Atheneum::answer() { return atheneum->answer(); }

AtheneumPrivate::AtheneumPrivate() {}

int AtheneumPrivate::answer()
{
    int answer = 42;
    return answer;
}

} // namespace Atheneum
