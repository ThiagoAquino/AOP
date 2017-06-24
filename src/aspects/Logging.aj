package aspects;
import healthwatcher.data.rdb.*;
import healthwatcher.model.employee.*;

import lib.util.Date;

public aspect Logging {
	
	pointcut search(): (execution (public Employee EmployeeRepositoryRDB.search(*)));
	pointcut update(): (execution (public void EmployeeRepositoryRDB.update(*)));
	
	after() returning(Employee m): search(){
		if(m != null){
			System.out.println("Empregado encontrado!");
		}else{
			System.out.println("Empregado não encontrado!");
		}
	}
	
	before(Employee employee): update() && args(employee) {
		System.out.println("Atualizando empregado "+ employee.getName());
	}
	
	pointcut proximaData(): (execution (public Date Date.proximaData()));
	
	before() : proximaData() {
		System.out.println("Calculando a próxima data");
	}
	
	pointcut qtdeDiaMes(): (execution (private int lib.util.Date.numeroDeDiasDoMes(*)));
	
	before(int mes) : qtdeDiaMes() && args(mes) && cflowbelow(proximaData()){
		System.out.println("Calculando a quantidade de dias do mes "+ mes);
	}
	
	pointcut sysoLogging(): (call (void java.io.PrintStream.println(*)));
	
	void around(): sysoLogging() && !(within(Logging)){
		
	}
	
}