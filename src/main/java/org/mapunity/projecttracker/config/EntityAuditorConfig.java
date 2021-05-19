package org.mapunity.projecttracker.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

import java.util.Optional;

@Configuration
@EnableJpaAuditing
class EntityAuditorConfig {

    @Bean
    AuditorAware<String> auditorProvider() {
        return () -> Optional.of("System");
    }
}