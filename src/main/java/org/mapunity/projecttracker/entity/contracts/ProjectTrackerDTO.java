package org.mapunity.projecttracker.entity.contracts;

import com.googlecode.jmapper.annotations.JGlobalMap;
import lombok.Getter;
import lombok.Setter;
import org.mapunity.projecttracker.entity.enums.Spatial;
import org.mapunity.projecttracker.entity.enums.Temporal;
import org.mapunity.projecttracker.entity.enums.Type;

import javax.validation.constraints.NotNull;

@Getter
@Setter
@JGlobalMap
public class ProjectTrackerDTO {

    @NotNull
    private Long id;

    @NotNull
    private String projectName;

    @NotNull
    private Double cost;

    @NotNull
    private Spatial spatial;

    @NotNull
    private Temporal temporal;

    @NotNull
    private Type type;
}
