package org.mapunity.projecttracker.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.mapunity.projecttracker.entity.enums.Spatial;
import org.mapunity.projecttracker.entity.enums.Temporal;
import org.mapunity.projecttracker.entity.enums.Type;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Table
@Entity
@Data
@EqualsAndHashCode
public class ProjectTracker extends AbstractEntity {

    private static final String PROJECT_INFO_SEQ = "PROJECT_INFO_SEQ";

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = PROJECT_INFO_SEQ)
    @SequenceGenerator(name = PROJECT_INFO_SEQ, sequenceName = PROJECT_INFO_SEQ, allocationSize = 1)
    private Long id;

    @NotNull
    private String projectName;

    @NotNull
    private Double cost;

    @Enumerated
    @NotNull
    private Spatial spatial;

    @Enumerated
    @NotNull
    private Temporal temporal;

    @Enumerated
    @NotNull
    private Type type;

}
