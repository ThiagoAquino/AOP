package aspects;

public aspect ArgumentCheck {
	
	pointcut employee(): within(healthwatcher.model.employee.Employee);
	
	pointcut employeeConstructor(String login, String password, String name): 
		employee() && execution(new(String, String, String)) && args(login, password, name);
	
	before(String login, String password, String name) : employeeConstructor(login, password, name) {
		if (login == null || password == null || name == null) {
			System.out.println("Null parameter at employee : " + thisJoinPoint);
		} else if (login.trim().length() == 0 || password.trim().length() == 0 || name.trim().length() == 0) {
			System.out.println("Empty string parameter at employee : " + thisJoinPoint);
		}
	}
}
