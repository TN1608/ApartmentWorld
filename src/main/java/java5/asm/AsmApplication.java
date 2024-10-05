package java5.asm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "java5.asm.dao")
@EntityScan(basePackages = "java5.asm.model")
public class AsmApplication {

    public static void main(String[] args) {
        SpringApplication.run(AsmApplication.class, args);
    }

}
