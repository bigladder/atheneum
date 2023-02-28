/* Copyright (c) 2019 Big Ladder Software LLC. All rights reserved.
 * See the LICENSE file for additional terms and conditions. */

#pragma once

#include "logging-base.h"

namespace Atheneum {

class AtheneumException : public std::exception {
  public:
    explicit AtheneumException(const char* message_) : message(message_) {}
    explicit AtheneumException(const std::string& message_) : message(message_) {}
    explicit AtheneumException(const std::string_view message_) : message(message_) {}
    virtual ~AtheneumException() noexcept = default;
    virtual const char* what() const noexcept { return message.c_str(); }

  protected:
    std::string message;
};

class LoggingBase;

class AtheneumPrivate {
  public:
    AtheneumPrivate(std::unique_ptr<LoggingBase> logger); 
    int answer();
  private:
    std::unique_ptr<LoggingBase> logger_; // use shared_ptr if you have to pass it down to compositional classes
    void log_err(const std::string_view msg) { if (logger_) {logger_.err(msg)} }
    void log_warn(const std::string_view msg) { if (logger_) {logger_.warn(msg)} }
    //etc.
};

} // namespace Atheneum
