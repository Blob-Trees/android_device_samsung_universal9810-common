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
    public var dolbyActive = dolbyCore.audioEffect.enabled

    override fun onStartListening() {
        updateTile()
    }

    override fun onClick() {
        if (dolbyActive == true) {
            dolbyActive = false
        } else {
            dolbyActive = true
        }
        updateTile()
    }

    private fun updateTile() {
        dolbyCore.audioEffect.enabled = dolbyActive
        val tile = qsTile
        tile.state =
            if (dolbyActive == true) Tile.STATE_ACTIVE else Tile.STATE_INACTIVE
        tile.updateTile()
    }
}
