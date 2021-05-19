package org.mapunity.projecttracker.controller;

import org.mapunity.projecttracker.entity.Project;
import org.mapunity.projecttracker.repository.ProjectRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller
public class ProjectController {

    private final ProjectRepository projectRepository;

    public ProjectController(ProjectRepository projectRepository) {
        this.projectRepository = projectRepository;
    }

    @GetMapping("/project")
    public String formGet() {
        return "project-form";
    }

    @PostMapping("/project")
    public String formPost(@Valid Project project, BindingResult bindingResult, Model model) {
        if (!bindingResult.hasErrors())
            project = projectRepository.save(project);
        model.addAttribute("project", project);
        return "project-form";
    }
}
