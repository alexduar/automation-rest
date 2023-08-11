package api.runner;

import io.cucumber.junit.CucumberOptions;
import net.serenitybdd.cucumber.CucumberWithSerenity;
import org.junit.runner.RunWith;

@RunWith(CucumberWithSerenity.class)
@CucumberOptions(
        plugin = {"pretty"},
        features = "src/test/resources/feature/consulta_componentes.feature",
        glue = {"api.app.home.componentesApi.steps"})
public class ComponentsAPIRunner {
}
