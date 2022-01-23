/*
 * Copyright (C) 2019 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <fstream>

#include "StylusMode.h"

namespace vendor {
namespace samsung {
namespace touch {
namespace V1_0 {
namespace samsung {

bool StylusMode::isSupported() {
    std::ifstream file(TSP_CMD_LIST_NODE);
    if (file.is_open()) {
        std::string line;
        while (getline(file, line)) {
            if (!line.compare("hover_enable")) return true;
        }
        file.close();
    }
    return false;
}

// Methods from ::vendor::samsung::touch::V1_0::IStylusMode follow.
Return<bool> StylusMode::isEnabled() {
    std::ifstream file(TSP_CMD_RESULT_NODE);
    if (file.is_open()) {
        std::string line;
        getline(file, line);
        if (!line.compare("hover_enable,1:OK")) return true;
        file.close();
    }
    return false;
}

Return<bool> StylusMode::setEnabled(bool enabled) {
    std::ofstream file(TSP_CMD_NODE);
    file << "hover_enable," << (enabled ? "1" : "0");
    return true;
}

}  // namespace samsung
}  // namespace V1_0
}  // namespace touch
}  // namespace samsung
}  // namespace vendor