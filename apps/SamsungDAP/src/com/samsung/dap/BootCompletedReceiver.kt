/*
 * SPDX-License-Identifier: Apache-2.0
 * Copyright (C) 2022 The LineageOS Project
 */

package com.samsung.dap

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.media.audiofx.AudioEffect
import android.util.Log

import java.util.UUID

class BootCompletedReceiver : BroadcastReceiver() {
    private val audioEffect = AudioEffect(
        EFFECT_TYPE_DAP, AudioEffect.EFFECT_TYPE_NULL, 0, 0
    )

    override fun onReceive(context: Context, intent: Intent) {
        Log.d(TAG, "Starting")
        audioEffect.setParameter(EFFECT_PARAM_EFF_ENAB, 1)
        audioEffect.setParameter(EFFECT_PARAM_PROFILE, PROFILE_AUTO)
        audioEffect.enabled = true
    }

    companion object {
        private const val TAG = "SamsungDAP"

        private val EFFECT_TYPE_DAP = UUID.fromString("46d279d9-9be7-453d-9d7c-ef937f675587")

        private const val EFFECT_PARAM_PROFILE = 0
        private const val EFFECT_PARAM_STEREO_WIDENING_DISTANCE = 1
        private const val EFFECT_PARAM_EFF_ENAB = 19

        private const val PROFILE_AUTO = 0
        private const val PROFILE_MOVIE = 1
        private const val PROFILE_MUSIC = 2
        private const val PROFILE_VOICE = 3
        private const val PROFILE_GAME = 4
        private const val PROFILE_OFF = 5
        private const val PROFILE_GAME_1 = 6
        private const val PROFILE_GAME_2 = 7
        private const val PROFILE_SPACIAL_AUDIO = 8
    }
}