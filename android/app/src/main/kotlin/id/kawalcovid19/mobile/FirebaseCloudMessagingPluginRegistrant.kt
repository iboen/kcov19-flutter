package id.kawalcovid19.mobile

import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin;

/**
 * Created by rrifafauzikomara on 3/9/20.
 */

object FirebaseCloudMessagingPluginRegistrant {
    fun registerWith(registry: PluginRegistry?) {
        if (alreadyRegisteredWith(registry)) {
            return
        }
        FirebaseMessagingPlugin.registerWith(registry?.registrarFor("io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin"))
    }

    private fun alreadyRegisteredWith(registry: PluginRegistry?): Boolean {
        val key = FirebaseCloudMessagingPluginRegistrant::class.java.canonicalName
        if (registry != null) {
            if (registry.hasPlugin(key)) {
                return true
            }
        }
        registry?.registrarFor(key)
        return false
    }
}