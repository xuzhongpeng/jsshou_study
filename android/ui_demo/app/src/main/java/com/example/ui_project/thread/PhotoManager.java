package com.example.ui_project.thread;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class PhotoManager {
    static PhotoManager sInstance;
    static Handler mHandler;
    private static int NUMBER_OF_CORES =
            Runtime.getRuntime().availableProcessors();
    ThreadPoolExecutor mDecodeThreadPool;
    static  {
        // Creates a single static instance of PhotoManager
        sInstance = new PhotoManager();
        mHandler = new Handler(Looper.getMainLooper()) {
            /*
             * handleMessage() defines the operations to perform when
             * the Handler receives a new Message to process.
             */
            @Override
            public void handleMessage(Message inputMessage) {
            }
        };
    }
    private PhotoManager() {
        final BlockingQueue<Runnable> mDecodeWorkQueue;
        // Instantiates the queue of Runnables as a LinkedBlockingQueue
        mDecodeWorkQueue = new LinkedBlockingQueue<Runnable>();
         final int KEEP_ALIVE_TIME = 1;
        // Sets the Time Unit to seconds
         final TimeUnit KEEP_ALIVE_TIME_UNIT = TimeUnit.SECONDS;
        // Creates a thread pool manager
        mDecodeThreadPool = new ThreadPoolExecutor(
                NUMBER_OF_CORES,       // Initial pool size
                NUMBER_OF_CORES,       // Max pool size
                KEEP_ALIVE_TIME,
                KEEP_ALIVE_TIME_UNIT,
                mDecodeWorkQueue);
    }
//    public void handleState(PhotoTask photoTask, int state) {
//        switch (state) {
//            // The task finished downloading the image
//            case DOWNLOAD_COMPLETE:
//                // Decodes the image
//                mDecodeThreadPool.execute(
//                        photoTask.getPhotoDecodeRunnable());
//        }
//    }
//
//    static public PhotoTask startDownload(
//            PhotoView imageView,
//            boolean cacheFlag) {
//        // Adds a download task to the thread pool for execution
//        sInstance.
//                mDownloadThreadPool.
//                execute(downloadTask.getHTTPDownloadRunnable());
//    }

}
