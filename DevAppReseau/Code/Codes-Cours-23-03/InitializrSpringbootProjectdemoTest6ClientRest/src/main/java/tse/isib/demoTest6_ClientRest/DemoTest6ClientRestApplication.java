package tse.isib.demoTest6_ClientRest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
public class DemoTest6ClientRestApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoTest6ClientRestApplication.class, args);
                  RestTemplate rst=new RestTemplate();
     Info info=rst.getForObject("http://localhost:8080/apijson", Info.class);
     
     // Traitement qcq de l'objet ....
        System.out.println(info.toString()+" via le main()");
	}

}
