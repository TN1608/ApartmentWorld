package java5.asm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "java5.asm.dao")
@EntityScan(basePackages = "java5.asm.model")
@EnableScheduling
public class AsmApplication {

    public static void main(String[] args) {
        SpringApplication.run(AsmApplication.class, args);
    }

}
