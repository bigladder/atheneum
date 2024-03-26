/* Copyright (c) 2019 Big Ladder Software LLC. All rights reserved.
 * See the LICENSE file for additional terms and conditions. */

#pragma once

#include <memory>
#include <functional>
#include <string_view>

namespace Atheneum
{

class AtheneumPrivate;

/// @class Atheneum atheneum.h
/// @brief Public interface for for the Atheneum Pimpl idiom

class Atheneum
{
  public:
    Atheneum();

    ~Atheneum();

    // --------------------------------------------------------------------------------------------
    /// @brief Call this function for the answer
    /// @param default_answer Parameter specifically for documentation only
    /// @return	The answer to life, the universe, and everything
    // --------------------------------------------------------------------------------------------
    int answer(int default_answer = 42);

  private:
    std::unique_ptr<AtheneumPrivate> atheneum;
};

} // namespace Atheneum
