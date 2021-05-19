package org.mapunity.projecttracker.repository;

import org.mapunity.projecttracker.entity.ProjectTracker;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProjectTrackerRepository extends JpaRepository<ProjectTracker, Long> {
}
