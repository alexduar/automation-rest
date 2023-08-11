package api;

import io.restassured.http.Header;
import io.restassured.http.Headers;
import io.restassured.response.Response;
import org.junit.Test;

import java.net.URI;
import java.net.URISyntaxException;

public class RequisicaoService {

    public static URI adicionaParametros(String url, String parameters) throws URISyntaxException {
        URI oldUri = new URI(url);
        if (!parameters.equals("")) {
            String dadosLimpos = CommonsUtils.ajustaPath(parameters);

            String newQuery = oldUri.getQuery();
            if (newQuery == null) {
                newQuery = dadosLimpos;
            } else {
                newQuery += "&" + dadosLimpos;
            }
            return new URI(oldUri.getScheme(), oldUri.getAuthority(),
                    oldUri.getPath(), newQuery, oldUri.getFragment());
        }
        return new URI(oldUri.getScheme(), oldUri.getAuthority(),
                oldUri.getPath(), oldUri.getQuery(), oldUri.getFragment());
    }

}
