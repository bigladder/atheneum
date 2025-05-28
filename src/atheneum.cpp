/* Copyright (c) 2019 Big Ladder Software LLC. All rights reserved.
 * See the LICENSE file for additional terms and conditions. */

#include <memory>

#include <fmt/format.h>

#include <atheneum/atheneum.h>

#include "atheneum-private.h"

namespace Atheneum
{

atheneum::atheneum() { Atheneum = std::unique_ptr<AtheneumPrivate>(new AtheneumPrivate()); }

atheneum::~atheneum() {}

int atheneum::Answer() { return Atheneum->answer(); }

AtheneumPrivate::AtheneumPrivate() {}

int AtheneumPrivate::answer()
{
    int Answer = 42;
    return Answer;
}

} // namespace Atheneum
