package org.mapunity.projecttracker.repository;

import org.mapunity.projecttracker.entity.Project;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProjectRepository extends JpaRepository<Project, Long> {
}
