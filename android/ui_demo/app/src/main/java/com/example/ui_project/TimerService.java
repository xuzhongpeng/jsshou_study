package com.example.ui_project;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Notification;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.util.Log;
import android.view.WindowManager;
import android.widget.TextView;

import java.sql.Time;
import java.util.Timer;
import java.util.TimerTask;

public class TimerService extends Service {
//    private Activity context;
    private TextView txtView;
    private TimerService service;

    public TimerService() {
//        this.context = context;
    }
    public static final String TAG = "MyService";
    @Override
    public void onCreate() {
        super.onCreate();
//        Notification notification = new Notification(R.drawable.i,
//                "有通知到来", System.currentTimeMillis());
//        Intent notificationIntent = new Intent(this, MainActivity.class);
//        PendingIntent pendingIntent = PendingIntent.getActivity(this, 0,
//                notificationIntent, 0);
//        notification.setLatestEventInfo(this, "这是通知的标题", "这是通知的内容",
//                pendingIntent);
//        startForeground(1, notification);
        Log.d(TAG, "onCreate() executed");
        Log.i("zp","onCreate " + Thread.currentThread().getId());
    }
    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        Log.i("zp", "onStartCommand - startId = " + startId + ", Thread ID = " + Thread.currentThread().getId());
        service = this;
        handler.postDelayed(runnable, 3000);
        return super.onStartCommand(intent, flags, startId);
    }
    @Override
    public IBinder onBind(Intent intent) {
        Log.i("zp", "onBind - Thread ID = " + Thread.currentThread().getId());
//        txtView = (TextView)context.findViewById(R.id.text);

//        handler.postDelayed(runnable, 1000);
        return null;
    }
    Handler handler = new Handler();

    private int recLen = 0;

    Runnable runnable = new Runnable() {
        @Override
        public void run() {
            recLen++;
            Log.i("xp",recLen+"");
            if(recLen > 3){
//                Intent intent = new Intent(service, MainActivity.class);
//                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
//                startActivity(intent);
                Intent dialogIntent = new Intent(TimerService.this, MainActivity.class);
                dialogIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(dialogIntent);
            }
            handler.postDelayed(this, 3000);
        }
    };
    @Override
    public void onDestroy() {
        Log.i("zp", "onDestroy - Thread ID = " + Thread.currentThread().getId());
        handler.removeCallbacks(runnable);
        super.onDestroy();
    }
}