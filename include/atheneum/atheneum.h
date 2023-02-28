/* Copyright (c) 2019 Big Ladder Software LLC. All rights reserved.
 * See the LICENSE file for additional terms and conditions. */

#pragma once

#include <memory>
#include <functional>
#include <string_view>

namespace Atheneum {

enum class MessageLevel;
using LoggingCallbackFunction = std::function<void(MessageLevel, const std::string_view, void*)>;

class AtheneumPrivate;
class LoggingBase;

class Atheneum {
  public:
    Atheneum(LoggingBase *logger_dependency);
    ~Atheneum();
    int answer();

  private:
    std::unique_ptr<AtheneumPrivate> atheneum;
};

} // namespace Atheneum
