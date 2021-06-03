package org.mapunity.projecttracker.controller;

import com.googlecode.jmapper.JMapper;
import org.mapunity.projecttracker.entity.ProjectTracker;
import org.mapunity.projecttracker.entity.contracts.ProjectTrackerDTO;
import org.mapunity.projecttracker.entity.contracts.Summary;
import org.mapunity.projecttracker.repository.ProjectTrackerRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collector;
import java.util.stream.Collectors;

@Controller
@RequestMapping("project-tracker")
public class ProjectTrackerController {

    private final ProjectTrackerRepository projectTrackerRepository;

    public ProjectTrackerController(ProjectTrackerRepository projectTrackerRepository) {
        this.projectTrackerRepository = projectTrackerRepository;
    }

    @GetMapping
    public String getProjectTracker() {
        return "project-tracker-form";
    }

    @PostMapping
    public String saveProjectTracker(@Valid ProjectTracker projectTracker, BindingResult bindingResult, RedirectAttributes ra) {
        if (!bindingResult.hasErrors())
            projectTracker = projectTrackerRepository.save(projectTracker);
        ra.addFlashAttribute("projectTracker", projectTracker);
        return "redirect:/project-tracker";
    }

    @GetMapping("edit/{id}")
    public String showProjectTracker(@PathVariable Long id, Model model, @RequestParam Optional<Boolean> saved) {
        ProjectTracker projectTracker = projectTrackerRepository.findById(id).get();
        model.addAttribute(saved.isPresent() ? "projectTracker" : "project", projectTracker);
        return "project-tracker-edit-form";
    }

    @PostMapping("edit/{id}")
    public String updateProjectTracker(@ModelAttribute @Valid ProjectTrackerDTO projectTrackerDto,
                                       @PathVariable Long id,
                                       BindingResult bindingResult, RedirectAttributes attributes) {
        Optional<ProjectTracker> projectTracker = projectTrackerRepository.findById(id);
        if (!bindingResult.hasErrors() && projectTracker.isPresent()) {
            projectTracker = Optional.of(projectTrackerRepository
                    .save(new JMapper<>(ProjectTracker.class, ProjectTrackerDTO.class)
                            .getDestination(projectTracker.get(), projectTrackerDto)));
        }
        return "redirect:/project-tracker/edit/" + id + "?saved=true";
    }

    @GetMapping("delete/{id}")
    public String updateProjectTracker(@PathVariable Long id, Model model) {
        projectTrackerRepository.delete(projectTrackerRepository.findById(id).get());
        return "redirect:/project-tracker/report";
    }

    @GetMapping("report")
    public String projectTrackerReport(Model model) {
        model.addAttribute("projectTrackers", projectTrackerRepository.findAll());
        return "project-tracker-report";
    }

    @GetMapping("report/summary")
    public String projectTrackerSummaryReport(Model model) {
        List<ProjectTracker> projectTrackers = projectTrackerRepository.findAll();
        if (!projectTrackers.isEmpty()) {
            model.addAttribute("hasData", true);
            Map<String, Summary> spatialData = projectTrackers.stream()
                    .collect(Collectors.groupingBy(proj -> proj.getSpatial().name(),
                            Collector.of(Summary::new, Summary::add, Summary::merge)));
            Map<String, Summary> typeData = projectTrackers.stream()
                    .collect(Collectors.groupingBy(proj -> proj.getType().name(),
                            Collector.of(Summary::new, Summary::add, Summary::merge)));
            Map<String, Summary> temporalData = projectTrackers.stream()
                    .collect(Collectors.groupingBy(proj -> proj.getTemporal().name(),
                            Collector.of(Summary::new, Summary::add, Summary::merge)));
            model.addAttribute("spatialData", spatialData);
            model.addAttribute("typeData", typeData);
            model.addAttribute("temporalData", temporalData);
        }
        return "project-tracker-report-summary";
    }
}
