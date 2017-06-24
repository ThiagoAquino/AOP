package aspects;

public aspect DeclareStatements {

	declare warning : call(* java.sql..*(..)) && !within(healthwatcher.data..*)
	: "Apenas classes de dados podem importar JDBC.";

	declare error : call(healthwatcher.business.HealthWatcherFacade.new()) && !within(healthwatcher.business.HealthWatcherFacade)
	: "Não pode instanciar mais de uma fachada";

}
