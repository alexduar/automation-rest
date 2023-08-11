package api.runner;

import io.cucumber.junit.CucumberOptions;
import net.serenitybdd.cucumber.CucumberWithSerenity;
import org.junit.runner.RunWith;

@RunWith(CucumberWithSerenity.class)
@CucumberOptions(
        plugin = {"pretty"},
        features = "src/test/resources/feature/altera_organizacao_cards_home.feature",
        glue = {"api.app.home.cardsApi.steps"})
public class ReorganizacaoCardsAPIRunner {
}
