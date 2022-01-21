/*
 * SPDX-License-Identifier: Apache-2.0
 * Copyright (C) 2022 The LineageOS Project
 */

package com.samsung.dap

import android.service.quicksettings.Tile
import android.service.quicksettings.TileService
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.media.audiofx.AudioEffect
import android.util.Log

import java.util.*

class DolbyTile : TileService() {
    private var dolbyCore = DolbyCore()

    override fun onStartListening() {
        updateTile()
    }

    override fun onClick() {
        if (dolbyCore.audioEffect.enabled == true) {
            dolbyCore.audioEffect.enabled = false
        } else {
            dolbyCore.audioEffect.enabled = true
        }
        updateTile()
    }

    private fun updateTile() {
        val tile = qsTile
        tile.state =
            if (dolbyCore.audioEffect.enabled == true) Tile.STATE_ACTIVE else Tile.STATE_INACTIVE
        tile.updateTile()
    }
}
