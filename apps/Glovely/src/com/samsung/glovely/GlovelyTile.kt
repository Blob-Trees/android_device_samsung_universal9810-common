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

class GlovelyTile : TileService() {
    private var glcore = GlovelyCore()

    override fun onStartListening() {
        updateTile()
    }

    override fun onClick() {
        glcore.switchGlovelyMode()
        updateTile()
    }

    private fun updateTile() {
        val tile = qsTile
        tile.state =
            if glcore.GlovelyActive == true) Tile.STATE_ACTIVE else Tile.STATE_INACTIVE
        tile.updateTile()
    }
}
