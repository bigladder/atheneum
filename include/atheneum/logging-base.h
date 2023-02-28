/* Copyright (c) 2019 Big Ladder Software LLC. All rights reserved.
 * See the LICENSE file for additional terms and conditions. */

#pragma once

#include <functional>
#include <string_view>
#include <string>


namespace Atheneum {

class LoggingBase {
  public: 
    virtual ~LoggingBase() = default;
    // TODO: apply rule of 5 for completeness, I think
    virtual void err(const std::string_view message) = 0;
    virtual void warn(const std::string_view message) = 0;
    virtual void debug(const std::string_view message) = 0;
    virtual void info(const std::string_view message) = 0;
    
    void set_context(void *context) { logging_context_ = context; };

  protected:
    void* logging_context_ {nullptr};
};

#if 0 // example of a client's extension the LoggingBase class
#include <fmt>
class EnergyPlusData;
class EPlusLogging : public LoggingBase {
  public: 
    virtual void err(const std::string_view message) {
        const std::pair<EnergyPlusData *, std::string>& contextPair = *(reinterpret_cast<std::pair<EnergyPlusData *, std::string> *>logging_context_);
        std::string fullMessage = fmt::format("{}: {}", contextPair.second, message);
        ShowSevereError(*contextPair.first, fullMessage);
        ShowFatalError(*contextPair.first, "Btwxt: Errors discovered, program terminates.");
    }
    //etc.
};
#endif

} // namespace Atheneum
