package api.runner;

import io.cucumber.junit.CucumberOptions;
import net.serenitybdd.cucumber.CucumberWithSerenity;
import org.junit.runner.RunWith;

@RunWith(CucumberWithSerenity.class)
@CucumberOptions(
        plugin = {"pretty"},
        features = {"src/test/resources/feature/consulta_componentes.feature", "src/test/resources/feature/altera_organizacao_cards_home.feature", "src/test/resources/feature/testes_contrato.feature", "src/test/resources/feature/consulta_termos_busca_parcial.feature"},
        glue = {"api.app.home.componentesApi.steps", "api.app.home.cardsApi.steps", "api.app.home.buscaParcialApi.steps"})
public class TestRunner {
}
