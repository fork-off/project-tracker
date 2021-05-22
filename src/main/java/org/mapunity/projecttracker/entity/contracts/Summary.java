package org.mapunity.projecttracker.entity.contracts;

import lombok.Getter;
import org.mapunity.projecttracker.entity.ProjectTracker;

@Getter
public class Summary {
    private int count;
    private Double sum;

    public Summary(ProjectTracker project) {
        count = 1;
        sum = project.getCost();
    }

    public Summary() {
        count = 0;
        sum = 0D;
    }

    public void add(ProjectTracker b) {
        count++;
        sum += b.getCost();
    }

    public Summary merge(Summary another) {
        count += another.count;
        sum += another.sum;
        return this;
    }

}
