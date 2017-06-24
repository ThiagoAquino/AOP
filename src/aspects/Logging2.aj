package aspects;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public aspect Logging2 {

	@Retention(RetentionPolicy.RUNTIME)
	public @interface LoggingInterface {}

	@Retention(RetentionPolicy.RUNTIME)
	public @interface LoggingInterfaceType {}
	
	pointcut log(): (@annotation(LoggingInterface) || @within(LoggingInterfaceType))
	&& (execution(* *(..)) || execution(*.new(..)));

	before(): log() {
		System.out.println(thisJoinPoint);
	}

	// Methods to log
	declare @method: public * healthwatcher.model.employee.Employee.validatePassword(..): @LoggingInterface;

	// Types to log
	declare @type: healthwatcher.model.complaint.SpecialComplaint: @LoggingInterfaceType;

}
