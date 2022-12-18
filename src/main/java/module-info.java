module fhv.ws22.se.skyward {
    requires org.apache.logging.log4j;
    requires jakarta.servlet;
    requires java.rmi;
    requires com.google.gson;


    exports fhv.ws22.se.skyward;
    opens fhv.ws22.se.skyward;

    exports fhv.ws22.se.skyward.domain.dtos;
    opens fhv.ws22.se.skyward.domain.service;
}