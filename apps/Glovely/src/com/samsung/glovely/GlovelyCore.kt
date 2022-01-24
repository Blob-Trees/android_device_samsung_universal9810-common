/*
 * SPDX-License-Identifier: Apache-2.0
 * Copyright (C) 2022 The LineageOS Project
 */

package com.samsung.glovely

import android.service.quicksettings.Tile
import android.service.quicksettings.TileService
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log

import java.util.*

class GlovelyCore : BroadcastReceiver() {
    public var GlovelyActive = false
    val spListener = SharedPreferences.OnSharedPreferenceChangeListener { sp, key ->
        when(key) {
            SamsungSettings.gloveMode -> {
                val value = sp.getBoolean(key, false)
                val cmd = if(value) "glove_mode,1" else "glove_mode,0"
                val ret = tsCmd(cmd)
                Log.e("Glovely", "Setting glove mode to $cmd got $ret")
            }
        }
    }

    override fun onReceive(context: Context, intent: Intent) {
        
    }

    companion object {
        public const val TAG = "Glovely"
    }
}
