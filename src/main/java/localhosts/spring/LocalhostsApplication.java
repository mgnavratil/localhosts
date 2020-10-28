package localhosts.spring;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.jdbc.core.JdbcTemplate;

@SpringBootApplication
public class LocalhostsApplication implements CommandLineRunner{

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private static final Logger log = LoggerFactory.getLogger(LocalhostsApplication.class);
	  
	public static void main(String[] args) {
		SpringApplication.run(LocalhostsApplication.class, args);
	}

	@Override
	public void run(String... strings) throws Exception {

	    log.info("running");
	  }
}
