package org.mapunity.projecttracker.controller;

import com.googlecode.jmapper.JMapper;
import org.mapunity.projecttracker.entity.ProjectTracker;
import org.mapunity.projecttracker.entity.contracts.ProjectTrackerDTO;
import org.mapunity.projecttracker.repository.ProjectRepository;
import org.mapunity.projecttracker.repository.ProjectTrackerRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.swing.text.html.Option;
import javax.validation.Valid;
import java.util.Optional;

@Controller
public class ProjectTrackerController {

    private final ProjectTrackerRepository projectTrackerRepository;

    public ProjectTrackerController(ProjectTrackerRepository projectTrackerRepository) {
        this.projectTrackerRepository = projectTrackerRepository;
    }


    @GetMapping("/")
    public String index() {
        return "redirect:/report/project-tracker";
    }

    @GetMapping("/project-tracker")
    public String getProjectTracker(Model model) {
        return "project-tracker-form";
    }

    @PostMapping("/project-tracker")
    public String saveProjectTracker(@Valid ProjectTracker projectTracker, BindingResult bindingResult, Model model) {
        if (!bindingResult.hasErrors())
            projectTracker = projectTrackerRepository.save(projectTracker);
        model.addAttribute("projectTracker", projectTracker);
        return "project-tracker-form";
    }

    @GetMapping("/project-tracker/{id}")
    public String showProjectTracker(@PathVariable Long id, Model model) {
        model.addAttribute("project", projectTrackerRepository.findById(id).get());
        return "project-tracker-edit-form";
    }

    @PostMapping("/project-tracker/{id}")
    public String updateProjectTracker(@ModelAttribute @Valid ProjectTrackerDTO projectTrackerDto,
                                       @PathVariable Long id,
                                       BindingResult bindingResult, Model model) {
        Optional<ProjectTracker> projectTracker = projectTrackerRepository.findById(id);
        if (!bindingResult.hasErrors() && projectTracker.isPresent()) {
            projectTracker = Optional.of(projectTrackerRepository
                    .save(new JMapper<>(ProjectTracker.class, ProjectTrackerDTO.class)
                            .getDestination(projectTracker.get(), projectTrackerDto)));
            model.addAttribute("projectTracker", projectTracker.get());
        }
        return "project-tracker-edit-form";
    }

    @GetMapping("/report/project-tracker")
    public String projectTrackerReport(Model model) {
        model.addAttribute("projectTrackers", projectTrackerRepository.findAll());
        return "project-tracker-report";
    }
}
