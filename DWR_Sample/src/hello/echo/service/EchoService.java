package hello.echo.service;

public class EchoService {
	public String echo(String v) {
		System.out
				.println("Congratulations you have called the service from the server"
						+ "Using DWR with Spring integration, and your message is: "
						+ v);
		return "[" + v + "]";
	}
}
