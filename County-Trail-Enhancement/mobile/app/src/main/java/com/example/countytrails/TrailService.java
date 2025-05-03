package com.example.countytrails;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;

public class TrailService extends Service {
    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        // Implement service to fetch data, such as from a server or database
        return START_NOT_STICKY;
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
}
