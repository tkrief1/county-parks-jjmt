package com.example.countytrails;

import android.content.Intent;
import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Navigate to TrailListActivity
        Intent intent = new Intent(this, TrailListActivity.class);
        startActivity(intent);
    }
}
