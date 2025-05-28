/* Copyright (c) 2019 Big Ladder Software LLC. All rights reserved.
 * See the LICENSE file for additional terms and conditions. */

#pragma once

#include <memory>
#include <functional>
#include <string_view>

namespace Atheneum
{

class AtheneumPrivate;

class atheneum
{
  public:
    atheneum();
    ~atheneum();
    int Answer();

  private:
    std::unique_ptr<AtheneumPrivate> Atheneum;
};

} // namespace Atheneum
