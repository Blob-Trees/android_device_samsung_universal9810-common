/*
 * Copyright (C) 2020 The Xiaomi-SM6250 Project
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
 * limitations under the License
 */
package com.samsung.parts

import android.content.Intent
import android.os.Bundle
import android.widget.Toast
import androidx.preference.Preference
import androidx.preference.PreferenceFragmentCompat
import androidx.preference.PreferenceManager
import androidx.preference.SwitchPreference
import com.samsung.parts.battery.BatteryActivity
import com.samsung.parts.fps.FPSInfoService
import com.samsung.parts.speaker.ClearSpeakerActivity

class DeviceSettings : PreferenceFragmentCompat(), Preference.OnPreferenceChangeListener {
    override fun onCreatePreferences(savedInstanceState: Bundle?, rootKey: String?) {
        System.loadLibrary("samsungparts_jni")
        setPreferencesFromResource(R.xml.preferences_samsung_parts, rootKey)
        val mContext = this.context
        val prefs = PreferenceManager.getDefaultSharedPreferences(mContext)
        val mClearSpeakerPref = findPreference<Preference>(PREF_CLEAR_SPEAKER)!!
        mClearSpeakerPref.onPreferenceClickListener =
            Preference.OnPreferenceClickListener {
                val intent = Intent(requireActivity().applicationContext, ClearSpeakerActivity::class.java)
                startActivity(intent)
                true
            }
        val mFpsInfo = findPreference<SwitchPreference>(PREF_KEY_FPS_INFO)!!
        mFpsInfo.isChecked = prefs.getBoolean(PREF_KEY_FPS_INFO, false)
        mFpsInfo.onPreferenceChangeListener = this
        val mFastCharge = findPreference<Preference>(PREF_BATTERY)!!
        mFastCharge.onPreferenceClickListener =
            Preference.OnPreferenceClickListener {
                val intent = Intent(requireActivity().applicationContext, BatteryActivity::class.java)
                startActivity(intent)
                true
            }
    }

    override fun onPreferenceChange(preference: Preference, value: Any): Boolean {
        when (preference.key) {
            PREF_KEY_FPS_INFO -> {
                val fps_enabled = value as Boolean
                val fpsinfo = Intent(this.context, FPSInfoService::class.java)
                if (fps_enabled) {
                    this.requireContext().startService(fpsinfo)
                } else {
                    this.requireContext().stopService(fpsinfo)
                }
            }
            else -> {
            }
        }
        return true
    }

    companion object {
        const val PREF_KEY_FPS_INFO = "fps_info"
        private const val PREF_CLEAR_SPEAKER = "clear_speaker_settings"
        const val PREF_BATTERY = "battery_settings"
    }
}