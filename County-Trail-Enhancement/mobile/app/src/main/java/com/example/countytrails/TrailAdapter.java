package com.example.countytrails;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

public class TrailAdapter extends RecyclerView.Adapter<TrailAdapter.TrailViewHolder> {

    private Context context;
    private List<Trail> trailList;

    public TrailAdapter(Context context, List<Trail> trailList) {
        this.context = context;
        this.trailList = trailList;
    }

    @Override
    public TrailViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(context).inflate(R.layout.trail_item, parent, false);
        return new TrailViewHolder(view);
    }

    @Override
    public void onBindViewHolder(TrailViewHolder holder, int position) {
        Trail trail = trailList.get(position);
        holder.nameTextView.setText(trail.getName());
        holder.locationTextView.setText(trail.getLocation());

        holder.itemView.setOnClickListener(v -> {
            Intent intent = new Intent(context, TrailDetailActivity.class);
            intent.putExtra("trail_name", trail.getName());
            intent.putExtra("trail_description", trail.getDescription());
            intent.putExtra("trail_location", trail.getLocation());
            context.startActivity(intent);
        });
    }

    @Override
    public int getItemCount() {
        return trailList.size();
    }

    public static class TrailViewHolder extends RecyclerView.ViewHolder {
        TextView nameTextView;
        TextView locationTextView;

        public TrailViewHolder(View itemView) {
            super(itemView);
            nameTextView = itemView.findViewById(R.id.trail_name);
            locationTextView = itemView.findViewById(R.id.trail_location);
        }
    }
}
