package com.springlooks.product_service.config;

import io.swagger.v3.oas.models.ExternalDocumentation;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OpenApiConfig {

    @Bean
    public OpenAPI productServiceApiDocumentation() {
        return new OpenAPI().info(new Info()
                        .title("Spring Looks Product API")
                        .description("Product Catalogue API for the Spring Looks Web Application")
                        .version("v0.0.1")
                        .license(new License().name("Apache 2.0")))
                    .externalDocs(new ExternalDocumentation()
                        .description("You can refer to the wiki for more information")
                        .url("https://fake-wiki.com/docs"));

    }
}
