package com.internship.service;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication(exclude={DataSourceAutoConfiguration.class, HibernateJpaAutoConfiguration.class})
public class ServiceApplication {

    public static ConfigurableApplicationContext context;
    public static void main(String[] args) {
        context = SpringApplication.run(ServiceApplication.class, args);
    }

//    public static void restart() {
//        ApplicationArguments args = context.getBean(ApplicationArguments.class);
//
//        Thread thread = new Thread(() -> {
//            context.close();
//            context = SpringApplication.run(ServiceApplication.class, args.getSourceArgs());
//        });
//        thread.setDaemon(false);
//        thread.start();
//    }

}
