package Aspects;

public privileged aspect Exceptions {
	
	pointcut exception(): execution(public void lib.concurrency.ConcurrencyManager.beginExecution(*));
	
	declare soft : InterruptedException : exception();
	
	void around(): exception(){
		try {
			proceed();
		} catch (InterruptedException ex) {
			throw new RuntimeException(lib.concurrency.ConcurrencyManager.ERROR_MESSAGE + ex.getMessage());
		}
	}
}
