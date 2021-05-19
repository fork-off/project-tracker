package org.mapunity.projecttracker.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Table
@Entity
@Data
@EqualsAndHashCode
public class Project extends AbstractEntity {

    private static final String PROJECT_SEQ = "PROJECT_SEQ";

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = PROJECT_SEQ)
    @SequenceGenerator(name = PROJECT_SEQ, sequenceName = PROJECT_SEQ, allocationSize = 1)
    private Long id;

    @NotBlank
    private String name;

    @NotBlank
    private String description;
}
