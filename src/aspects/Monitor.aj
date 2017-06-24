package aspects;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public aspect Monitor {
	@Retention(RetentionPolicy.RUNTIME)
	public @interface MonitorInterface {}

	@Retention(RetentionPolicy.RUNTIME)
	public @interface MonitorInterfaceType {}
	
	pointcut monitor(): (@annotation(MonitorInterface) || @within(MonitorInterfaceType))
	&& (execution(* *(..)) || execution(*.new(..)));

	Object around(): monitor() {
		long startTime = System.currentTimeMillis();
		Object obj = proceed();
		long totalTime = System.currentTimeMillis() - startTime;
		System.out.printf("Took %.3f seconds executing %s\n", totalTime/1000.0, thisJoinPoint);
		return obj;
	}

	// Methods to monitor
	declare @method: public * healthwatcher.model.employee.Employee.validatePassword(..): @MonitorInterface;

	// Types to monitor
	declare @type: healthwatcher.model.complaint.SpecialComplaint: @MonitorInterfaceType;
}
