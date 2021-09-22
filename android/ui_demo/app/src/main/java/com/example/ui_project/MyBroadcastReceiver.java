package com.example.ui_project;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

public class MyBroadcastReceiver extends BroadcastReceiver {
    // action 名称
    String SMS_RECEIVED = "android.provider.Telephony.SMS_RECEIVED";

    public void onReceive(Context context, Intent intent) {
        Log.i("BroadcastReceiver","接收到广播"+intent.getAction());
        if (intent.getAction().equals(SMS_RECEIVED)) {
            // 一个receiver可以接收多个action的，即可以有多个intent-filter，需要在onReceive里面对intent.getAction(action name)进行判断。
        }
    }
}