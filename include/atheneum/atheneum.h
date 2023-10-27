/* Copyright (c) 2019 Big Ladder Software LLC. All rights reserved.
 * See the LICENSE file for additional terms and conditions. */

#pragma once

#include <memory>
#include <functional>
#include <string_view>

namespace Atheneum
{

class AtheneumPrivate;

/// @class Atheneum::Atheneum atheneum.h
/// @brief Public interface file for for the Atheneum Pimpl idiom

class Atheneum
{
  public:
    Atheneum();

    ~Atheneum();

    // --------------------------------------------------------------------------------------------
    /// @brief	Call this function for the answer
    /// @return	The answer to life, the universe, and everything
    // --------------------------------------------------------------------------------------------
    int answer();

  private:
    std::unique_ptr<AtheneumPrivate> atheneum;
};

} // namespace Atheneum
