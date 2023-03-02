/* Copyright (c) 2019 Big Ladder Software LLC. All rights reserved.
 * See the LICENSE file for additional terms and conditions. */

#pragma once

#include <memory>
#include <functional>
#include <string_view>

namespace Atheneum {

class AtheneumPrivate;

class Atheneum {
  public:
    Atheneum();
    ~Atheneum();
    int answer();

  private:
    std::unique_ptr<AtheneumPrivate> atheneum;
};

} // namespace Atheneum
