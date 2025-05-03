package com.example.countytrails;

import android.os.Bundle;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class TrailDetailActivity extends AppCompatActivity {

    TextView nameTextView, descriptionTextView, locationTextView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_trail_detail);

        nameTextView = findViewById(R.id.trail_name);
        descriptionTextView = findViewById(R.id.trail_description);
        locationTextView = findViewById(R.id.trail_location);

        // Get trail details from intent extras
        String name = getIntent().getStringExtra("trail_name");
        String description = getIntent().getStringExtra("trail_description");
        String location = getIntent().getStringExtra("trail_location");

        // Set text views
        nameTextView.setText(name);
        descriptionTextView.setText(description);
        locationTextView.setText(location);
    }
}
