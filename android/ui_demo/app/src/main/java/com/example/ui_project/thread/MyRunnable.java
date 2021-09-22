package com.example.ui_project.thread;

import android.util.Log;

public class MyRunnable implements Runnable{
    final static String Tag = "runnable";
    @Override
    public void run() {
        Log.i(Tag,"当前线程id是"+ Thread.currentThread().getId());
    }
}
