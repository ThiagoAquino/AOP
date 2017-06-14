package Aspects;

import healthwatcher.model.employee.Employee;
import lib.concurrency.ConcurrencyManager;

public privileged aspect ConcurrencyManagerAspect {
	private ConcurrencyManager manager = new ConcurrencyManager();

	pointcut concurrentInsert(): execution(public void healthwatcher.business.employee.EmployeeRecord.insert(Employee));

	void around(Employee employee): concurrentInsert() && args(employee) {
		manager.beginExecution(employee.getLogin());
		proceed(employee);
		manager.endExecution(employee.getLogin());
	}
}
